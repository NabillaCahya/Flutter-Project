import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String nama = "";
  String email = "";
  File? fotoProfil;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('userName') ?? '';
      email = prefs.getString('userEmail') ?? '';
      final fotoPath = prefs.getString('fotoProfil');
      if (fotoPath != null && fotoPath.isNotEmpty) {
        fotoProfil = File(fotoPath);
      }
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        fotoProfil = File(picked.path);
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('fotoProfil', picked.path);
    }
  }

  Future<void> _gantiNama() async {
    final controller = TextEditingController(text: nama);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ganti Nama'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nama Baru'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, controller.text), child: const Text('Simpan')),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        nama = result.trim();
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', nama);
    }
  }

  Future<void> _hapusAkun() async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Akun'),
        content: const Text('Yakin ingin menghapus akun? Semua data akan hilang secara permanen!'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Hapus')),
        ],
      ),
    );

    if (konfirmasi == true) {
      try {
        // Hapus data dari Firebase
        final userId = await _getUserId(); // Pastikan Anda memiliki metode untuk mendapatkan userId
        if (userId != null) {
          await FirebaseFirestore.instance.collection('users').doc(userId).delete();
        }

        // Hapus data lokal
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();

        // Navigasi ke halaman login
        Navigator.of(context).pushReplacementNamed('/login');
      } catch (e) {
        // Tampilkan pesan error jika ada masalah
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus akun: $e')),
        );
      }
    }
  }

  Future<void> _logout() async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Keluar Akun'),
        content: const Text('Yakin ingin keluar dari akun ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
    if (konfirmasi == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('userName');
      await prefs.remove('userEmail');
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryText = const Color(0xFF7B5B6B);
    final Color cardColor = Colors.white;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/bgprofile.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Header Card (tanpa border radius bawah)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundColor: const Color(0xFFD6C2E0),
                            backgroundImage: fotoProfil != null
                                ? FileImage(fotoProfil!)
                                : null,
                            child: fotoProfil == null
                                ? const Icon(Icons.person, size: 48, color: Color(0xFFB07B8D))
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.shade300),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(Icons.camera_alt, size: 20, color: Color(0xFF7B5B6B)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: _gantiNama,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              nama.isNotEmpty ? nama : "Nama User",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: primaryText,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.edit, size: 18, color: Color(0xFFB07B8D)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email.isNotEmpty ? email : "email@contoh.com",
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Menu (tinggi bisa diatur)
                SizedBox(
                  height: 150, // Ganti sesuai kebutuhan
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    padding: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.delete_forever, color: Colors.red),
                          title: const Text('Hapus Akun'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: _hapusAkun,
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout, color: Color(0xFF7B5B6B)),
                          title: const Text('Keluar Akun'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: _logout,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
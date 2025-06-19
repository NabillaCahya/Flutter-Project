import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_screen.dart';
import 'jurusan_kampus.dart'; // Pastikan sudah ada file ini!
import 'tugas_menu.dart'; // Tambahkan import ini

const List<String> daftarJurusan = [
  'Sastra', 'Jurnalistik', 'Komunikasi', 'Psikologi', 'Pendidikan Bahasa', 'Hukum', 'Sosiologi', 'Linguistik', 'Antropologi', 'Sejarah', 'Pariwisata', 'Kesejahteraan Sosial', 'Kimia', 'Biologi', 'Kedokteran', 'Farmasi', 'Fisika', 'Teknik Elektro', 'Teknik Mesin', 'Geologi', 'Geografi', 'Teknik Pertambangan', 'Keperawatan', 'Fisioterapi', 'Meteorologi', 'Akuntansi', 'Ekonomi', 'Keuangan', 'Manajemen Pemasaran', 'Bisnis Digital', 'Manajemen Logistik', 'Supply Chain Management', 'Manajemen', 'Kewirausahaan', 'Statistika', 'Desain Grafis', 'Arsitektur', 'Seni Rupa', 'Animasi', 'Desain Komunikasi Visual', 'Interior Design', 'Sinematografi', 'Seni Patung', 'Matematika', 'Teknik Industri', 'Ilmu Komputer', 'Teknik Informatika', 'Data Science', 'Sistem Informasi', 'Teknik Komputer'
];

class HomeAfterTest extends StatefulWidget {
  final String userId;

  const HomeAfterTest({super.key, required this.userId});

  @override
  _HomeAfterTestState createState() => _HomeAfterTestState();
}

class _HomeAfterTestState extends State<HomeAfterTest> {
  int _selectedIndex = 0;
  String? _selectedManualMajor;

  Future<List<String>> fetchRekomendasiJurusan() async {
    final doc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
    final data = doc.data();
    if (data != null && data['testResult'] != null) {
      return List<String>.from(data['testResult']);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildAfterTestContent(context),
      TugasMenu(userId: widget.userId), // <-- Ganti di sini
      const ProfileScreen(),
    ];

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F6F8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: _selectedIndex == 0
              ? const Text(
                  'Beranda',
                  style: TextStyle(
                    color: Color(0xFF7B5B6B),
                    fontWeight: FontWeight.bold,
                  ),
                )
              : _selectedIndex == 1
                  ? const Text(
                      'Tugas',
                      style: TextStyle(
                        color: Color(0xFF7B5B6B),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      'Profil',
                      style: TextStyle(
                        color: Color(0xFF7B5B6B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          backgroundColor: Colors.white,
          elevation: 8,
          selectedItemColor: const Color(0xFF7B5B6B),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        body: SafeArea(
          child: pages[_selectedIndex],
        ),
      ),
    );
  }

  Widget _buildAfterTestContent(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchRekomendasiJurusan(),
      builder: (context, snapshot) {
        final rekomendasi = snapshot.data ?? [];
        final selectedMajor = _selectedManualMajor ?? (rekomendasi.isNotEmpty ? rekomendasi[0] : null);
        final kampusList = selectedMajor != null ? jurusanKampus[selectedMajor] ?? [] : [];
        final prospekList = selectedMajor != null ? jurusanProspek[selectedMajor] ?? [] : [];

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBanner(),
                const SizedBox(height: 16),

                // Search Bar
                _buildSearchBar(rekomendasi, selectedMajor),

                const SizedBox(height: 10),

                // Rekomendasi Jurusan
                const Text(
                  'Rekomendasi Jurusan',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B5B6B),
                  ),
                ),
                const SizedBox(height: 14),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : rekomendasi.isNotEmpty
                          ? Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: rekomendasi.map((jurusan) {
                                final bool isActive = _selectedManualMajor == jurusan;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedManualMajor = jurusan; 
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? const Color(0xFFEEE2F6) // Warna aktif
                                          : const Color(0xFFF9F6FB), // Warna default
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: isActive
                                            ? const Color(0xFF7B5B6B) // Border aktif
                                            : const Color(0xFFB07B8D), // Border default
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      jurusan,
                                      style: TextStyle(
                                        color: isActive
                                            ? const Color(0xFF7B5B6B) // Warna teks aktif
                                            : const Color(0xFF7B5B6B), // Warna teks default
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          : const Text('Belum ada rekomendasi jurusan.'),
                ),

                const SizedBox(height: 18),

                // Rekomendasi Kampus
                _buildRekomendasiKampus(kampusList),

                const SizedBox(height: 25),

                // Prospek Kerja
                _buildProspekKerja(selectedMajor, prospekList),

                const SizedBox(height: 18),

                // Informasi Beasiswa
                const Text(
                  'Informasi Beasiswa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B5B6B),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                _beasiswaCard('assets/bsi.png', 'BSI Scholarship', '1 April 2025'),
                const SizedBox(height: 15),
                _beasiswaCard('assets/bank_indonesia.png', 'Bank Indonesia', '3 April 2025'),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBanner() {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEED1DE),
            Color(0xFFAE8799),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 2,
            left: 98,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/banner_test.png',
                width: 250,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tes Minat dan Bakatmu\ndalam 10 menit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.pushNamed(context, '/quiz', arguments: widget.userId);
                    if (result == true) {
                      setState(() {
                        _selectedManualMajor = null; // reset ke hasil tes terbaru
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 162, 114, 136),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  ),
                  child: const Text(
                    'Tes Sekarang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
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

  Widget _kampusCard(String asset, String nama, Color gradientStart, Color gradientEnd) {
    return Container(
      margin: EdgeInsets.zero,
      height: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientStart,
            gradientEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0D7F3), width: 1),
        boxShadow: [
          BoxShadow(
            color: gradientStart.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, width: 48, height: 48),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              nama,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF7B5B6B),
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _beasiswaCard(String asset, String nama, String tanggal) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0D7F3), width: 1),
      ),
      child: Row(
        children: [
          Image.asset(asset, width: 38, height: 38),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              nama,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF7B5B6B),
                fontSize: 14,
              ),
            ),
          ),
          Text(
            tanggal,
            style: const TextStyle(
              color: Color(0xFFB07B8D),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value, {Color? warna}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: const Color(0xFFB07B8D)),
          const SizedBox(width: 8),
          SizedBox(
            width: 90, // Lebar label agar rata
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF7B5B6B),
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: Color(0xFF7B5B6B),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: warna ?? const Color(0xFF7B5B6B),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(List<String> rekomendasi, String? selectedMajor) {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () async {
                final jurusan = await showModalBottomSheet<String>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                  builder: (context) {
                    return SizedBox(
                      height: 350,
                      child: ListView.builder(
                        itemCount: daftarJurusan.length,
                        itemBuilder: (context, i) => ListTile(
                          title: Text(daftarJurusan[i]),
                          onTap: () => Navigator.pop(context, daftarJurusan[i]),
                          selected: daftarJurusan[i] == selectedMajor,
                          selectedTileColor: const Color(0xFFF8E5DE),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    );
                  },
                );
                if (jurusan != null) {
                  setState(() {
                    _selectedManualMajor = jurusan;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _selectedManualMajor ?? (rekomendasi.isNotEmpty ? rekomendasi[0] : 'Pilih Jurusan yang Kamu Inginkan'),
                    style: TextStyle(
                      color: _selectedManualMajor != null ? const Color(0xFF7B5B6B) : Colors.grey[500],
                      fontSize: 14,
                      fontWeight: _selectedManualMajor != null ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFFB07B8D)),
            onPressed: () async {
              final jurusan = await showModalBottomSheet<String>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                builder: (context) {
                  return SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: daftarJurusan.length,
                      itemBuilder: (context, i) => ListTile(
                        title: Text(daftarJurusan[i]),
                        onTap: () => Navigator.pop(context, daftarJurusan[i]),
                        selected: daftarJurusan[i] == selectedMajor,
                        selectedTileColor: const Color(0xFFF8E5DE),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  );
                },
              );
              if (jurusan != null) {
                setState(() {
                  _selectedManualMajor = jurusan;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRekomendasiKampus(List kampusList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rekomendasi Kampus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B5B6B),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: kampusList.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: kampusList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (context, i) {
                    final kampus = kampusList[i];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (kampus['banner'] != null)
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                      child: Image.asset(
                                        kampus['banner'],
                                        width: double.infinity,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            if (kampus['logo'] != null)
                                              Image.asset(kampus['logo'], width: 38, height: 38),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                kampus['nama'] ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Color(0xFF7B5B6B),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          kampus['deskripsi'] ?? '',
                                          style: const TextStyle(fontSize: 14, color: Color(0xFF7B5B6B)),
                                        ),
                                        const SizedBox(height: 10),
                                        _infoRow(Icons.star, 'Akreditasi', kampus['akreditasi'] ?? '-'),
                                        _infoRow(Icons.attach_money, 'Biaya', kampus['biaya'] ?? '-'),
                                        _infoRow(Icons.people, 'Siswa', kampus['siswa'] ?? '-'),
                                        _infoRow(Icons.person, 'Dosen', kampus['dosen'] ?? '-'),
                                        _infoRow(Icons.language, 'Website', kampus['website'] ?? '-'),
                                        _infoRow(Icons.email, 'Email', kampus['email'] ?? '-'),
                                        _infoRow(Icons.phone, 'Telepon', kampus['telepon'] ?? '-'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                        );
                      },
                      child: _kampusCard(
                        kampus['logo'],
                        kampus['nama'],
                        Color(kampus['gradientStart']),
                        Color(kampus['gradientEnd']),
                      ),
                    );
                  },
                )
              : const Text('Belum ada rekomendasi kampus untuk jurusan ini.'),
        ),
      ],
    );
  }

  Widget _buildProspekKerja(String? selectedMajor, List<dynamic> prospekList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Prospek Kerja',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B5B6B),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        if (selectedMajor != null && prospekList.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFFF8F8), // gradasi cerah
                  Color(0xFFF8E5DE), // gradasi gelap
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < prospekList.length; i++) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prospekList[i].keys.first,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF623840),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        prospekList[i].values.first,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7B5B6B),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  if (i != prospekList.length - 1)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(
                        color: Color(0xFFBEA7A6),
                        thickness: 1,
                        height: 1,
                      ),
                    ),
                ]
              ],
            ),
          )
        else
          const Text('Belum ada data prospek kerja untuk jurusan ini.'),
      ],
    );
  }
}

class BannerButton extends StatelessWidget {
  const BannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7B5B6B),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      child: const Text('Belajar Sekarang'),
    );
  }
}
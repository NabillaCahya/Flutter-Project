import 'package:flutter/material.dart';
import 'soal_screen.dart';
import 'soal_data.dart'; // Pastikan file ini ada dan berisi daftar soal tiap materi
import 'package:cloud_firestore/cloud_firestore.dart';
import 'score_screen.dart'; // Buat file ini nanti

class TryoutDetailScreen extends StatefulWidget {
  final String userId; // <-- Tambahkan ini agar dinamis

  const TryoutDetailScreen({super.key, required this.userId});

  @override
  State<TryoutDetailScreen> createState() => _TryoutDetailScreenState();
}

class _TryoutDetailScreenState extends State<TryoutDetailScreen> with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  bool _showFullDesc = false;

  final String fullDesc =
      'Tryout UTBK 1 ini dirancang khusus untuk membantu peserta mempersiapkan diri menghadapi UTBK SNBT 2025 dengan soal-soal yang sesuai kisi-kisi terbaru. Tryout ini mencakup Tes Potensi Skolastik (TPS) yang menguji penalaran umum, pemahaman bacaan, menulis, dan pengetahuan kuantitatif, serta Tes Literasi yang meliputi literasi Bahasa Indonesia, Bahasa Inggris, dan penalaran matematika. Melalui tryout ini, peserta dapat mengukur kesiapan mereka dan memperoleh analisis hasil untuk meningkatkan performa dalam ujian sebenarnya.';

  final skolastikMateri = const [
    _Materi(
      title: 'Penalaran Induktif',
      soal: 10,
      menit: 10,
      soalKey: 'induktif',
    ),
    _Materi(
      title: 'Penalaran Deduktif',
      soal: 10,
      menit: 10,
      soalKey: 'deduktif',
    ),
    _Materi(
      title: 'Penalaran Kuantitatif',
      soal: 10,
      menit: 10,
      soalKey: 'kuantitatif',
    ),
    _Materi(
      title: 'Pengetahuan dan Pemahaman Umum',
      soal: 20,
      menit: 15,
      soalKey: 'pumum',
    ),
    _Materi(
      title: 'Pemahaman Bacaan dan Menulis',
      soal: 20,
      menit: 25,
      soalKey: 'bacaan',
    ),
    _Materi(
      title: 'Pengetahuan Kuantitatif',
      soal: 20,
      menit: 20,
      soalKey: 'pkuantitatif',
    ),
  ];

  final literasiMateri = const [
    _Materi(
      title: 'Literasi Bahasa Indonesia',
      soal: 30,
      menit: 42,
      menitTambahan: 30,
      soalKey: 'indo',
    ),
    _Materi(
      title: 'Literasi Bahasa Inggris',
      soal: 20,
      menit: 20,
      soalKey: 'inggris',
    ),
    _Materi(
      title: 'Penalaran Matematika',
      soal: 20,
      menit: 42,
      menitTambahan: 30,
      soalKey: 'matematika',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final materiList = _selectedTab == 0 ? skolastikMateri : literasiMateri;
    final int totalBab = skolastikMateri.length + literasiMateri.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tryout UTBK 1', // Pastikan hanya UTBK 1
          style: TextStyle(
            color: Color(0xFF7B5B6B),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF7B5B6B)),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!.data() as Map<String, dynamic>? ?? {};
          final List utbkProgress = data['utbkProgress'] ?? [];
          final bool semuaSelesai = utbkProgress.length == totalBab;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/utbk_banner.png', // Ganti dengan asset banner kamu
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Info
                  const Text(
                    'Tryout UTBK 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF623840),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kolom kiri
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, size: 16, color: Color(0xFF7B5B6B)),
                                SizedBox(width: 4),
                                Text('Tim UTBK Mastery', style: TextStyle(fontSize: 12, color: Color(0xFF7C5453))),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.timer, size: 16, color: Color(0xFF7B5B6B)),
                                SizedBox(width: 4),
                                Text('3 jam 15 menit', style: TextStyle(fontSize: 12, color: Color(0xFF7C5453))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Kolom kanan
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.school, size: 16, color: Color(0xFF7B5B6B)),
                                SizedBox(width: 4),
                                Text('5000+ Siswa', style: TextStyle(fontSize: 12, color: Color(0xFF7C5453))),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.star, size: 16, color: Color(0xFF7B5B6B)),
                                SizedBox(width: 4),
                                Text('Semua Tingkatan', style: TextStyle(fontSize: 12, color: Color(0xFF7C5453))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Deskripsi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF623840),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Builder(
                    builder: (context) {
                      if (_showFullDesc) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fullDesc,
                              style: const TextStyle(
                                color: Color(0xFF7B5B6B),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showFullDesc = false;
                                });
                              },
                              child: const Text(
                                'Tampilkan Lebih Sedikit',
                                style: TextStyle(
                                  color: Color(0xFFB07B8D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color(0xFF7B5B6B),
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: '${fullDesc.substring(0, 110)}...',
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showFullDesc = true;
                                    });
                                  },
                                  child: const Text(
                                    ' Baca Selengkapnya',
                                    style: TextStyle(
                                      color: Color(0xFFB07B8D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 14),

                  // Tab
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F6F8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _TabButton(
                          label: 'Tes Potensi Skolastik',
                          selected: _selectedTab == 0,
                          onTap: () => setState(() => _selectedTab = 0),
                        ),
                        _TabButton(
                          label: 'Tes Literasi',
                          selected: _selectedTab == 1,
                          onTap: () => setState(() => _selectedTab = 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // List Materi
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: materiList.length,
                    itemBuilder: (context, i) {
                      final materi = materiList[i];
                      final daftarSoal = soalBank[materi.soalKey] ?? [];

                      // Cek histori bab
                      final histori = utbkProgress.firstWhere(
                        (e) => e['judulBab'] == materi.title,
                        orElse: () => null,
                      );
                      final prevDone = i == 0 ||
                          utbkProgress.any((e) => e['judulBab'] == materiList[i - 1].title);

                      final isHistori = histori != null;
                      final isActive = !isHistori && prevDone;
                      final isLocked = !isHistori && !prevDone;

                      return _MateriTile(
                        nomor: (i + 1).toString().padLeft(2, '0'),
                        materi: materi,
                        isHistori: isHistori,
                        isActive: isActive,
                        isLocked: isLocked,
                        histori: histori,
                        onTap: isHistori
                            ? () {
                                // Buka histori: tampilkan soal, jawaban, waktu pengerjaan (readonly)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SoalScreen(
                                      daftarSoal: daftarSoal,
                                      judul: materi.title,
                                      userId: widget.userId,
                                      waktuMenit: materi.menit,
                                      histori: histori, // <-- histori dikirim
                                      isHistori: true,  // <-- mode histori
                                    ),
                                  ),
                                );
                              }
                            : isActive
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SoalScreen(
                                          daftarSoal: daftarSoal,
                                          judul: materi.title,
                                          userId: widget.userId,
                                          waktuMenit: materi.menit,
                                        ),
                                      ),
                                    );
                                  }
                                : null,
                      );
                    },
                  ),

                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: semuaSelesai
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ScoreScreen(
                                    utbkProgress: utbkProgress,
                                  ),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: semuaSelesai ? const Color(0xFF7B5B6B) : Colors.grey[300],
                        foregroundColor: semuaSelesai ? Colors.white : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'LIHAT SKOR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: semuaSelesai ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? const Color(0xFFB07B8D) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? const Color(0xFFB07B8D) : const Color(0xFFB7A7A7),
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _Materi {
  final String title;
  final int soal;
  final int menit;
  final int? menitTambahan;
  final String soalKey; // <-- Tambahkan ini untuk mapping soal

  const _Materi({
    required this.title,
    required this.soal,
    required this.menit,
    this.menitTambahan,
    required this.soalKey,
  });
}

class _MateriTile extends StatelessWidget {
  final String nomor;
  final _Materi materi;
  final bool isHistori;
  final bool isActive;
  final bool isLocked;
  final Map<String, dynamic>? histori;
  final VoidCallback? onTap;

  const _MateriTile({
    required this.nomor,
    required this.materi,
    this.isHistori = false,
    this.isActive = false,
    this.isLocked = false,
    this.histori,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String waktu = materi.menitTambahan != null
        ? '${materi.menit},${materi.menitTambahan} menit'
        : '${materi.menit} menit';

    Color bgColor;
    Color borderColor;
    Color textColor;
    IconData iconData;

    if (isHistori) {
      bgColor = const Color(0xFFD0F5E8); // hijau muda
      borderColor = const Color(0xFF4CAF50); // hijau
      textColor = const Color(0xFF388E3C); // hijau tua
      iconData = Icons.check_circle;
      if (histori?['lamaWaktu'] != null) {
        waktu = histori!['lamaWaktu']; // tampilkan waktu pengerjaan
      }
    } else if (isActive) {
      bgColor = const Color(0xFFFDF6F3); // pink muda
      borderColor = const Color(0xFFB07B8D);
      textColor = const Color(0xFF7B5B6B);
      iconData = Icons.play_circle_fill;
    } else {
      bgColor = Colors.white;
      borderColor = Colors.transparent;
      textColor = const Color(0xFFB7A7A7);
      iconData = Icons.lock;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: borderColor,
            width: isActive || isHistori ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  nomor,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materi.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${materi.soal} soal, $waktu',
                    style: const TextStyle(
                      color: Color(0xFFB7A7A7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              iconData,
              color: borderColor,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final List utbkProgress;
  const ScoreScreen({super.key, required this.utbkProgress});

  @override
  Widget build(BuildContext context) {
    // Kelompokkan bab TPS dan Literasi
    final tpsBab = utbkProgress.where((e) =>
      e['judulBab'].toString().contains('Penalaran') ||
      e['judulBab'].toString().contains('Pengetahuan') ||
      e['judulBab'].toString().contains('Pemahaman')
    ).toList();

    final literasiBab = utbkProgress.where((e) =>
      e['judulBab'].toString().contains('Literasi') ||
      e['judulBab'].toString().contains('Matematika')
    ).toList();

    // Konversi skor per bab ke skala UTBK (200-800)
    List<int> skorBabUtbkList = utbkProgress.map<int>((bab) {
      double skorBab100 = (bab['skorBab100'] ?? 0).toDouble();
      return (200 + (skorBab100 * 6)).round();
    }).toList();

    // Hitung skor akhir UTBK dari rata-rata skor bab yang sudah dikonversi
    int skorAkhir;
    if (skorBabUtbkList.isNotEmpty) {
      double rataRata = skorBabUtbkList.reduce((a, b) => a + b) / skorBabUtbkList.length;
      skorAkhir = rataRata.round();
    } else {
      skorAkhir = 200;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Hasil Tryout UTBK',
          style: TextStyle(
            color: Color(0xFF7B5B6B),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF7B5B6B)),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Selamat! Kamu mendapatkan skor:',
                style: TextStyle(
                  color: Color(0xFF7B5B6B),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$skorAkhir',
                style: const TextStyle(
                  color: Color(0xFFB07B8D),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 18),
              // TPS
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tes Potensi Skolastik (TPS)',
                  style: TextStyle(
                    color: Color(0xFF7B5B6B),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              ...tpsBab.map((bab) => _ScoreRow(
                title: bab['judulBab'] ?? '-',
                score: (200 + ((bab['skorBab100'] ?? 0) * 6)).round(),
              )),
              const SizedBox(height: 12),
              // Literasi
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tes Literasi',
                  style: TextStyle(
                    color: Color(0xFF7B5B6B),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              ...literasiBab.map((bab) => _ScoreRow(
                title: bab['judulBab'] ?? '-',
                score: (200 + ((bab['skorBab100'] ?? 0) * 6)).round(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreRow extends StatelessWidget {
  final String title;
  final int score;
  const _ScoreRow({required this.title, required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF7B5B6B),
                fontSize: 14,
              ),
            ),
          ),
          Text(
            ': $score',
            style: const TextStyle(
              color: Color(0xFFB07B8D),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
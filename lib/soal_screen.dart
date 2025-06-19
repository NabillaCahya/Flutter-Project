import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SoalScreen extends StatefulWidget {
  final List daftarSoal;
  final String judul;
  final String userId;
  final int waktuMenit;
  final Map<String, dynamic>? histori;
  final bool isHistori;

  const SoalScreen({
    Key? key,
    required this.daftarSoal,
    required this.judul,
    required this.userId,
    required this.waktuMenit,
    this.histori,
    this.isHistori = false,
  }) : super(key: key);

  @override
  State<SoalScreen> createState() => _SoalScreenState();
}

class _SoalScreenState extends State<SoalScreen> {
  int currentSoal = 0;
  List<int?> jawabanUser = [];
  Timer? timer;
  int sisaDetik = 0;
  bool selesai = false;
  double skorBab100 = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isHistori && widget.histori != null) {
      // Mode histori: jawaban dari histori, tidak ada timer
      List<dynamic> historiJawaban = widget.histori!['jawabanUser'] ?? [];
      jawabanUser = List<int?>.from(historiJawaban.map((e) => e is int ? e : null));
      selesai = true;
    } else {
      jawabanUser = List.filled(widget.daftarSoal.length, null);
      sisaDetik = widget.waktuMenit * 60;
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (sisaDetik > 0) {
          setState(() {
            sisaDetik--;
          });
        } else {
          _submit();
        }
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _submit() async {
    timer?.cancel();
    setState(() {
      selesai = true;
    });

    int benar = 0, salah = 0, kosong = 0;
    for (int i = 0; i < widget.daftarSoal.length; i++) {
      if (jawabanUser[i] == null) {
        kosong++;
        continue;
      }
      if (jawabanUser[i] == widget.daftarSoal[i].jawabanBenar) {
        benar++;
      } else {
        salah++;
      }
    }

    // Hitung skor dalam skala 0-100
    int skorBab = (benar * 4) - (salah * 1);
    int skorMaksBab = widget.daftarSoal.length * 4;
    skorBab100 = skorMaksBab > 0 ? (skorBab / skorMaksBab) * 100 : 0;

    // Konversi skor ke skala UTBK (200-800)
    int skorBabUtbk = (200 + (skorBab100 * 6)).round();

    final babProgress = {
      'judulBab': widget.judul,
      'benar': benar,
      'salah': salah,
      'kosong': kosong,
      'skorBab': skorBab,
      'skorBab100': skorBab100,
      'skorBabUtbk': skorBabUtbk, // Simpan skor UTBK
      'jumlahSoal': widget.daftarSoal.length,
      'updatedAt': DateTime.now().toIso8601String(),
      'jawabanUser': jawabanUser,
      'lamaWaktu': _formatWaktu(widget.waktuMenit * 60 - sisaDetik),
    };

    try {
      await FirebaseFirestore.instance.collection('users').doc(widget.userId).set({
        'utbkProgress': FieldValue.arrayUnion([babProgress])
      }, SetOptions(merge: true));
    } catch (e) {
      // Handle error
    }
  }

  String _formatWaktu(int detik) {
    final m = (detik ~/ 60).toString().padLeft(2, '0');
    final s = (detik % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  Widget nomorSoalGrid({
    required int totalSoal,
    required int currentSoal,
    required List<int?> jawabanUser,
    required void Function(int) onTap,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.3, // proporsional, bisa diubah sesuai selera
        ),
        itemCount: totalSoal,
        itemBuilder: (context, i) {
          bool active = (i) == currentSoal;
          bool answered = jawabanUser[i] != null;
          return GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              decoration: BoxDecoration(
                color: active
                    ? const Color(0xFFB07B8D)
                    : answered
                        ? const Color(0xFFF3E3E8)
                        : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: active
                      ? const Color(0xFFB07B8D)
                      : const Color(0xFFE0D7D7),
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: active
                        ? Colors.white
                        : const Color(0xFF7B5B6B),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final soal = widget.daftarSoal[currentSoal];

    // MODE HISTORI (readonly)
    if (widget.isHistori && widget.histori != null) {
      final lamaWaktu = widget.histori!['lamaWaktu'] ?? '-';
      final List<dynamic> historiJawaban = widget.histori!['jawabanUser'] ?? [];

      return Scaffold(
        backgroundColor: const Color(0xFFF8F6F8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF7B5B6B)),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.judul,
            style: const TextStyle(
              color: Color(0xFF7B5B6B),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lama waktu pengerjaan
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0F5E8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      lamaWaktu,
                      style: const TextStyle(
                        color: Color(0xFF388E3C),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.check_circle, color: Color(0xFF4CAF50)),
                ],
              ),
              const SizedBox(height: 10),
              // Progress bar
              LinearProgressIndicator(
                value: (currentSoal + 1) / widget.daftarSoal.length,
                minHeight: 6,
                backgroundColor: const Color(0xFFF3E3E8),
                color: const Color(0xFFB07B8D),
              ),
              const SizedBox(height: 18),
              // Card soal
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pertanyaan ${currentSoal + 1}/${widget.daftarSoal.length}",
                      style: const TextStyle(
                        color: Color(0xFFB07B8D),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      soal.soal,
                      style: const TextStyle(
                        color: Color(0xFF7B5B6B),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Opsi jawaban (readonly)
                    ...List.generate(soal.opsi.length, (i) {
                      bool selected = historiJawaban[currentSoal] == i;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: selected ? const Color(0xFFF3E3E8) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selected ? const Color(0xFFB07B8D) : const Color(0xFFE0D7D7),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                soal.opsi[i],
                                style: TextStyle(
                                  color: selected ? const Color(0xFFB07B8D) : const Color(0xFF7B5B6B),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            if (selected)
                              const Icon(Icons.check_circle, color: Color(0xFFB07B8D), size: 22),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Navigasi soal (readonly)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: currentSoal > 0
                          ? () {
                              setState(() {
                                currentSoal--;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B5B6B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: const Text('Sebelumnya', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: currentSoal < widget.daftarSoal.length - 1
                          ? () {
                              setState(() {
                                currentSoal++;
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B5B6B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: Text(
                        currentSoal < widget.daftarSoal.length - 1 ? 'Selanjutnya' : 'Selesai',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Nomor soal (readonly, grid 5 kolom)
              nomorSoalGrid(
                totalSoal: widget.daftarSoal.length,
                currentSoal: currentSoal,
                jawabanUser: List<int?>.from(historiJawaban.map((e) => e is int ? e : null)),
                onTap: (i) {
                  setState(() {
                    currentSoal = i;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    // MODE NORMAL (bisa kerjakan)
    return WillPopScope(
      onWillPop: () async {
        if (!selesai) {
          final keluar = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Konfirmasi'),
              content: const Text('Apakah Anda ingin mengakhiri kuis dan keluar?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Ya, Keluar'),
                ),
              ],
            ),
          );
          return keluar == true;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F6F8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF7B5B6B)),
            onPressed: () async {
              if (!selesai) {
                final keluar = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah Anda ingin mengakhiri kuis dan keluar?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Ya, Keluar'),
                      ),
                    ],
                  ),
                );
                if (keluar == true) Navigator.pop(context);
              } else {
                Navigator.pop(context);
              }
            },
          ),
          title: Text(
            widget.judul,
            style: const TextStyle(
              color: Color(0xFF7B5B6B),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: selesai
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 64),
                    const SizedBox(height: 16),
                    const Text(
                      "Waktu Habis / Selesai!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF7B5B6B)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Jawaban kamu sudah terkirim.",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "Skor Bab: ${(200 + (skorBab100 * 6)).round()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF7B5B6B),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 32), // Tambah padding bawah
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timer & progress
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E3E8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _formatWaktu(sisaDetik),
                            style: const TextStyle(
                              color: Color(0xFFB07B8D),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.help_outline, color: Color(0xFFB07B8D)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Progress bar
                    LinearProgressIndicator(
                      value: (currentSoal + 1) / widget.daftarSoal.length,
                      minHeight: 6,
                      backgroundColor: const Color(0xFFF3E3E8),
                      color: const Color(0xFFB07B8D),
                    ),
                    const SizedBox(height: 18),
                    // Card soal
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pertanyaan ${currentSoal + 1}/${widget.daftarSoal.length}",
                            style: const TextStyle(
                              color: Color(0xFFB07B8D),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            soal.soal,
                            style: const TextStyle(
                              color: Color(0xFF7B5B6B),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Opsi jawaban
                          ...List.generate(soal.opsi.length, (i) {
                            bool selected = jawabanUser[currentSoal] == i;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  jawabanUser[currentSoal] = i;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                decoration: BoxDecoration(
                                  color: selected ? const Color(0xFFF3E3E8) : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: selected ? const Color(0xFFB07B8D) : const Color(0xFFE0D7D7),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        soal.opsi[i],
                                        style: TextStyle(
                                          color: selected ? const Color(0xFFB07B8D) : const Color(0xFF7B5B6B),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    if (selected)
                                      const Icon(Icons.check_circle, color: Color(0xFFB07B8D), size: 22),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Navigasi soal
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: currentSoal > 0
                                ? () {
                                    setState(() {
                                      currentSoal--;
                                    });
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7B5B6B),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              disabledBackgroundColor: Colors.grey[300],
                            ),
                            child: const Text('Sebelumnya', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: currentSoal < widget.daftarSoal.length - 1
                                ? () {
                                    setState(() {
                                      currentSoal++;
                                    });
                                  }
                                : _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7B5B6B),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              disabledBackgroundColor: Colors.grey[300],
                            ),
                            child: Text(
                              currentSoal < widget.daftarSoal.length - 1 ? 'Selanjutnya' : 'Kirim',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // Nomor soal (grid 5 kolom, dinamis, anti overflow)
                    nomorSoalGrid(
                      totalSoal: widget.daftarSoal.length,
                      currentSoal: currentSoal,
                      jawabanUser: jawabanUser,
                      onTap: (i) {
                        setState(() {
                          currentSoal = i;
                        });
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_after_test.dart';
import 'jurusan_details.dart';

class ResultScreen extends StatefulWidget {
  final Map<String, int> majorScores;
  final String userId;

  const ResultScreen({Key? key, required this.majorScores, required this.userId}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isLoading = false;
  String? selectedMajor;

  Future<void> saveTestResultToFirestore(String userId, List<String> majors, int score) async {
    if (userId.isEmpty) {
      throw Exception('User ID tidak boleh kosong!');
    }
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'testResult': majors,
      'score': score,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    final sortedMajors = widget.majorScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final int highestScore = sortedMajors.isNotEmpty ? sortedMajors.first.value : 0;
    final filteredMajors = sortedMajors
        .where((entry) => entry.value == highestScore)
        .map((entry) => entry.key)
        .take(5)
        .toList();

    if (selectedMajor == null && filteredMajors.isNotEmpty) {
      selectedMajor = filteredMajors[0];
    }

    final int totalSoal = 5;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F8),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background2.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Tes Penjurusan',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7B5B6B),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Hore! Kamu telah berhasil menyelesaikan Tes Penjurusan. Yuk cari tahu hasilnya!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF976E6C),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text(
                                'Progress',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF7B5B6B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: 1.0,
                                    backgroundColor: Colors.grey.shade300,
                                    color: const Color(0xFFB07B8D),
                                    minHeight: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '$totalSoal/$totalSoal',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF7B5B6B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            'assets/medali.png',
                            height: 200,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      // Rekomendasi Jurusan Grid
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.10),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Rekomendasi Jurusan',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7B5B6B),
                              ),
                            ),
                            const SizedBox(height: 14),
                            if (filteredMajors.isEmpty)
                              const Text(
                                'Belum ada rekomendasi jurusan.\nSilakan coba lagi dan pilih jawaban yang sesuai.',
                                style: TextStyle(fontSize: 13, color: Color(0xFF7B5B6B)),
                                textAlign: TextAlign.center,
                              )
                            else
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: filteredMajors.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 2.3,
                                ),
                                itemBuilder: (context, idx) {
                                  final major = filteredMajors[idx];
                                  final isSelected = selectedMajor == major;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedMajor = major;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      decoration: BoxDecoration(
                                        color: isSelected ? const Color(0xFF7B5B6B) : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: isSelected ? const Color(0xFF7B5B6B) : const Color(0xFFB07B8D),
                                          width: 1.5,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                                      child: Text(
                                        major,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: isSelected ? Colors.white : const Color(0xFFB07B8D),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            if (selectedMajor != null && jurusanDetails[selectedMajor!] != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      jurusanDetails[selectedMajor!]!['desc'] ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '🧠 Ciri Khas 🧠',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF7B5B6B),
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          jurusanDetails[selectedMajor!]!['ciri'] ?? '',
                                          style: const TextStyle(fontSize: 13, color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '🎯 Peluang Karier 🎯',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF7B5B6B),
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          jurusanDetails[selectedMajor!]!['peluang'] ?? '',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Tombol Kembali ke Beranda
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  setState(() => _isLoading = true);
                                  try {
                                    await saveTestResultToFirestore(
                                        widget.userId, filteredMajors, highestScore);
                                    final prefs = await SharedPreferences.getInstance();
                                    await prefs.setString('userId', widget.userId);
                                    await prefs.setBool('hasCompletedTest_${widget.userId}', true);
                                    await prefs.setString('lastPage', 'home_after_test');
                                    if (!context.mounted) return;
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeAfterTest(userId: widget.userId)),
                                      (route) => false,
                                    );
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Gagal menyimpan hasil: $e')),
                                      );
                                    }
                                  } finally {
                                    if (mounted) setState(() => _isLoading = false);
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7B5B6B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Kembali ke Beranda',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                      // Tidak ada widget apapun di bawah tombol!
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
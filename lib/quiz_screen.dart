import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'questions.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentPage = 0;
  final int questionsPerPage = 5;
  Map<int, String> selectedAnswers = {};

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool areAllQuestionsAnswered(int startIndex, int endIndex) {
    for (int i = startIndex; i < endIndex; i++) {
      if (!selectedAnswers.containsKey(i)) {
        return false;
      }
    }
    return true;
  }

  Future<bool> _onWillPop() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFFF3ECF9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Konfirmasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF84686D),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Apakah Anda yakin ingin mengakhiri tes dan kembali ke beranda?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF84686D),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: const Text('Tidak'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: const Text('Ya'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    if (result == true) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final int startIndex = currentPage * questionsPerPage;
    final int endIndex = (startIndex + questionsPerPage > questions.length)
        ? questions.length
        : startIndex + questionsPerPage;

    final currentQuestions = questions.sublist(startIndex, endIndex);

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'Tes Penjurusan',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF84686D),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Jawablah pertanyaan berikut ini sesuai dengan kecocokan berdasarkan kondisimu saat ini',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: LinearProgressIndicator(
                          value: (currentPage + 1) /
                              ((questions.length / questionsPerPage).ceil()),
                          backgroundColor: Colors.grey.shade300,
                          color: const Color(0xFF7B5B6B),
                          minHeight: 8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: currentQuestions.length,
                          itemBuilder: (context, index) {
                            final question = currentQuestions[index];
                            final questionIndex = startIndex + index;
                            final isAnswered =
                                selectedAnswers.containsKey(questionIndex);

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${questionIndex + 1}. ${question['question']}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF84686D),
                                          ),
                                        ),
                                      ),
                                      if (!isAnswered)
                                        const Text(
                                          '*',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    children: question['options']
                                        .map<Widget>((option) {
                                      final isSelected =
                                          selectedAnswers[questionIndex] ==
                                              option;
                                      return Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedAnswers[questionIndex] =
                                                    option;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: isSelected
                                                  ? const Color(0xFF7B5B6B)
                                                  : Colors.white,
                                              foregroundColor: isSelected
                                                  ? Colors.white
                                                  : const Color(0xFF7B5B6B),
                                              side: const BorderSide(
                                                  color: Color(0xFF7B5B6B)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            child: Text(option),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (areAllQuestionsAnswered(startIndex, endIndex)) {
                            if ((currentPage + 1) >= ((questions.length / questionsPerPage).ceil())) {
                              // Hitung hasil
                              Map<String, int> majorScores = {};
                              for (int i = 0; i < questions.length; i++) {
                                if (selectedAnswers[i] == 'Ya') {
                                  for (var major in questions[i]['majors']) {
                                    majorScores[major] = (majorScores[major] ?? 0) + 1;
                                  }
                                }
                              }
                              // Ambil userId dari SharedPreferences
                              final prefs = await SharedPreferences.getInstance();
                              final userId = prefs.getString('userId') ?? '';
                              if (userId.isEmpty) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('User ID tidak ditemukan! Silakan login ulang.')),
                                  );
                                }
                                return;
                              }
                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      majorScores: majorScores,
                                      userId: userId,
                                    ),
                                  ),
                                );
                              }
                              return;
                            }
                            setState(() {
                              currentPage++;
                            });
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => Dialog(
                                backgroundColor: const Color(0xFFF3ECF9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Peringatan',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF84686D),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        'Harap jawab semua soal sebelum melanjutkan.',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            style: TextButton.styleFrom(
                                              foregroundColor: const Color(0xFF84686D),
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            child: const Text('Tutup'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7B5B6B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          (currentPage + 1) >= ((questions.length / questionsPerPage).ceil())
                              ? 'LIHAT HASIL'
                              : 'SELANJUTNYA',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
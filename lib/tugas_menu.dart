import 'package:flutter/material.dart';
import 'tryout_detail_screen.dart';

class TugasMenu extends StatelessWidget {
  final bool isTryout1Done;
  final String userId;

  const TugasMenu({
    super.key,
    this.isTryout1Done = false,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            // Hanya List Tryout 1
            _TryoutCard(
              title: 'Tryout UTBK SNBT #1',
              date: '1 Mei s/d 31 Mei 2025',
              status: isTryout1Done ? 'Selesai' : 'Tersedia',
              isDone: isTryout1Done,
              userId: userId,
            ),
          ],
        ),
      ),
    );
  }
}

class _TryoutCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final bool isDone;
  final String userId;

  const _TryoutCard({
    required this.title,
    required this.date,
    required this.status,
    required this.isDone,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF7B5B6B),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isDone ? Colors.green[100] : const Color(0xFFE9E3F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isDone ? Colors.green : const Color(0xFF7B5B6B),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Color(0xFFB7A7A7)),
              const SizedBox(width: 6),
              Text(
                date,
                style: const TextStyle(fontSize: 12, color: Color(0xFFB7A7A7)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Peserta dihapus di sini
          const Row(
            children: [
              Icon(Icons.monetization_on, size: 16, color: Color(0xFFB7A7A7)),
              SizedBox(width: 6),
              Text(
                'Free',
                style: TextStyle(fontSize: 12, color: Color(0xFFB7A7A7)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isDone
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TryoutDetailScreen(userId: userId),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B5B6B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                disabledBackgroundColor: Colors.green[200],
              ),
              child: Text(
                isDone ? 'SELESAI' : 'LIHAT',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
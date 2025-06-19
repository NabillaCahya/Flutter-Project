import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';
import 'tugas_menu.dart'; // Tambahkan import ini
import 'article_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId; // Tambahkan ini

  const HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;

  // Dummy data artikel
  final List<Map<String, String>> articles = [
    {
      'title': '5 Hal yang Harus Kamu Pertimbangkan Sebelum Memilih Jurusan Kuliah',
      'subtitle': 'Baca Selengkapnya',
      'image': 'assets/artikel1.png',
      'content': '    Memilih jurusan kuliah adalah keputusan besar yang akan memengaruhi masa depan kamu. Sebelum memutuskan, ada beberapa hal penting yang perlu kamu pertimbangkan.\n\n1. Minat dan Bakat\nPilih jurusan yang sesuai dengan passion dan bakat kamu. Jika kamu suka sesuatu, kamu akan lebih semangat menjalani perkuliahan dan karier di masa depan.\n\n2. Prospek Karier\nPertimbangkan prospek kerja di masa depan. Pilih jurusan yang memiliki peluang kerja yang baik dan tetap dibutuhkan dalam beberapa tahun ke depan.\n\n3. Biaya Pendidikann\n Pastikan biaya kuliah dan biaya hidup sesuai dengan kemampuan kamu dan keluarga. Beberapa jurusan mungkin memerlukan biaya lebih tinggi, jadi pertimbangkan itu juga.\n\n4. Reputasi Kampus\nCek reputasi dan akreditasi kampus yang menawarkan jurusan tersebut. Kampus dengan reputasi baik bisa membuka peluang karier lebih luas.\n\n5. Dukungan Keluarga\nDapatkan dukungan dari orang tua atau keluarga. Pilihan mereka juga penting, tapi pastikan kamu juga merasa nyaman dengan pilihan jurusan tersebut.\n\n    Dengan mempertimbangkan hal-hal di atas, kamu bisa membuat keputusan yang lebih tepat dalam memilih jurusan kuliah. Semoga sukses!',
    },
    {
      'title': 'Kenapa Kenali Minat Bakat Itu Penting?',
      'subtitle': 'Baca Selengkapnya',
      'image': 'assets/artikel2.jpg',
      'content': '    Mengetahui minat dan bakat diri sendiri sangat penting dalam menentukan arah kehidupan, terutama dalam memilih jurusan kuliah atau karier. Dengan mengenali minat dan bakat, kamu bisa memilih bidang yang memang kamu sukai dan memiliki potensi untuk berkembang lebih baik. Ini akan memudahkan kamu dalam menjalani proses belajar dan bekerja nantinya.\n\n    Dengan memilih jurusan atau pekerjaan yang sesuai dengan minat dan bakat, kamu akan lebih termotivasi, lebih menikmati aktivitas tersebut, dan memiliki kesempatan lebih besar untuk sukses di bidang tersebut.\n\n    Selain itu, mengenali minat dan bakat juga membantu kamu untuk menghindari kebosanan dan kejenuhan. Ketika kamu melakukan sesuatu yang sesuai dengan kemampuan dan kegemaran kamu, perjalanan belajar atau bekerja menjadi lebih menyenangkan dan tidak terasa terbebani.\n\n    Jadi, mengenali minat dan bakat sejak dini akan membantu kamu memilih langkah yang lebih tepat, baik dalam pendidikan maupun karier di masa depan.',
    },
    {
      'title': 'Skill yang Akan Dibutuhkan di Dunia Kerja Tahun 2025',
      'subtitle': 'Baca Selengkapnya',
      'image': 'assets/artikel3.jpg',
      'content': '    Di tahun 2025, dunia kerja akan semakin berkembang seiring dengan kemajuan teknologi dan perubahan gaya hidup. Ada beberapa skill yang diprediksi akan sangat dibutuhkan oleh para pekerja. Salah satunya adalah keterampilan di bidang teknologi, seperti pemrograman dan analisis data.\n\n    Selain itu, kemampuan dalam beradaptasi dengan cepat terhadap perubahan juga akan menjadi keahlian yang sangat penting. Dunia kerja yang semakin dinamis menuntut pekerja untuk bisa menghadapi tantangan baru dengan solusi inovatif.\n\nKeterampilan komunikasi yang efektif juga tidak kalah penting. Kemampuan untuk berkolaborasi dalam tim yang beragam serta menyampaikan ide dengan jelas akan menjadi nilai tambah yang besar di berbagai bidang.\n\n    Kreativitas dan pemecahan masalah juga akan menjadi skill yang dicari banyak perusahaan. Di masa depan, perusahaan akan lebih mengutamakan karyawan yang bisa memberikan solusi kreatif dan inovatif terhadap berbagai masalah yang ada.\n\nTerakhir, keterampilan dalam manajemen waktu dan organisasi akan sangat dibutuhkan, mengingat pekerjaan di masa depan akan lebih fleksibel dan sering melibatkan multitasking. Mampu mengatur waktu dengan baik akan meningkatkan efisiensi dan produktivitas di tempat kerja.\n\nUntuk mempersiapkan diri menghadapi dunia kerja di tahun 2025, penting untuk terus mengembangkan keterampilan yang relevan dengan perkembangan zaman.',
    },
  ];

  // Dummy data ulasan
  final List<Map<String, String>> reviews = [
    {
      'review':
          '"Setelah tahu minat & bakat, jadi makin memilih jurusan dengan mantap!"\n- Rizky, Mahasiswa',
      'gradientStart': '0xFFE6C4B5',
      'gradientEnd': '0xFFA6958D',
    },
    {
      'review':
          '"Ternyata setelah tahu minatku, aku lebih enjoy kuliah dan nggak salah jurusan!"\n- Aulia, Fresh Graduate',
      'gradientStart': '0xFFE6D5BA',
      'gradientEnd': '0xFFAF9567',
    },
    {
      'review':
          '"Tes ini membantu saya memahami potensi diri dan memilih karier yang tepat!"\n- Budi, Karyawan',
      'gradientStart': '0xFFD5E6BA',
      'gradientEnd': '0xFF95AF67',
    },
    {
      'review':
          '"Sangat bermanfaat untuk menentukan jurusan kuliah yang sesuai dengan minat!"\n- Siti, Pelajar',
      'gradientStart': '0xFFBAD5E6',
      'gradientEnd': '0xFF6795AF',
    },
  ];

  bool showAllArticles = false;
  bool showAllReviews = false;

  // Tambahan untuk pencarian
  List<Map<String, String>> filteredArticles = [];
  List<Map<String, String>> filteredReviews = [];

  @override
  void initState() {
    super.initState();
    filteredArticles = List.from(articles);
    filteredReviews = List.from(reviews);
  }

  void _searchContent() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredArticles = List.from(articles);
        filteredReviews = List.from(reviews);
      } else {
        filteredArticles = articles.where((article) {
          return (article['title']?.toLowerCase().contains(query) ?? false) ||
                 (article['subtitle']?.toLowerCase().contains(query) ?? false);
        }).toList();

        filteredReviews = reviews.where((review) {
          return (review['review']?.toLowerCase().contains(query) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeContent(context),
      TugasMenu(userId: widget.userId), // Ambil dari widget
      const ProfileScreen(),
    ];

    return Scaffold(
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
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    final bool isSearching = searchController.text.trim().isNotEmpty;
    final String keyword = searchController.text.trim();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Cari',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _searchContent(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchContent,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          if (isSearching) ...[
            Text(
              'Hasil pencarian untuk: "$keyword"',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B5B6B),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            if (filteredArticles.isNotEmpty)
              ...filteredArticles.map((article) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            article['image'] ?? 'assets/default.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article['title'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF7B5B6B),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              article['subtitle'] ?? '',
                              style: const TextStyle(
                                color: Color(0xFF7B5B6B),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            if (filteredReviews.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.4,
                ),
                itemCount: filteredReviews.length,
                itemBuilder: (context, index) {
                  final review = filteredReviews[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(int.parse(review['gradientStart']!)),
                          Color(int.parse(review['gradientEnd']!)),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      review['review']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            if (filteredArticles.isEmpty && filteredReviews.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text(
                    'Tidak ditemukan untuk: "$keyword"',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
          ] else ...[
            // --- TAMPILAN NORMAL BERANDA ---
            // Banner Tes Minat Bakat
            Container(
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
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const QuizScreen()),
                            );
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
            ),
            const SizedBox(height: 16),

            // Artikel Untukmu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Artikel Untukmu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF7B5B6B),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showAllArticles = !showAllArticles;
                    });
                  },
                  child: Text(
                    showAllArticles ? 'Lihat sedikit' : 'Lihat semuanya',
                    style: const TextStyle(
                      color: Color(0xFF7B5B6B),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // List Artikel (filtered)
            ...((showAllArticles ? filteredArticles : filteredArticles.take(2)).map((article) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ArticleDetailScreen(
                        title: article['title'] ?? '',
                        image: article['image'] ?? 'assets/default.png',
                        content: article['content'] ?? '',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            article['image'] ?? 'assets/default.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article['title'] ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF7B5B6B),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              article['subtitle'] ?? '',
                              style: const TextStyle(
                                color: Color(0xFF7B5B6B),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),

            // Quotes
            const SizedBox(height: 15),
            Center(
              child: Text(
                '--- Kata Motivasi: Bagaimana Tes Ini Membantumu? ---',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),

            // Motivasi Cards (filtered)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.4,
              ),
              itemCount: showAllReviews
                  ? filteredReviews.length
                  : (filteredReviews.length < 2 ? filteredReviews.length : 2),
              itemBuilder: (context, index) {
                final review = filteredReviews[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(int.parse(review['gradientStart']!)),
                        Color(int.parse(review['gradientEnd']!)),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    review['review']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),

            // Lihat Semua Ulasan
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAllReviews = !showAllReviews;
                  });
                },
                child: Text(
                  showAllReviews ? 'Lihat Sedikit Ulasan' : 'Lihat Semua Ulasan',
                  style: const TextStyle(
                    color: Color(0xFF7B5B6B),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Penjelasan Tes Minat & Bakat
            const Text(
              'Kenapa Tes Minat & Bakat Itu Penting?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF7B5B6B),
              ),
            ),
            const SizedBox(height: 16),

            // List Penjelasan dengan Gambar di Samping
            LayoutBuilder(
              builder: (context, constraints) {
                final double containerWidth = constraints.maxWidth * 0.7;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDE8E8),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kenali Minat & Bakat',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF7B5B6B),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Pahami potensi diri dan arah yang cocok untukmu.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF7B5B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/illustration.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDE8E8),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dapat Rekomendasi Jurusan/Karier',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF7B5B6B),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Tes membantumu memilih langkah yang tepat.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF7B5B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/illustration.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDE8E8),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Persiapan Lebih Matang',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF7B5B6B),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Dengan hasil tes, kamu bisa membuat strategi masa depan.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF7B5B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/illustration.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            // Tombol Tes Minat Bakat
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B5B6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text(
                  'Mulai Tes Minat Bakatmu Sekarang!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}
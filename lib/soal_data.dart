class SoalModel {
  final String soal;
  final List<String> opsi;
  final int jawabanBenar;
  final int bobot; // default 4

  SoalModel({
    required this.soal,
    required this.opsi,
    required this.jawabanBenar,
    this.bobot = 4,
  });
}

// Contoh soal, tambahkan sesuai kebutuhan
final List<SoalModel> soalPenalaranInduktif = [
  SoalModel(
    soal: "Pola: 3, 6, 12, 24, ...?",
    opsi: ["30", "36", "42", "48", "54"],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "2, 5, 10, 17, ...?",
    opsi: ["24", "25", "26", "27", "28"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Pola: A, C, F, J, O, ...?",
    opsi: ["Q", "U", "V", "W", "Z"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "5, 15, 45, 135, ...?",
    opsi: ["180", "225", "315", "405", "540"],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Pola: 1, 4, 9, 16, ...?",
    opsi: ["20", "25", "30", "36", "40"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "4, 7, 13, 22, ...?",
    opsi: ["28", "31", "35", "40", "45"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Pola: B, D, G, K, ...?",
    opsi: ["N", "O", "P", "Q", "R"],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "1, 3, 7, 13, ...?",
    opsi: ["19", "21", "23", "25", "27"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "5, 10, 20, 40, ...?",
    opsi: ["50", "60", "70", "80", "90"],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "2, 3, 5, 8, 12, ...?",
    opsi: ["15", "17", "20", "21", "25"],
    jawabanBenar: 3,
  ),
];

final List<SoalModel> soalPenalaranDeduktif = [
  SoalModel(
    soal: "Jika semua siswa adalah manusia, dan Andi adalah siswa, maka...",
    opsi: ["Andi adalah manusia", "Andi bukan manusia", "Semua manusia adalah siswa", "Semua siswa bukan manusia", "Andi bukan siswa"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika semua pohon menghasilkan oksigen, dan kelapa adalah pohon, maka...",
    opsi: ["Kelapa menghasilkan oksigen", "Kelapa tidak menghasilkan oksigen", "Semua pohon adalah kelapa", "Semua oksigen berasal dari kelapa", "Kelapa bukan pohon"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika semua mahasiswa pintar, dan Budi mahasiswa, maka...",
    opsi: ["Budi pintar", "Budi tidak pintar", "Semua pintar adalah mahasiswa", "Semua mahasiswa bukan pintar", "Budi bukan mahasiswa"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika semua mobil berjalan di jalan, dan beberapa jalan beraspal, maka...",
    opsi: ["Semua mobil berjalan di jalan beraspal", "Beberapa mobil berjalan di jalan beraspal", "Mobil tidak berjalan di jalan beraspal", "Semua jalan beraspal adalah mobil", "Tidak ada mobil di jalan"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Jika semua ikan hidup di air, dan gurame adalah ikan, maka...",
    opsi: ["Gurame hidup di air", "Gurame tidak hidup di air", "Semua air adalah gurame", "Gurame bukan ikan", "Ikan bukan gurame"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika semua guru adalah pengajar, dan Bu Ani adalah guru, maka...",
    opsi: ["Bu Ani adalah pengajar", "Bu Ani bukan pengajar", "Semua pengajar adalah Bu Ani", "Semua guru bukan pengajar", "Bu Ani bukan guru"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika semua kendaraan bermotor membutuhkan bensin, dan motor adalah kendaraan bermotor, maka...",
    opsi: ["Motor membutuhkan bensin", "Motor tidak membutuhkan bensin", "Semua bensin adalah motor", "Semua kendaraan tidak bermotor", "Motor bukan kendaraan"],
    jawabanBenar: 1,
  ),
];

final List<SoalModel> soalPenalaranKuantitatif = [
  SoalModel(
    soal: "Jika 5 + x = 12, maka x = ...?",
    opsi: ["5", "6", "7", "8", "9"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika 3x - 4 = 11, maka x = ...?",
    opsi: ["3", "4", "5", "6", "7"],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Jika y/2 = 7, maka y = ...?",
    opsi: ["10", "12", "14", "16", "18"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika 8x = 64, maka x = ...?",
    opsi: ["6", "7", "8", "9", "10"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika 15 - x = 9, maka x = ...?",
    opsi: ["4", "5", "6", "7", "8"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika 2a + 3 = 11, maka a = ...?",
    opsi: ["2", "3", "4", "5", "6"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika b/4 = 5, maka b = ...?",
    opsi: ["15", "20", "25", "30", "35"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Jika 7 + x = 15, maka x = ...?",
    opsi: ["6", "7", "8", "9", "10"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika 9 - y = 4, maka y = ...?",
    opsi: ["3", "4", "5", "6", "7"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Jika 4z = 28, maka z = ...?",
    opsi: ["5", "6", "7", "8", "9"],
    jawabanBenar: 3,
  ),
];

final List<SoalModel> soalPengetahuandanPemahamanUmum = [
  SoalModel(
    soal: "Negara manakah yang menjadi tuan rumah Olimpiade 2024?",
    opsi: ["Jepang", "Prancis", "Amerika Serikat", "Brasil", "Australia"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Teori evolusi yang dipopulerkan oleh Charles Darwin ditulis dalam bukunya yang berjudul ...?",
    opsi: ["The Origin of Life", "The Origin of Species", "The Theory of Evolution", "The Descent of Man", "The Survival of the Fittest"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Perang Dunia II berakhir pada tahun ...?",
    opsi: ["1939", "1941", "1943", "1945", "1947"],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Alasan terjadinya krisis ekonomi Asia pada tahun 1997 adalah ...?",
    opsi: ["Kenaikan harga minyak dunia", "Krisis moneter di Thailand", "Perang dagang antara China dan AS", "Keruntuhan ekonomi Jepang", "Krisis pangan di Asia"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Negara dengan jumlah penduduk terbesar di dunia pada tahun 2024 adalah ...?",
    opsi: ["India", "China", "Amerika Serikat", "Indonesia", "Brasil"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Perjanjian yang mengakhiri Perang Dunia I adalah ...?",
    opsi: ["Perjanjian Versailles", "Perjanjian Tordesillas", "Perjanjian Renville", "Perjanjian Paris", "Perjanjian Postdam"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Reaksi endoterm terjadi ketika ...?",
    opsi: ["Energi dilepaskan", "Energi diserap", "Terjadi perubahan fisika", "Tidak terjadi perubahan energi", "Energi berubah menjadi massa"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Benua yang tidak memiliki negara adalah ...?",
    opsi: ["Afrika", "Australia", "Antartika", "Eropa", "Asia"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Organisasi internasional yang bertujuan menjaga perdamaian dunia adalah ...?",
    opsi: ["ASEAN", "NATO", "PBB", "G20", "WHO"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Di antara berikut ini, manakah yang bukan merupakan anggota tetap Dewan Keamanan PBB?",
    opsi: ["Amerika Serikat", "Rusia", "Jepang", "Cina", "Prancis"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Bahan baku utama dalam produksi baja adalah ...?",
    opsi: ["Aluminium", "Besi", "Tembaga", "Perak", "Emas"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Negara manakah yang pertama kali menggunakan sistem demokrasi langsung pada masa kuno?",
    opsi: ["Mesir", "India", "Yunani", "Romawi", "Persia"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Teori Big Bang menjelaskan tentang ...?",
    opsi: ["Asal mula tata surya", "Pembentukan bumi", "Penciptaan alam semesta", "Perkembangan kehidupan", "Migrasi manusia purba"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Hormon yang berperan dalam pengaturan kadar gula darah adalah ...?",
    opsi: ["Insulin", "Adrenalin", "Testosteron", "Estrogen", "Melatonin"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Di Indonesia, Undang-Undang Dasar 1945 pertama kali disahkan pada tanggal ...?",
    opsi: ["17 Agustus 1945", "18 Agustus 1945", "20 Agustus 1945", "21 Agustus 1945", "22 Agustus 1945"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Reaksi kimia yang menghasilkan gas karbon dioksida dan air disebut ...?",
    opsi: ["Redoks", "Hidrolisis", "Pembakaran", "Pengendapan", "Netralisasi"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Siapakah penulis novel 'Laskar Pelangi'?",
    opsi: ["Andrea Hirata", "Habiburrahman El Shirazy", "Dee Lestari", "Tere Liye", "Pramoedya Ananta Toer"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Hewan mamalia yang mampu terbang adalah ...?",
    opsi: ["Kelelawar", "Burung Elang", "Ayam", "Angsa", "Merpati"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Teorema Pythagoras berlaku pada segitiga ...?",
    opsi: ["Sembarang", "Siku-siku", "Sama kaki", "Sama sisi", "Tumpul"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Ibukota dari negara Kanada adalah ...?",
    opsi: ["Toronto", "Ottawa", "Montreal", "Vancouver", "Quebec"],
    jawabanBenar: 2,
  ),
];

final List<SoalModel> soalPemahamanBacaan = [
  SoalModel(
    soal: "Dina sangat menyukai alam dan selalu berusaha menjaga kelestariannya. Setiap kali mengunjungi taman, ia membawa kantong plastik untuk memungut sampah-sampah yang tertinggal oleh pengunjung lain. Dina juga mengajak teman-temannya untuk ikut serta dalam menjaga kebersihan lingkungan sekitar. Ia percaya bahwa dengan menjaga kebersihan, alam akan tetap terjaga dan tetap memberikan manfaat bagi kehidupan.",
    opsi: [
      "Dina tidak peduli dengan kebersihan lingkungan",
      "Dina mengajak teman-temannya untuk merusak lingkungan",
      "Dina selalu membawa kantong plastik untuk memungut sampah",
      "Dina tidak suka berjalan-jalan di taman",
      "Dina tidak tahu cara menjaga kebersihan alam"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Pada suatu pagi yang cerah, Rina bangun lebih pagi dari biasanya. Ia menyadari bahwa hari ini adalah hari pertama ia bersekolah di kota baru. Dengan penuh semangat, ia menyiapkan segala kebutuhan sekolahnya dan berangkat lebih awal agar tidak terlambat. Sesampainya di sekolah, Rina merasa cemas karena belum mengenal banyak orang. Namun, beberapa teman baru menyambutnya dengan senyuman hangat, dan ia merasa lebih nyaman. Seiring berjalannya waktu, Rina mulai merasa betah dan menikmati hari-harinya di sekolah baru.",
    opsi: [
      "Rina merasa cemas sebelum berangkat sekolah",
      "Rina tidak mengenal teman-teman barunya",
      "Rina merasa betah setelah beberapa waktu",
      "Rina terlambat saat tiba di sekolah",
      "Rina tidak menyukai sekolah barunya"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Di sebuah desa yang terletak di pinggiran kota, terdapat sebuah pasar tradisional yang ramai setiap hari. Pasar tersebut dikelilingi oleh pedagang yang menjual berbagai macam barang, mulai dari sayuran, buah-buahan, hingga barang-barang kerajinan tangan. Setiap pagi, penduduk desa berbondong-bondong datang untuk membeli kebutuhan sehari-hari mereka. Di tengah kesibukan pasar, seorang anak laki-laki bernama Budi dengan cermat memilih buah-buahan yang segar untuk dibawa pulang. Ia senang bisa membantu ibunya berbelanja.",
    opsi: [
      "Pasar tradisional di desa tersebut sangat sepi",
      "Budi pergi ke pasar untuk membeli pakaian",
      "Penduduk desa membeli kebutuhan sehari-hari di pasar",
      "Budi tidak tahu cara memilih buah-buahan",
      "Pasar tersebut hanya buka pada malam hari"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Di sebuah kota kecil, terdapat sebuah kafe yang sangat terkenal di kalangan warga lokal. Kafe tersebut dikenal dengan kopi dan kue-kue lezat yang selalu membuat pengunjungnya merasa betah. Setiap pagi, kafe tersebut dipenuhi oleh orang-orang yang datang untuk menikmati kopi sambil berbincang dengan teman-teman. Ada pula pengunjung yang datang untuk bekerja atau membaca buku. Suasana yang tenang dan nyaman membuat kafe itu menjadi tempat favorit banyak orang.",
    opsi: [
      "Kafe di kota tersebut terkenal karena menu makanannya",
      "Kafe tersebut selalu sepi dan tidak ada pengunjung",
      "Kafe itu tidak cocok untuk orang yang ingin bekerja",
      "Kafe tersebut hanya buka di malam hari",
      "Pengunjung kafe datang hanya untuk makan siang"
    ],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Hari itu adalah hari yang panas, dan Ani memutuskan untuk pergi ke taman kota untuk bersantai. Taman itu terletak di pusat kota dan memiliki banyak pohon rindang yang memberikan keteduhan. Ani membawa buku favoritnya dan duduk di bawah pohon besar. Ia mulai membaca sambil menikmati semilir angin yang sejuk. Beberapa orang juga terlihat sedang berjalan-jalan atau duduk di bangku taman. Ani merasa senang bisa menghabiskan waktu di tempat yang nyaman.",
    opsi: [
      "Ani pergi ke taman untuk berolahraga",
      "Ani merasa nyaman membaca di taman",
      "Taman tersebut sangat panas dan tidak nyaman",
      "Ani membawa makanan ke taman",
      "Ani duduk di bangku taman sepanjang hari"
    ],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Pada musim liburan, keluarga Adi memutuskan untuk pergi berlibur ke pantai. Mereka mempersiapkan segala kebutuhan dengan matang, termasuk makanan, pakaian, dan perlengkapan berenang. Sesampainya di pantai, Adi dan keluarganya menikmati pemandangan yang indah. Mereka bermain air, berjemur di bawah sinar matahari, dan berjalan-jalan di sepanjang pantai. Kegiatan itu membuat mereka merasa sangat bahagia.",
    opsi: [
      "Adi pergi ke pantai sendirian",
      "Keluarga Adi menikmati liburan di pegunungan",
      "Mereka tidak membawa perlengkapan berenang",
      "Adi dan keluarganya bermain air di pantai",
      "Mereka tidak menikmati liburan di pantai"
    ],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Saat sedang melakukan perjalanan jauh, Rudi merasa lapar dan memutuskan untuk berhenti di sebuah restoran. Ia memesan seporsi nasi goreng dan segelas es teh. Sambil menunggu makanannya, Rudi melihat ke luar jendela dan menikmati pemandangan alam yang indah. Tak lama kemudian, makanan yang dipesannya tiba. Rudi pun makan dengan lahap dan merasa puas.",
    opsi: [
      "Rudi tidak merasa lapar saat berhenti di restoran",
      "Rudi makan di restoran cepat saji",
      "Rudi memesan makanan ringan",
      "Rudi memutuskan untuk makan nasi goreng dan es teh",
      "Rudi tidak menikmati pemandangan di restoran"
    ],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Tina sangat menyukai alam dan selalu berusaha menjaga kelestariannya. Setiap kali mengunjungi taman, ia membawa kantong plastik untuk memungut sampah-sampah yang tertinggal oleh pengunjung lain. Tina juga mengajak teman-temannya untuk ikut serta dalam menjaga kebersihan lingkungan sekitar. Ia percaya bahwa dengan menjaga kebersihan, alam akan tetap terjaga dan tetap memberikan manfaat bagi kehidupan.",
    opsi: [
      "Tina tidak peduli dengan kebersihan lingkungan",
      "Tina mengajak teman-temannya untuk merusak lingkungan",
      "Tina selalu menjaga kebersihan lingkungan sekitar",
      "Tina tidak suka mengunjungi taman",
      "Tina tidak tahu cara menjaga kebersihan alam"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Di tengah kota yang sibuk, terdapat sebuah kafe kecil yang menyediakan berbagai jenis kopi dan teh. Setiap pengunjung yang datang disuguhi aroma kopi yang kuat dan rasa teh yang menyegarkan. Suasana di dalam kafe sangat nyaman dan santai, dengan dekorasi yang sederhana namun elegan. Banyak orang datang untuk bekerja, bertemu teman, atau sekadar menikmati waktu sendiri. Kafe ini menjadi tempat favorit bagi para pekerja kreatif yang mencari inspirasi.",
    opsi: [
      "Kafe tersebut hanya menyediakan kopi dan teh",
      "Suasana di kafe sangat sibuk dan bising",
      "Kafe ini sering dikunjungi oleh pekerja kreatif",
      "Kafe tersebut tidak memiliki dekorasi yang menarik",
      "Kafe tersebut tidak cocok untuk bekerja"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Di sebuah desa yang asri, terdapat sebuah sekolah dasar yang dikenal dengan suasana belajar yang menyenangkan. Setiap pagi, anak-anak berbaris rapi untuk mengikuti upacara bendera, kemudian mereka memasuki kelas dengan penuh semangat. Para guru di sekolah tersebut selalu memberikan pengajaran yang menarik, dan anak-anak senang belajar. Mereka sering bermain di halaman sekolah setelah pelajaran selesai, menikmati waktu bersama teman-temannya.",
    opsi: [
      "Anak-anak tidak pernah mengikuti upacara bendera",
      "Anak-anak merasa bosan saat di sekolah",
      "Suasana belajar di sekolah tersebut tidak menyenangkan",
      "Guru-guru di sekolah tersebut sangat baik dan mengajar dengan menyenangkan",
      "Anak-anak tidak pernah bermain di halaman sekolah"
    ],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Pada liburan sekolah kali ini, keluarga Mia memutuskan untuk mengunjungi tempat wisata alam yang terkenal. Mereka menginap di sebuah penginapan yang nyaman dan menghabiskan waktu menikmati keindahan alam sekitar. Mia sangat menikmati kegiatan berjalan-jalan sambil menikmati pemandangan indah pegunungan dan udara yang sejuk.",
    opsi: [
      "Mia tidak menikmati liburan karena cuaca buruk",
      "Mia menghabiskan liburannya dengan berbelanja",
      "Mia menikmati kegiatan berjalan-jalan di alam",
      "Mia lebih suka tinggal di rumah selama liburan",
      "Mia tidak suka pergi ke tempat wisata alam"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Setiap minggu, Ayu dan teman-temannya mengadakan kegiatan sosial di lingkungan sekitar. Mereka membersihkan jalanan, mengecat tembok taman, dan memberikan makanan kepada yang membutuhkan. Kegiatan ini menjadi rutinitas yang menyenangkan dan membuat mereka merasa lebih dekat dengan sesama.",
    opsi: [
      "Ayu dan teman-temannya tidak suka melakukan kegiatan sosial",
      "Mereka mengadakan kegiatan sosial untuk bersenang-senang",
      "Kegiatan sosial tersebut membuat Ayu dan teman-temannya merasa lebih terisolasi",
      "Ayu dan teman-temannya secara rutin melakukan kegiatan sosial di lingkungan",
      "Mereka lebih suka berdiam diri di rumah daripada melakukan kegiatan sosial"
    ],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Rudi adalah seorang pelajar yang sangat rajin belajar. Setiap hari, setelah pulang sekolah, ia menyempatkan diri untuk belajar dan mengerjakan tugas. Rudi percaya bahwa dengan belajar sungguh-sungguh, ia akan mencapai cita-citanya menjadi seorang dokter.",
    opsi: [
      "Rudi tidak pernah belajar setelah pulang sekolah",
      "Rudi berencana untuk menjadi seorang insinyur, bukan dokter",
      "Rudi belajar dengan tekun untuk meraih cita-citanya",
      "Rudi merasa malas belajar dan sering menunda-nunda",
      "Rudi tidak suka dengan pelajaran sekolah"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Sari baru saja pindah ke kota besar untuk melanjutkan studi di universitas. Awalnya, ia merasa canggung karena jauh dari keluarga dan teman-temannya. Namun, setelah beberapa waktu, Sari mulai merasa nyaman dan mendapatkan teman baru yang menyenangkan di kampus.",
    opsi: [
      "Sari merasa sangat nyaman dan tidak rindu rumah",
      "Sari merasa kesulitan beradaptasi dengan kehidupan di kota besar",
      "Sari tidak membuat teman baru di kampus",
      "Sari merasa canggung namun akhirnya merasa nyaman",
      "Sari merasa tidak ada yang menyenangkan di kampus"
    ],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Selama perjalanan ke luar kota, Andi melihat banyak pemandangan alam yang indah. Ia berhenti sejenak untuk mengabadikan beberapa foto, kemudian melanjutkan perjalanan. Di perjalanan, ia merasa puas bisa menikmati keindahan alam yang jarang ia temui di kota.",
    opsi: [
      "Andi tidak tertarik dengan pemandangan alam di perjalanan",
      "Andi merasa terganggu oleh pemandangan alam yang ada",
      "Andi menikmati perjalanan dengan mengambil foto pemandangan",
      "Andi mengabaikan keindahan alam di sepanjang perjalanan",
      "Andi merasa lelah dan tidak ingin melanjutkan perjalanan"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Pada suatu sore yang cerah, Budi pergi ke pasar untuk membeli beberapa bahan masakan. Ia membeli sayuran segar, buah-buahan, dan daging untuk persiapan makan malam. Setelah selesai berbelanja, Budi langsung pulang dan mulai memasak hidangan favorit keluarganya.",
    opsi: [
      "Budi hanya membeli buah-buahan di pasar",
      "Budi tidak memasak setelah berbelanja",
      "Budi membeli bahan masakan untuk makan malam",
      "Budi pergi ke pasar untuk membeli pakaian",
      "Budi tidak memasak hidangan favorit"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Setiap hari setelah sekolah, Dinda selalu membantu ibunya mencuci piring dan membersihkan rumah. Ia merasa senang bisa membantu ibunya dan melihat rumah yang selalu bersih. Kegiatan ini membuat Dinda merasa bertanggung jawab dan lebih mandiri.",
    opsi: [
      "Dinda tidak pernah membantu ibunya di rumah",
      "Dinda merasa terbebani dengan tugas-tugas rumah",
      "Dinda senang membantu ibunya dan merasa bertanggung jawab",
      "Dinda tidak suka membersihkan rumah",
      "Dinda lebih suka bermain daripada bekerja di rumah"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Setelah berbulan-bulan berlatih, Rina akhirnya berhasil mengikuti lomba lari maraton. Saat lomba berlangsung, ia merasa sangat lelah, namun ia tetap berusaha untuk terus berlari. Rina tahu bahwa usahanya akan terbayar, dan akhirnya ia berhasil menyelesaikan lomba dengan waktu yang memuaskan.",
    opsi: [
      "Rina tidak mengikuti lomba lari",
      "Rina berhenti berlari karena merasa sangat lelah",
      "Rina berhasil menyelesaikan lomba maraton dengan baik",
      "Rina tidak berlatih sebelum lomba",
      "Rina merasa kecewa dengan hasil lomba"
    ],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Di pagi hari yang cerah, ibu dan anaknya pergi ke pasar untuk membeli bahan makanan. Ibu mengajak anaknya untuk memilih sayuran dan buah-buahan segar. Anak itu belajar bagaimana cara memilih bahan makanan yang baik dan sehat. Mereka menikmati waktu bersama di pasar.",
    opsi: [
      "Ibu pergi ke pasar sendirian",
      "Anak tersebut tidak belajar memilih bahan makanan",
      "Mereka memilih bahan makanan yang tidak sehat",
      "Anak belajar memilih sayuran dan buah-buahan segar",
      "Anak merasa bosan saat di pasar"
    ],
    jawabanBenar: 4,
  ),
  SoalModel(
    soal: "Di kota yang sibuk, ada sebuah taman kota yang sering dikunjungi warga. Taman ini menjadi tempat yang menyenangkan untuk berjalan-jalan, berolahraga, atau hanya sekadar duduk menikmati udara segar. Setiap akhir pekan, banyak orang datang untuk piknik atau bersantai dengan keluarga dan teman-temannya.",
    opsi: [
      "Taman kota tersebut jarang dikunjungi oleh warga",
      "Taman kota tersebut hanya digunakan untuk olahraga",
      "Banyak orang datang ke taman untuk berolahraga dan bersantai",
      "Taman tersebut sangat sepi setiap akhir pekan",
      "Warga tidak pernah mengunjungi taman kota"
    ],
    jawabanBenar: 3,
  ),
];

final List<SoalModel> soalPengetahuanKuantitatif = [
  SoalModel(
    soal: "Jika x + 3 = 7, maka nilai x adalah...",
    opsi: ["4", "3", "5", "7", "10"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Budi membeli 3 buku yang masing-masing harganya Rp50.000. Berapa total yang harus dibayar Budi?",
    opsi: ["Rp150.000", "Rp200.000", "Rp250.000", "Rp300.000", "Rp350.000"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika sebuah mobil bergerak dengan kecepatan 60 km/jam, berapa jarak yang ditempuh mobil dalam 4 jam?",
    opsi: ["240 km", "240 m", "2400 km", "300 km", "150 km"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Hasil dari 3 × (5 + 2) – 4 adalah...",
    opsi: ["17", "18", "20", "21", "22"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Tiga puluh persen dari 200 adalah...",
    opsi: ["60", "50", "40", "70", "30"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika panjang sebuah persegi panjang adalah 8 cm dan lebar 5 cm, maka luasnya adalah...",
    opsi: ["40 cm²", "30 cm²", "45 cm²", "35 cm²", "25 cm²"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Sebuah keranjang berisi 50 apel. Jika 30 apel diberikan kepada teman, berapa apel yang tersisa?",
    opsi: ["20", "30", "50", "40", "10"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Hasil dari 9² adalah...",
    opsi: ["81", "72", "90", "75", "80"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Dua angka berturut-turut memiliki perbedaan 5. Jika angka pertama adalah 12, maka angka kedua adalah...",
    opsi: ["17", "7", "17.5", "8", "6"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika 2x = 10, maka nilai x adalah...",
    opsi: ["5", "4", "6", "8", "10"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Berapa banyak 7 yang terdapat dalam angka 56?",
    opsi: ["8", "6", "7", "9", "10"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Diketahui 3x + 5 = 20, maka nilai x adalah...",
    opsi: ["5", "7", "3", "10", "6"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika harga sebuah barang adalah Rp100.000 dan diskon yang diberikan 25%, berapa harga setelah diskon?",
    opsi: ["Rp75.000", "Rp70.000", "Rp80.000", "Rp90.000", "Rp85.000"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika 5 liter air dituangkan ke dalam 3 ember yang sama besar, berapa banyak air dalam satu ember?",
    opsi: ["1,5 liter", "2 liter", "1 liter", "3 liter", "2,5 liter"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika sebuah bangun datar berbentuk persegi panjang dengan panjang 10 cm dan lebar 6 cm, berapa kelilingnya?",
    opsi: ["32 cm", "28 cm", "36 cm", "26 cm", "20 cm"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika sebuah bilangan dibagi dengan 2 menghasilkan 20, maka bilangan tersebut adalah...",
    opsi: ["40", "30", "20", "50", "60"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Dalam sebuah kolam terdapat 240 ikan, jika 80 ikan ditambahkan, berapa jumlah ikan sekarang?",
    opsi: ["320", "230", "250", "270", "280"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Seorang pedagang membeli 10 kg beras seharga Rp100.000. Berapa harga 1 kg beras?",
    opsi: ["Rp10.000", "Rp5.000", "Rp12.000", "Rp8.000", "Rp7.000"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jika 2a + 4 = 14, maka nilai a adalah...",
    opsi: ["5", "4", "3", "6", "7"],
    jawabanBenar: 1,
  ),
  SoalModel(
    soal: "Jumlahkan hasil dari 15 + 25 dan 30 – 10. Hasilnya adalah...",
    opsi: ["60", "50", "55", "65", "70"],
    jawabanBenar: 1,
  ),
];

final List<SoalModel> soalLiterasiIndonesia = [
  SoalModel(
    soal: "Di dalam sebuah novel, tokoh utama mengalami konflik dengan dirinya sendiri. Konflik semacam ini termasuk dalam konflik...",
    opsi: ["Eksternal", "Internal", "Sosial", "Alam", "Masyarakat"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Berikut ini yang bukan merupakan ciri teks deskripsi adalah...",
    opsi: ["Menggambarkan objek secara detail", "Menggunakan kata sifat", "Menyampaikan informasi secara argumentatif", "Bersifat subjektif", "Menggunakan kata kerja aktif"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Salah satu tujuan dari teks eksposisi adalah...",
    opsi: ["Menghibur pembaca", "Menggambarkan suatu objek", "Mengemukakan gagasan", "Mengkritik kebijakan", "Mengisahkan peristiwa masa lalu"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Sinonim kata 'kontradiktif' adalah...",
    opsi: ["Berlawanan", "Sejalan", "Sederhana", "Tegas", "Bersahabat"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Makna ungkapan 'buah tangan' adalah...",
    opsi: ["Hadiah", "Kerajinan", "Oleh-oleh", "Keahlian", "Prestasi"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Teks laporan hasil observasi bertujuan untuk...",
    opsi: ["Menghibur pembaca", "Menjelaskan objek secara umum", "Mengisahkan pengalaman pribadi", "Mengungkapkan perasaan", "Mengajarkan moral"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Dalam karya sastra, tokoh yang mengalami perubahan sifat disebut...",
    opsi: ["Statis", "Dinamis", "Protagonis", "Antagonis", "Tritagonis"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Unsur intrinsik yang menggambarkan latar tempat, waktu, dan suasana adalah...",
    opsi: ["Tema", "Alur", "Latar", "Penokohan", "Sudut pandang"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Berikut ini adalah ciri-ciri puisi modern, kecuali...",
    opsi: ["Menggunakan bahasa bebas", "Berpola rima", "Mengutamakan estetika", "Tidak terikat jumlah bait", "Tidak terikat jumlah baris"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Tujuan dari teks prosedur adalah...",
    opsi: ["Menggambarkan suatu objek", "Menjelaskan langkah-langkah", "Menghibur pembaca", "Menguraikan gagasan", "Mengisahkan peristiwa"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Antonim dari kata 'eksplisit' adalah...",
    opsi: ["Tersurat", "Jelas", "Tersirat", "Terbuka", "Nyata"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Peribahasa 'besar pasak daripada tiang' memiliki makna...",
    opsi: ["Hidup berlebihan", "Boros dalam pengeluaran", "Mengeluarkan uang lebih banyak daripada pemasukan", "Tidak tahu diri", "Beruntung dalam bisnis"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Teks yang berisi tentang perbandingan antara dua hal disebut...",
    opsi: ["Teks eksplanasi", "Teks eksposisi", "Teks deskripsi", "Teks argumentasi", "Teks perbandingan"],
    jawabanBenar: 5,
  ),

  SoalModel(
    soal: "Makna ungkapan 'angkat topi' adalah...",
    opsi: ["Menghormati", "Mengalah", "Menghindari", "Mengajak", "Mengkritik"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Berikut ini yang bukan termasuk karya sastra klasik adalah...",
    opsi: ["Pantun", "Syair", "Cerpen", "Gurindam", "Hikayat"],
    jawabanBenar: 3,
  ),
  SoalModel(
    soal: "Teks yang berisi penjelasan tentang proses terjadinya suatu fenomena disebut...",
    opsi: ["Teks laporan", "Teks eksposisi", "Teks eksplanasi", "Teks deskripsi", "Teks prosedur"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Makna ungkapan 'besar kepala' adalah...",
    opsi: ["Tinggi hati", "Pemimpin", "Pemikir", "Pemarah", "Pendendam"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Berikut ini yang merupakan ciri teks narasi adalah...",
    opsi: ["Berisi pendapat", "Menggambarkan keadaan", "Mengisahkan peristiwa", "Memberikan petunjuk", "Mengkritik fenomena"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Kalimat berikut yang merupakan kalimat majemuk setara adalah...",
    opsi: ["Dia belajar dan dia berhasil", "Karena hujan, dia tidak datang", "Jika lapar, segera makan", "Walaupun sibuk, dia tetap membantu", "Mereka pergi sebelum hujan turun"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Istilah untuk perubahan struktur kata akibat pengaruh bahasa lain disebut...",
    opsi: ["Dialektologi", "Morfologi", "Sintaksis", "Fonologi", "Serapan"],
    jawabanBenar: 5,
  ),

  SoalModel(
    soal: "Penggunaan majas yang memperlihatkan kesan berlebihan disebut...",
    opsi: ["Litotes", "Hiperbola", "Metafora", "Personifikasi", "Eufemisme"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Teks eksposisi cenderung menggunakan gaya bahasa yang...",
    opsi: ["Puitis", "Argumentatif", "Santai", "Deskriptif", "Menyindir"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Teks yang berisi tanggapan terhadap permasalahan disebut...",
    opsi: ["Teks narasi", "Teks deskripsi", "Teks kritik", "Teks eksposisi", "Teks laporan"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Tujuan utama teks laporan hasil observasi adalah...",
    opsi: ["Menggambarkan sesuatu secara pribadi", "Memberikan panduan praktis", "Menyampaikan informasi objektif", "Mengisahkan pengalaman pribadi", "Memberikan hiburan"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Struktur utama teks cerpen meliputi...",
    opsi: ["Orientasi, Komplikasi, Resolusi", "Tesis, Argumentasi, Penegasan", "Deskripsi umum, Deskripsi bagian, Kesimpulan", "Argumentasi, Bukti, Kesimpulan", "Pembuka, Isi, Penutup"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Bagian dalam puisi yang terdiri dari beberapa baris disebut...",
    opsi: ["Rima", "Bait", "Kalimat", "Paragraf", "Tema"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Teks biografi biasanya mengisahkan tentang...",
    opsi: ["Perjalanan hidup seseorang", "Fenomena alam", "Panduan langkah-langkah", "Debat ilmiah", "Cerita fiksi"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Majas yang memberikan sifat manusia kepada benda mati disebut...",
    opsi: ["Metafora", "Personifikasi", "Asosiasi", "Simile", "Eufemisme"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Kalimat berikut yang termasuk kalimat efektif adalah...",
    opsi: ["Kami akan segera menyelesaikan pekerjaan ini dengan cepat dan tuntas", "Proses perbaikan itu sudah dilakukan secara bertahap demi hasil maksimal", "Dia pada waktu itu sudah pergi meninggalkan tempat tersebut", "Banyak orang yang merasa kebingungan dengan kejadian yang tidak terduga itu", "Untuk menghadapi masa depan yang lebih baik, maka kita harus bekerja keras"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Makna ungkapan 'angkat tangan' adalah...",
    opsi: ["Menyerah", "Mengajak", "Memimpin", "Membantu", "Menghukum"],
    jawabanBenar: 1,
  ),
];

final List<SoalModel> soalLiterasiInggris = [
  SoalModel(
    soal: "John loves going to the park every Saturday morning. He usually takes his dog and spends hours playing catch. One day, he saw a group of kids playing soccer and decided to join them. What activity did John usually do at the park?",
    opsi: ["Playing soccer", "Playing catch", "Jogging", "Reading", "Cycling"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Lisa is an avid reader. She spends most of her free time with a book in her hands. One day, she found a new bookstore in town. It was cozy and filled with various genres of books. How did Lisa feel about the new bookstore?",
    opsi: ["Disappointed", "Indifferent", "Excited", "Anxious", "Angry"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Anna is planning a surprise party for her best friend, Kate. She invited all their friends and prepared Kate's favorite dishes. However, on the day of the party, Kate found out about the plan. How did Kate most likely feel?",
    opsi: ["Betrayed", "Joyful", "Angry", "Sad", "Indifferent"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Michael always wakes up early to go jogging. One morning, he felt extremely tired and decided to skip his routine. Later that day, he regretted his decision. Why did Michael feel regret?",
    opsi: ["He missed an important meeting", "He felt lazy", "He broke his healthy habit", "He was sick", "He lost his job"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Sarah works at a bakery. One evening, she baked a new type of bread, and her customers loved it. What is the most likely effect of this situation?",
    opsi: ["She will stop baking", "She will bake more of the new bread", "She will close the bakery", "She will feel disappointed", "She will change jobs"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Tom accidentally broke his mother's favorite vase while cleaning the living room. He felt guilty and immediately confessed. What quality does Tom demonstrate?",
    opsi: ["Dishonesty", "Responsibility", "Carelessness", "Indifference", "Ignorance"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "David practiced hard for the school talent show. On the performance day, he felt nervous but gave his best. The audience cheered loudly after his performance. How did David likely feel afterward?",
    opsi: ["Disappointed", "Proud", "Ashamed", "Sad", "Angry"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Emma often visits the animal shelter to help feed the stray cats and dogs. One day, she decided to adopt a small puppy that looked lonely. What trait does Emma display?",
    opsi: ["Selfishness", "Compassion", "Stubbornness", "Laziness", "Arrogance"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "After weeks of preparation, the science project was finally completed. The team presented it confidently to the judges, who praised their creativity and effort. What can be inferred about the team's feelings?",
    opsi: ["Frustrated", "Proud", "Angry", "Confused", "Bored"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Peter always helps his classmates with their homework. One day, he was struggling with a math problem, and his friends immediately offered to help. What lesson does this situation teach?",
    opsi: ["Being selfish pays off", "Helping others builds goodwill", "Never rely on friends", "It's better to work alone", "Helping is pointless"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Rachel planned a family picnic at the lake. Unfortunately, it started to rain heavily, and they had to return home. What was the cause of the picnic being canceled?",
    opsi: ["Family argument", "Bad weather", "Lack of food", "Car breakdown", "Busy schedule"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "James wanted to impress his teacher by memorizing a long poem. However, during the recital, he forgot some lines and felt embarrassed. What emotion did James most likely experience?",
    opsi: ["Pride", "Relief", "Embarrassment", "Excitement", "Joy"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "The charity event was a great success. Many people donated generously, and the collected funds exceeded expectations. What is the most likely outcome of this event?",
    opsi: ["The charity will stop", "The funds will be used for a good cause", "People will complain", "The event will be canceled", "The organizers will be angry"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Lily accidentally spilled juice on her dress before the school presentation. She quickly borrowed her friend's jacket to cover the stain. What skill did Lily demonstrate?",
    opsi: ["Creativity", "Laziness", "Negligence", "Impatience", "Dishonesty"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "The community cleaned up the park after noticing the amount of trash left by visitors. What does this action show about the community?",
    opsi: ["Carelessness", "Responsibility", "Ignorance", "Greed", "Laziness"],
    jawabanBenar: 2,
  ),
  SoalModel(
    soal: "Samantha forgot to set her alarm clock, and as a result, she woke up late for her morning class. She rushed out without having breakfast. What problem did Samantha encounter?",
    opsi: ["Lost her textbook", "Forgot her homework", "Woke up late", "Missed her friend", "Lost her phone"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Daniel practiced playing the guitar for weeks to perform at the school event. On the big day, he played confidently and received loud applause from the audience. How did Daniel most likely feel?",
    opsi: ["Nervous", "Disappointed", "Proud", "Sad", "Angry"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Lucy wanted to bake cookies for her sister's birthday. Unfortunately, she realized she ran out of flour. What is Lucy most likely to do next?",
    opsi: ["Go to the store to buy flour", "Cancel the birthday celebration", "Make pancakes instead", "Complain to her sister", "Ignore the problem"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "After losing his favorite toy, Tom felt sad and kept looking for it all day. His friend, Mike, noticed and decided to help him search. What quality does Mike demonstrate?",
    opsi: ["Selfishness", "Indifference", "Kindness", "Jealousy", "Laziness"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "During a class discussion, Mia confidently shared her ideas, and her teacher praised her for being articulate. What does the word 'articulate' mean in this context?",
    opsi: ["Confusing", "Clear and expressive", "Hesitant", "Rude", "Boring"],
    jawabanBenar: 2,
  ),
];

final List<SoalModel> soalPenalaranMatematika = [
  SoalModel(
    soal: "Jika x + 3 = 7, berapakah nilai x?",
    opsi: ["2", "3", "4", "5", "6"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Sebuah persegi memiliki panjang sisi 5 cm. Berapakah luasnya?",
    opsi: ["15 cm²", "20 cm²", "25 cm²", "30 cm²", "35 cm²"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Jika 2x - 4 = 10, maka nilai x adalah...",
    opsi: ["5", "6", "7", "8", "9"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Jika y² = 49, maka nilai y yang mungkin adalah...",
    opsi: ["7 atau -7", "7", "-7", "0", "49"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Sebuah mobil menempuh jarak 240 km dalam waktu 4 jam. Berapakah kecepatan rata-ratanya?",
    opsi: ["40 km/jam", "50 km/jam", "60 km/jam", "70 km/jam", "80 km/jam"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Jika p dan q adalah bilangan prima berturut-turut setelah 5, maka nilai p + q adalah...",
    opsi: ["15", "17", "19", "23", "29"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Sebuah segitiga siku-siku memiliki sisi alas 6 cm dan tinggi 8 cm. Berapakah panjang sisi miringnya?",
    opsi: ["10 cm", "12 cm", "14 cm", "16 cm", "18 cm"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Sebuah kubus memiliki volume 27 cm³. Panjang sisi kubus tersebut adalah...",
    opsi: ["2 cm", "3 cm", "4 cm", "5 cm", "6 cm"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Jika a = 3 dan b = 4, maka nilai dari a² + b² adalah...",
    opsi: ["12", "16", "25", "27", "29"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Sebuah keranjang berisi 12 apel. Jika 4 apel rusak, berapa persentase apel yang masih bagus?",
    opsi: ["33%", "50%", "66%", "75%", "80%"],
    jawabanBenar: 4,
  ),

  SoalModel(
    soal: "Jika sebuah lingkaran memiliki diameter 14 cm, maka kelilingnya adalah... (gunakan π = 22/7)",
    opsi: ["22 cm", "44 cm", "66 cm", "88 cm", "99 cm"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Jika jumlah tiga bilangan genap berturut-turut adalah 54, maka bilangan terkecil adalah...",
    opsi: ["14", "16", "18", "20", "22"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Jika sebuah segitiga sama sisi memiliki panjang sisi 10 cm, maka kelilingnya adalah...",
    opsi: ["20 cm", "25 cm", "30 cm", "35 cm", "40 cm"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Berapa nilai dari 3x - 2 jika x = 5?",
    opsi: ["11", "12", "13", "14", "15"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Jumlah sudut dalam sebuah segitiga adalah...",
    opsi: ["90°", "180°", "270°", "360°", "450°"],
    jawabanBenar: 2,
  ),

  SoalModel(
    soal: "Jika sebuah balok memiliki panjang 4 cm, lebar 3 cm, dan tinggi 2 cm, maka volumenya adalah...",
    opsi: ["12 cm³", "18 cm³", "24 cm³", "30 cm³", "36 cm³"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Jika hasil dari 5x - 7 = 18, maka nilai x adalah...",
    opsi: ["3", "4", "5", "6", "7"],
    jawabanBenar: 4,
  ),

  SoalModel(
    soal: "Jika 3a + 2b = 18 dan a = 4, maka nilai b adalah...",
    opsi: ["3", "4", "5", "6", "7"],
    jawabanBenar: 1,
  ),

  SoalModel(
    soal: "Sebuah persegi panjang memiliki panjang 8 cm dan lebar 5 cm. Berapakah luasnya?",
    opsi: ["30 cm²", "35 cm²", "40 cm²", "45 cm²", "50 cm²"],
    jawabanBenar: 3,
  ),

  SoalModel(
    soal: "Jika sisi sebuah kubus bertambah 2 kali lipat, maka volumenya akan menjadi...",
    opsi: ["2 kali", "4 kali", "6 kali", "8 kali", "16 kali"],
    jawabanBenar: 4,
  ),
];


final Map<String, List<SoalModel>> soalBank = {
  'induktif': soalPenalaranInduktif,
  'deduktif': soalPenalaranDeduktif,
  'kuantitatif': soalPenalaranKuantitatif,
  'pumum': soalPengetahuandanPemahamanUmum,
  'bacaan': soalPemahamanBacaan,
  'pkuantitatif': soalPengetahuanKuantitatif,
  'indo': soalLiterasiIndonesia,
  'inggris': soalLiterasiInggris,
  'matematika': soalPenalaranMatematika,
};
import '../models/question_model.dart'; // Pastikan path import ini benar

class QuestionBank {
  static final List<MBTIQuestion> allQuestions = [
    // ===========================================
    // === EI Questions (25 questions) ===
    // ===========================================
    MBTIQuestion(
      id: 'EI1',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Di sebuah pesta, Anda:',
      options: [
        MBTIOption(
          text: 'Aktif berinteraksi dengan banyak orang, termasuk orang baru.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Lebih sering mengobrol dengan beberapa orang yang sudah Anda kenal.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI2',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Setelah seminggu yang sibuk, Anda "mengisi ulang" energi dengan:',
      options: [
        MBTIOption(
          text: 'Pergi keluar dan bertemu teman-teman.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Menikmati waktu tenang sendirian di rumah.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI3',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat bekerja dalam tim, Anda:',
      options: [
        MBTIOption(
          text: 'Cenderung banyak bicara dan membagikan ide-ide Anda.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Cenderung mendengarkan dan merenung sebelum berbicara.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI4',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Bekerja di lingkungan yang ramai dan penuh aktivitas.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Bekerja di lingkungan yang tenang dan privat.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI5',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda lebih mudah:',
      options: [
        MBTIOption(
          text: 'Memulai percakapan dengan orang asing.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Menunggu orang lain untuk memulai percakapan dengan Anda.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI6',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat harus fokus, Anda:',
      options: [
        MBTIOption(
          text: 'Merasa lebih baik jika ada sedikit "background noise" atau musik.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Membutuhkan keheningan total.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI7',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda cenderung:',
      options: [
        MBTIOption(
          text: 'Memikirkan sesuatu sambil mengatakannya (think out loud).',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Memikirkan sesuatu secara mendalam sebelum mengatakannya.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI8',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Lingkaran pertemanan Anda:',
      options: [
        MBTIOption(
          text: 'Luas, Anda kenal banyak orang.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Mendalam, Anda punya beberapa teman yang sangat dekat.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI9',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Dalam sebuah rapat, Anda:',
      options: [
        MBTIOption(
          text: 'Sering menjadi yang pertama angkat bicara.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Lebih suka mengamati dan memberi masukan di akhir.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI10',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat telepon berdering, Anda:',
      options: [
        MBTIOption(
          text: 'Langsung mengangkatnya dengan antusias.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Sering membiarkannya ke voicemail dan membalas nanti.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI11',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda lebih suka presentasi yang:',
      options: [
        MBTIOption(
          text: 'Interaktif dengan banyak partisipasi audiens.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Disampaikan dengan jelas dan terstruktur tanpa interupsi.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI12',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat makan siang, Anda:',
      options: [
        MBTIOption(
          text: 'Sering mengaturnya bersama rekan kerja atau teman.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Sering menggunakannya sebagai waktu istirahat sendirian.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI13',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda menggambarkan diri Anda sebagai orang yang:',
      options: [
        MBTIOption(
          text: 'Ekspresif dan mudah dibaca.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Tertutup dan butuh waktu untuk dikenal.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI14',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Jika Anda harus belajar, Anda:',
      options: [
        MBTIOption(
          text: 'Suka belajar kelompok (study group).',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Suka belajar sendiri.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI15',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda merasa "bosan" jika:',
      options: [
        MBTIOption(
          text: 'Terlalu lama sendirian.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Terlalu lama berada di tengah keramaian.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI16',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat bepergian, Anda:',
      options: [
        MBTIOption(
          text: 'Senang bertemu turis lain dan berbagi cerita.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Senang mengamati lingkungan sekitar secara mandiri.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI17',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Hobi Anda cenderung:',
      options: [
        MBTIOption(
          text: 'Melibatkan aktivitas kelompok atau sosial.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Aktivitas yang bisa dinikmati sendirian.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI18',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Menjadi pusat perhatian.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Menjadi pengamat di belakang layar.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI19',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat memproses informasi, Anda:',
      options: [
        MBTIOption(
          text: 'Suka mendiskusikannya dengan orang lain.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Suka memprosesnya secara internal.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI20',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Konsep "small talk" (basa-basi):',
      options: [
        MBTIOption(
          text: 'Adalah cara mudah untuk terhubung.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Terasa sangat melelahkan dan tidak perlu.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI21',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Dalam situasi sosial baru, Anda:',
      options: [
        MBTIOption(
          text: 'Langsung memperkenalkan diri.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Menunggu untuk diperkenalkan.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI22',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda lebih bersemangat tentang:',
      options: [
        MBTIOption(
          text: 'Apa yang terjadi di "dunia luar".',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Apa yang terjadi di "dunia dalam" pikiran Anda.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI23',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda cenderung:',
      options: [
        MBTIOption(
          text: 'Bertindak dulu, baru berpikir.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Berpikir dulu, baru bertindak.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI24',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Saat ada masalah, Anda:',
      options: [
        MBTIOption(
          text: 'Segera mencari teman untuk curhat.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Menarik diri untuk memikirkannya sendirian.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'EI25',
      dichotomy: 'EI',
      dimension: 'Energy Direction',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Pesta besar.',
          scores: {'E': 3, 'I': 0},
        ),
        MBTIOption(
          text: 'Kumpul-kumpul kecil dan intim.',
          scores: {'E': 0, 'I': 3},
        ),
      ],
    ),

    // ===========================================
    // === SN Questions (25 questions) ===
    // ===========================================
    MBTIQuestion(
      id: 'SN1',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat mendengarkan seseorang berbicara, Anda lebih fokus pada:',
      options: [
        MBTIOption(
          text: 'Fakta spesifik dan detail yang mereka katakan.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Makna tersembunyi atau gambaran besar dari cerita mereka.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN2',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih mempercayai:',
      options: [
        MBTIOption(
          text: 'Pengalaman langsung dan apa yang nyata.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Firasat dan inspirasi yang muncul tiba-tiba.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN3',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat mengerjakan tugas, Anda:',
      options: [
        MBTIOption(
          text: 'Suka mengikuti instruksi langkah-demi-langkah.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Suka mencari cara Anda sendiri yang unik.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN4',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih sering digambarkan sebagai orang yang:',
      options: [
        MBTIOption(
          text: 'Praktis dan "membumi" (down-to-earth).',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Imajinatif dan "penuh ide".',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN5',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat mengambil keputusan, Anda:',
      options: [
        MBTIOption(
          text: 'Melihat pada fakta dan kenyataan saat ini.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Mempertimbangkan kemungkinan dan potensi di masa depan.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN6',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih tertarik pada:',
      options: [
        MBTIOption(
          text: '"Apa yang ada" (what is).',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: '"Apa yang mungkin" (what could be).',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN7',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat belajar hal baru, Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Mempraktikkannya secara langsung.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Memahami konsep dan teorinya terlebih dahulu.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN8',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat merakit furnitur (seperti dari IKEA), Anda:',
      options: [
        MBTIOption(
          text: 'Membaca buku manual dengan sangat teliti, langkah demi langkah.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Hanya melihat gambar besarnya dan langsung mencoba merakitnya.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN9',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Dalam percakapan, Anda:',
      options: [
        MBTIOption(
          text: 'Cenderung literal dan mengatakan apa adanya.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Sering menggunakan metafora dan analogi.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN10',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Pekerjaan yang memiliki hasil nyata dan terlihat.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Pekerjaan yang melibatkan inovasi dan ide-ide baru.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN11',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat mengingat masa lalu, Anda:',
      options: [
        MBTIOption(
          text: 'Mengingat detail sensorik (pemandangan, suara, bau).',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Mengingat kesan umum atau perasaan dari kejadian tersebut.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN12',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat merencanakan masa depan, Anda:',
      options: [
        MBTIOption(
          text: 'Fokus pada rencana yang realistis dan dapat dicapai.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Fokus pada visi atau impian besar.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN13',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih peduli tentang:',
      options: [
        MBTIOption(
          text: 'Detail-detail kecil dalam sebuah proyek.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Arah keseluruhan dari proyek tersebut.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN14',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat menonton film, Anda:',
      options: [
        MBTIOption(
          text: 'Menikmati plot, dialog, dan sinematografi.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Mencari tema, simbolisme, dan pesan moralnya.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN15',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda merasa bosan jika:',
      options: [
        MBTIOption(
          text: 'Percakapan terlalu teoritis dan abstrak.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Percakapan terlalu fokus pada detail sepele.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN16',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat menjelaskan sesuatu, Anda:',
      options: [
        MBTIOption(
          text: 'Memberikan banyak contoh nyata.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Menjelaskan konsepnya menggunakan perbandingan.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN17',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Menyelesaikan masalah yang ada di depan mata.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Memikirkan masalah-masalah baru yang mungkin muncul.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN18',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat dihadapkan pada perubahan, Anda:',
      options: [
        MBTIOption(
          text: 'Khawatir tentang dampaknya pada rutinitas saat ini.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Bersemangat tentang peluang baru yang dibawanya.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN19',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih suka guru yang:',
      options: [
        MBTIOption(
          text: 'Memberikan fakta dan ujian berbasis hafalan.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Mendorong diskusi terbuka dan ujian berbasis konsep.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN20',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih bangga pada:',
      options: [
        MBTIOption(
          text: 'Keterampilan dan keahlian praktis Anda.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Visi dan wawasan Anda.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN21',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat mencoba resep baru, Anda:',
      options: [
        MBTIOption(
          text: 'Mengikuti resepnya dengan tepat.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Menggunakan resep sebagai inspirasi dan berimprovisasi.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN22',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Berbicara tentang orang, tempat, dan hal nyata.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Berbicara tentang ide, filosofi, dan teori.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN23',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda cenderung:',
      options: [
        MBTIOption(
          text: 'Memperhatikan apa yang terjadi saat ini.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Memikirkan apa yang akan terjadi selanjutnya.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN24',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Saat menilai sesuatu, Anda:',
      options: [
        MBTIOption(
          text: 'Melihat pada fungsionalitas dan kegunaannya.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Melihat pada orisinalitas dan keunikannya.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'SN25',
      dichotomy: 'SN',
      dimension: 'Information Processing',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Rutinitas yang sudah teruji.',
          scores: {'S': 3, 'N': 0},
        ),
        MBTIOption(
          text: 'Eksperimen hal-hal baru.',
          scores: {'S': 0, 'N': 3},
        ),
      ],
    ),

    // ===========================================
    // === TF Questions (25 questions) ===
    // ===========================================
    MBTIQuestion(
      id: 'TF1',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat harus membuat keputusan sulit, Anda lebih mengutamakan:',
      options: [
        MBTIOption(
          text: 'Logika, objektivitas, dan prinsip yang adil.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Nilai-nilai pribadi dan dampaknya terhadap perasaan orang lain.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF2',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat memberikan kritik, Anda:',
      options: [
        MBTIOption(
          text: 'Jujur dan langsung ke intinya, karena itu yang paling efisien.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Berusaha melembutkannya agar tidak menyinggung perasaan orang lain.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF3',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih suka dianggap sebagai orang yang:',
      options: [
        MBTIOption(
          text: 'Cerdas dan kompeten.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Baik hati dan penuh empati.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF4',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Dalam sebuah argumen, Anda:',
      options: [
        MBTIOption(
          text: 'Fokus untuk menemukan siapa yang benar secara logis.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Fokus untuk menemukan solusi yang membuat semua orang merasa didengar.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF5',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih mudah:',
      options: [
        MBTIOption(
          text: 'Mengkritik ide seseorang.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Menghargai usaha seseorang, meskipun idenya kurang baik.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF6',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat harus memecat seseorang, Anda:',
      options: [
        MBTIOption(
          text: 'Fokus pada performa kerja mereka yang tidak memadai.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Merasa sangat khawatir tentang bagaimana mereka akan menerimanya.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF7',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda merasa lebih tersinggung jika seseorang:',
      options: [
        MBTIOption(
          text: 'Meragukan kecerdasan Anda.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Meragukan kebaikan hati Anda.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF8',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Prinsip utama Anda adalah:',
      options: [
        MBTIOption(
          text: '"Kebenaran harus ditegakkan."',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: '"Harmoni harus dijaga."',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF9',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat teman Anda sedih, Anda cenderung:',
      options: [
        MBTIOption(
          text: 'Menawarkan solusi praktis untuk masalah mereka.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Menawarkan dukungan emosional dan mendengarkan curhat mereka.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF10',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih suka pujian yang:',
      options: [
        MBTIOption(
          text: 'Mengakui pencapaian dan kemampuan Anda.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Mengakui usaha dan kebaikan Anda.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF11',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Keputusan yang baik adalah yang:',
      options: [
        MBTIOption(
          text: 'Paling masuk akal secara objektif.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Terasa "benar" secara moral dan emosional.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF12',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat melihat berita sedih, Anda:',
      options: [
        MBTIOption(
          text: 'Menganalisis penyebab dan dampak dari kejadian tersebut.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Langsung merasakan simpati untuk para korban.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF13',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih suka bekerja dengan orang yang:',
      options: [
        MBTIOption(
          text: 'Kompeten tapi mungkin sedikit kasar.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Ramah tapi mungkin sedikit kurang kompeten.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF14',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih sering:',
      options: [
        MBTIOption(
          text: 'Membuat keputusan dengan kepala dingin.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Membuat keputusan dengan "hati".',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF15',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda merasa:',
      options: [
        MBTIOption(
          text: 'Penting untuk bersikap adil kepada semua orang.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Penting untuk bersikap baik kepada semua orang.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF16',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat memilih film, Anda:',
      options: [
        MBTIOption(
          text: 'Membaca ulasan dan melihat skor kritikus.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Memilih berdasarkan mood Anda atau rekomendasi teman.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF17',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih mudah termotivasi oleh:',
      options: [
        MBTIOption(
          text: 'Target dan pencapaian.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Apresiasi dan hubungan baik.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF18',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda percaya bahwa:',
      options: [
        MBTIOption(
          text: 'Aturan dibuat untuk efisiensi dan keadilan.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Aturan bisa dilonggarkan demi situasi kemanusiaan.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF19',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih cenderung:',
      options: [
        MBTIOption(
          text: 'Memberi tahu teman Anda "kebenaran pahit" demi kebaikan mereka.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Menghindari konflik agar tidak merusak hubungan.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF20',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat membeli hadiah, Anda:',
      options: [
        MBTIOption(
          text: 'Memikirkan apa yang paling berguna untuk mereka.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Memikirkan apa yang akan membuat mereka paling bahagia.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF21',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Dalam diskusi, Anda:',
      options: [
        MBTIOption(
          text: 'Senang "berdebat" untuk menguji sebuah ide.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Senang "berbagi" untuk membangun konsensus.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF22',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda merasa lebih buruk jika:',
      options: [
        MBTIOption(
          text: 'Melakukan kesalahan logika.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Menyinggung perasaan seseorang tanpa sengaja.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF23',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih menghargai:',
      options: [
        MBTIOption(
          text: 'Konsistensi dan kejelasan.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Harmoni dan pengertian.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF24',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Saat harus menolak permintaan, Anda:',
      options: [
        MBTIOption(
          text: 'Memberikan alasan logis mengapa Anda tidak bisa.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Merasa sangat tidak enak hati dan banyak meminta maaf.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'TF25',
      dichotomy: 'TF',
      dimension: 'Decision Making',
      questionText: 'Anda lebih sering dipandu oleh:',
      options: [
        MBTIOption(
          text: 'Pikiran (Head) Anda.',
          scores: {'T': 3, 'F': 0},
        ),
        MBTIOption(
          text: 'Hati (Heart) Anda.',
          scores: {'T': 0, 'F': 3},
        ),
      ],
    ),

    // ===========================================
    // === JP Questions (25 questions) ===
    // ===========================================
    MBTIQuestion(
      id: 'JP1',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat merencanakan liburan, Anda:',
      options: [
        MBTIOption(
          text: 'Membuat jadwal (itinerary) rinci dan memesan semuanya di awal.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Hanya memesan hal utama (tiket) dan sisanya fleksibel.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP2',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Meja kerja Anda cenderung:',
      options: [
        MBTIOption(
          text: 'Sangat rapi, terorganisir, dan semua ada pada tempatnya.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Agak berantakan, tapi Anda tahu di mana letak semuanya.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP3',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Konsep "Deadline" (tenggat waktu) bagi Anda:',
      options: [
        MBTIOption(
          text: 'Adalah sesuatu yang harus diselesaikan jauh-jauh hari.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Adalah "motivasi" untuk memulai pekerjaan di menit-menit terakhir.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP4',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda merasa lebih nyaman ketika:',
      options: [
        MBTIOption(
          text: 'Sebuah keputusan sudah final dibuat.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Pilihan masih terbuka dan Anda masih bisa berubah pikiran.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP5',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Hidup yang terstruktur dan dapat diprediksi.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Hidup yang spontan dan penuh kejutan.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP6',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat mengerjakan tugas, Anda:',
      options: [
        MBTIOption(
          text: 'Suka menyelesaikannya satu per satu secara berurutan.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Suka mengerjakan beberapa hal sekaligus (multitasking).',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP7',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: '"Daftar kerja" (To-Do List) menurut Anda:',
      options: [
        MBTIOption(
          text: 'Sangat penting dan memuaskan saat bisa mencoretnya.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Terlalu kaku dan membatasi.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP8',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat berbelanja di supermarket, Anda:',
      options: [
        MBTIOption(
          text: 'Membawa daftar belanja yang rinci dan mengikutinya.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Berkeliling dan membeli apa saja yang terlihat menarik.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP9',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Bekerja dulu, baru bermain.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Mencampur aduk antara pekerjaan dan waktu bermain.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP10',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Di pagi hari, Anda:',
      options: [
        MBTIOption(
          text: 'Memiliki rutinitas yang jelas dan teratur.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Melakukan apa saja tergantung mood Anda saat bangun.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP11',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih sering:',
      options: [
        MBTIOption(
          text: 'Tepat waktu atau datang lebih awal.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Sering terlambat beberapa menit.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP12',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat menghadapi masalah, Anda:',
      options: [
        MBTIOption(
          text: 'Ingin segera menyelesaikannya.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Suka menundanya dan berharap masalah itu selesai sendiri.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP13',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Tahu persis apa yang akan terjadi di akhir pekan.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Membiarkan akhir pekan Anda "terbuka" tanpa rencana.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP14',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat mengemasi koper, Anda:',
      options: [
        MBTIOption(
          text: 'Membuat daftar dan mengemas 2 hari sebelumnya.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Melempar semua barang ke koper 1 jam sebelum berangkat.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP15',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda merasa lebih stres karena:',
      options: [
        MBTIOption(
          text: 'Hal-hal yang tidak terencana.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Terlalu banyak aturan dan jadwal.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP16',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Menyelesaikan proyek.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Memulai proyek baru.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP17',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat bekerja, Anda:',
      options: [
        MBTIOption(
          text: 'Fokus dan tidak suka interupsi.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Terbuka terhadap interupsi dan hal-hal baru yang muncul.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP18',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Membuat rencana.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Menjalani hari tanpa rencana.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP19',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka:',
      options: [
        MBTIOption(
          text: 'Mengambil keputusan dengan cepat.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Mengumpulkan informasi sebanyak mungkin sebelum memutuskan.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP20',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: '"Kejutan" bagi Anda:',
      options: [
        MBTIOption(
          text: 'Membuat stres.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Menyenangkan.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP21',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka menyelesaikan pekerjaan:',
      options: [
        MBTIOption(
          text: 'Jauh sebelum tenggat waktu.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Tepat pada tenggat waktu.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP22',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih sering:',
      options: [
        MBTIOption(
          text: 'Menjadi si "perencana" di grup Anda.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Menjadi si "ayo pergi saja" di grup Anda.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP23',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka memiliki:',
      options: [
        MBTIOption(
          text: 'Pendapat yang tegas.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Pikiran yang terbuka.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP24',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Saat memilih tempat makan, Anda:',
      options: [
        MBTIOption(
          text: 'Sudah menentukan dari rumah.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Berjalan-jalan dulu baru memutuskan.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
    MBTIQuestion(
      id: 'JP25',
      dichotomy: 'JP',
      dimension: 'Lifestyle',
      questionText: 'Anda lebih suka dunia yang:',
      options: [
        MBTIOption(
          text: 'Teratur dan rapi.',
          scores: {'J': 3, 'P': 0},
        ),
        MBTIOption(
          text: 'Fleksibel dan santai.',
          scores: {'J': 0, 'P': 3},
        ),
      ],
    ),
  ];
}
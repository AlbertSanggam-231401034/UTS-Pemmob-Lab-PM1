import 'package:flutter/material.dart';

class MBTIType {
  final String code;
  final String name;
  final String group;
  final String description;
  final List<String> traits;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> famousExamples;
  final List<String> careerSuggestions;

  MBTIType({
    required this.code,
    required this.name,
    required this.group,
    required this.description,
    required this.traits,
    required this.strengths,
    required this.weaknesses,
    required this.famousExamples,
    required this.careerSuggestions,
  });

  String getImagePath(String gender, {bool noBackground = false}) {
    String genderCode;
    if (gender.toLowerCase() == 'male') {
      genderCode = 'M';
    } else if (gender.toLowerCase() == 'female') {
      genderCode = 'F';
    } else {
      genderCode = gender.toUpperCase(); // fallback
    }


    String bgSuffix = noBackground ? '(c)' : '';

    print('🖼️ Mencari gambar: assets/images/$code-$genderCode$bgSuffix.png');

    return 'assets/images/$code-$genderCode$bgSuffix.png';
  }
}

class MBTIData {
  static final Map<String, MBTIType> types = {
    // ===========================================
    // Group 1: Analis (Biru)
    // ===========================================
    'INTJ': MBTIType(
      code: 'INTJ',
      name: 'Arsitek',
      group: 'Analis',
      description: 'Sebagai salah satu tipe kepribadian yang paling langka dan paling cakap, Arsitek (INTJ) memahami perasaan ini dengan sangat baik. Rasional dan cerdas, Arsitek bangga dengan kemampuan mereka untuk berpikir sendiri, serta kemampuan luar biasa mereka untuk melihat kebenaran melalui kepalsuan dan kemunafikan. Pikiran mereka tidak pernah istirahat, menganalisis segala sesuatu di sekitar mereka.',
      traits: ['Imajinatif', 'Strategis', 'Rasional', 'Cerdas', 'Mandiri'],
      strengths: ['Cepat tanggap', 'Percaya diri', 'Mandiri', 'Tegas', 'Pekerja keras', 'Berpikiran terbuka'],
      weaknesses: ['Arogan', 'Terlalu kritis', 'Suka berdebat', 'Tidak peka soal asmara', 'Meremehkan emosi'],
      famousExamples: [
        'Friedrich Nietzsche', 'Michelle Obama', 'Elon Musk', 'Christopher Nolan',
        'Arnold Schwarzenegger', 'Colin Powell', 'Samantha Power', 'Walter White ("Heisenberg")',
        'Professor Moriarty', 'Katniss Everdeen', 'Seven of Nine', 'Jay Gatsby'
      ],
      careerSuggestions: ['Ilmuwan', 'Insinyur', 'Profesor', 'Pengacara', 'Ahli Strategi Perusahaan', 'Arsitek'],
    ),
    'INTP': MBTIType(
      code: 'INTP',
      name: 'Ahli Logika',
      group: 'Analis',
      description: 'Ahli Logika (INTP) adalah penemu inovatif dengan dahaga pengetahuan yang tak terpuaskan. Mereka bangga akan sudut pandang unik dan kecerdasan mereka, sering kali tersesat dalam pikiran mereka sendiri. Ahli Logika menganalisis segala hal, dari kehidupan sehari-hari hingga misteri alam semesta, dan selalu mencari pola serta solusi logis.',
      traits: ['Inovatif', 'Logis', 'Analitis', 'Penasaran', 'Abstrak'],
      strengths: ['Analitis', 'Orisinal', 'Berpikiran terbuka', 'Imajinatif', 'Jujur'],
      weaknesses: ['Sangat tertutup', 'Tidak peka', 'Sering meragukan diri', 'Pelupa', 'Sulit mengikuti aturan'],
      famousExamples: [
        'Albert Einstein', 'Bill Gates', 'Isaac Newton', 'Rene Descartes',
        'Stanley Crouch', 'Kristen Stewart', 'Abed Nadir (Community)', 'Neo (The Matrix)',
        'Lord Varys (Game of Thrones)', 'Leslie Winkle (The Big Bang Theory)'
      ],
      careerSuggestions: ['Ilmuwan', 'Profesor', 'Programmer', 'Analis Teknis', 'Ahli Matematika', 'Filsuf'],
    ),
    'ENTJ': MBTIType(
      code: 'ENTJ',
      name: 'Komandan',
      group: 'Analis',
      description: 'Komandan (ENTJ) adalah kepribadian yang terlahir untuk menjadi pemimpin. Orang dengan tipe kepribadian ini memiliki karisma dan kepercayaan diri, dan memproyeksikan otoritas dengan cara menarik orang banyak untuk mencapai tujuan bersama. Mereka tegas dan visioner, selalu menemukan cara atau membuatnya sendiri.',
      traits: ['Berani', 'Imajinatif', 'Berkemauan kuat', 'Pemimpin', 'Karisma'],
      strengths: ['Efisien', 'Energik', 'Percaya diri', 'Berkemauan kuat', 'Karisma', 'Strategis'],
      weaknesses: ['Keras kepala', 'Tidak toleran', 'Tidak sabaran', 'Arogan', 'Sulit mengelola emosi', 'Dingin'],
      famousExamples: [
        'Steve Jobs', 'Margaret Thatcher', 'Gordon Ramsay', 'Franklin D. Roosevelt',
        'Jim Carrey', 'Whoopi Goldberg', 'Harrison Ford', 'Tony Soprano (The Sopranos)',
        'Doctor Strange (Marvel)', 'Mary Talbot (Downton Abbey)'
      ],
      careerSuggestions: ['Eksekutif', 'Pengusaha', 'Pengacara', 'Manajer Proyek', 'Pejabat Militer'],
    ),
    'ENTP': MBTIType(
      code: 'ENTP',
      name: 'Pendebat',
      group: 'Analis',
      description: 'Pendebat (ENTP) adalah pemikir yang fleksibel dan penuh rasa ingin tahu yang tidak bisa menolak tantangan intelektual. Mereka suka mengambil peran sebagai "pembela iblis" (devil\'s advocate), menikmati proses menghancurkan argumen dan keyakinan hanya untuk melihat apa yang akan terjadi. Pikiran mereka cepat dan lincah, membuat mereka sangat cerdas dan pandai berdebat.',
      traits: ['Cerdas', 'Penasaran', 'Intelektual', 'Energik', 'Suka berdebat'],
      strengths: ['Berpengetahuan', 'Berpikir cepat', 'Orisinal', 'Karisma', 'Energik'],
      weaknesses: ['Suka berdebat', 'Tidak peka', 'Tidak toleran', 'Sulit fokus', 'Sulit menindaklanjuti'],
      famousExamples: [
        'Socrates', 'Mark Twain', 'Thomas Edison', 'Celine Dion',
        'Tom Hanks', 'Robert Downey Jr.', 'Jack Sparrow (Pirates of the Caribbean)',
        'The Joker (Batman)', 'Tyrion Lannister (Game of Thrones)'
      ],
      careerSuggestions: ['Pengacara', 'Psikolog', 'Pengusaha', 'Konsultan', 'Aktor', 'Ilmuwan'],
    ),

    // ===========================================
    // Group 2: Diplomat (Hijau)
    // ===========================================
    'INFJ': MBTIType(
      code: 'INFJ',
      name: 'Advokat',
      group: 'Diplomat',
      description: 'Advokat (INFJ) merupakan tipe kepribadian yang terbilang paling langka, tetapi mereka pasti akan meninggalkan jejak mereka di dunia. Mereka adalah idealis yang tak kenal lelah dan berprinsip. Mereka tidak hanya memimpikan dunia yang lebih baik, mereka bertindak dan berusaha mewujudkannya, seringkali dengan menginspirasi orang lain.',
      traits: ['Idealis', 'Inspiratif', 'Pendiam', 'Berprinsip', 'Mistik'],
      strengths: ['Kreatif', 'Berwawasan', 'Berprinsip', 'Penuh gairah', 'Altruistis'],
      weaknesses: ['Sangat sensitif', 'Sangat tertutup', 'Perfeksionis', 'Idealisme tinggi', 'Mudah lelah'],
      famousExamples: [
        'Martin Luther King Jr.', 'Nelson Mandela', 'Mother Teresa', 'Lady Gaga',
        'Morgan Freeman', 'Nicole Kidman', 'Marie Kondo', 'Jon Snow (Game of Thrones)',
        'Galadriel (Lord of the Rings)', 'Albus Dumbledore (Harry Potter)'
      ],
      careerSuggestions: ['Konselor', 'Terapis', 'Guru', 'Pekerja Sosial', 'Penulis', 'Psikolog'],
    ),
    'INFP': MBTIType(
      code: 'INFP',
      name: 'Mediator',
      group: 'Diplomat',
      description: 'Mediator (INFP) adalah sosok introvert yang idealis, kreatif, dan memiliki jiwa kemanusiaan yang tinggi. Mereka mungkin terlihat pendiam atau pemalu, tetapi mereka memiliki api batin dan semangat yang sangat besar. Dengan pendekatan puitis dan baik hati, mereka selalu mencari kebaikan bahkan di orang terburuk sekalipun, berusaha membuat segalanya menjadi lebih baik.',
      traits: ['Puitis', 'Baik hati', 'Altruistis', 'Idealis', 'Empatis'],
      strengths: ['Empatis', 'Murah hati', 'Berpikiran terbuka', 'Kreatif', 'Penuh gairah', 'Idealis'],
      weaknesses: ['Tidak praktis', 'Terlalu idealis', 'Sulit dikenal', 'Sering menyalahkan diri', 'Terlalu altruistis'],
      famousExamples: [
        'William Shakespeare', 'J.R.R. Tolkien', 'Björk', 'Johnny Depp',
        'Julia Roberts', 'Tom Hiddleston', 'Alicia Keys', 'Frodo Baggins (Lord of the Rings)',
        'Amélie Poulain (Amélie)', 'Fox Mulder (The X-Files)'
      ],
      careerSuggestions: ['Penulis', 'Seniman', 'Aktor', 'Psikolog', 'Desainer Grafis', 'Terapis Fisik'],
    ),
    'ENFJ': MBTIType(
      code: 'ENFJ',
      name: 'Protagonis',
      group: 'Diplomat',
      description: 'Protagonis (ENFJ) adalah pribadi optimistis yang inspiratif, siap bertindak untuk melakukan hal yang mereka rasa benar. Mereka adalah orang yang tulus dan peduli, tidak hanya berkata-kata, namun juga bertindak. Tidak ada yang lebih membahagiakan mereka selain memotivasi orang lain untuk berbuat baik dan menjadi versi terbaik dari diri mereka.',
      traits: ['Karisma', 'Inspiratif', 'Empatis', 'Pemimpin', 'Toleran'],
      strengths: ['Toleran', 'Dapat diandalkan', 'Karisma', 'Altruistis', 'Pemimpin alami'],
      weaknesses: ['Terlalu idealis', 'Terlalu tanpa pamrih', 'Sangat sensitif', 'Sulit mengambil keputusan sulit', 'Harga diri berfluktuasi'],
      famousExamples: [
        'Barack Obama', 'Oprah Winfrey', 'John Wooden', 'Ben Affleck',
        'Jennifer Lawrence', 'Maya Angelou', 'Daenerys Targaryen (Game of Thrones)',
        'Elizabeth Bennet (Pride and Prejudice)', 'Morpheus (The Matrix)'
      ],
      careerSuggestions: ['Guru', 'Politisi', 'Manajer HR', 'Sales', 'Konselor', 'Diplomat'],
    ),
    'ENFP': MBTIType(
      code: 'ENFP',
      name: 'Juru Kampanye',
      group: 'Diplomat',
      description: 'Juru Kampanye (ENFP) adalah jiwa bebas sejati. Mereka sering kali menjadi pusat perhatian, tetapi mereka kurang tertarik pada kegembiraan sesaat dan lebih menikmati hubungan sosial dan emosional yang mereka bangun dengan orang lain. Mereka antusias, kreatif, dan mudah bergaul, selalu menemukan alasan untuk tersenyum.',
      traits: ['Antusias', 'Kreatif', 'Mudah bergaul', 'Berjiwa bebas', 'Penasaran'],
      strengths: ['Penasaran', 'Pengamat yang baik', 'Enerjik', 'Antusias', 'Komunikator hebat', 'Populer'],
      weaknesses: ['Keterampilan praktis buruk', 'Sulit fokus', 'Terlalu banyak berpikir', 'Mudah stres', 'Sangat emosional'],
      famousExamples: [
        'Robert Downey, Jr.', 'Will Smith', 'Robin Williams', 'Quentin Tarantino',
        'Ellen DeGeneres', 'Drew Barrymore', 'Spider-Man (Marvel)',
        'Willy Wonka (Charlie and the Chocolate Factory)', 'Ariel (The Little Mermaid)'
      ],
      careerSuggestions: ['Aktor', 'Jurnalis', 'Terapis', 'Agen Perjalanan', 'Diplomat', 'Reporter'],
    ),

    // ===========================================
    // Group 3: Pengawal (Kuning)
    // ===========================================
    'ISTJ': MBTIType(
      code: 'ISTJ',
      name: 'Ahli Logistik',
      group: 'Pengawal',
      description: 'Ahli Logistik (ISTJ) adalah individu yang praktis dan berorientasi fakta, yang keandalannya tidak dapat diragukan. Mereka adalah pribadi penuh dedikasi dan integritas, bertanggung jawab atas tindakan mereka dan bangga dengan pekerjaan yang mereka lakukan. Mereka lebih suka bekerja sendiri, tetapi juga bisa diandalkan dalam tim.',
      traits: ['Praktis', 'Berorientasi fakta', 'Dapat diandalkan', 'Jujur', 'Sistematis'],
      strengths: ['Jujur', 'Berkemauan kuat', 'Bertanggung jawab', 'Tenang', 'Setia', 'Pekerja keras'],
      weaknesses: ['Keras kepala', 'Tidak peka', 'Kaku', 'Selalu menyalahkan diri', 'Suka menghakimi'],
      famousExamples: [
        'George Washington', 'Angela Merkel', 'Natalie Portman', 'Warren Buffett',
        'Anthony Hopkins', 'Sting', 'Hermione Granger (Harry Potter)',
        'Gerard (The Fugitive)', 'Eddard Stark (Game of Thrones)'
      ],
      careerSuggestions: ['Akuntan', 'Auditor', 'Inspektur', 'Manajer Logistik', 'Perwira Militer', 'Hakim'],
    ),
    'ISFJ': MBTIType(
      code: 'ISFJ',
      name: 'Pembela',
      group: 'Pengawal',
      description: 'Pembela (ISFJ) adalah pribadi yang penuh perhatian, kehangatan, dan aura positifnya bisa membawa ketenangan pada orang-orang di sekitarnya. Mereka adalah pelindung yang sangat berdedikasi dan hangat, selalu siap membela orang yang mereka cintai dari bahaya. Kepekaan mereka terhadap orang lain hampir seperti sebuah indra keenam.',
      traits: ['Berdedikasi', 'Hangat', 'Pelindung', 'Suportif', 'Setia'],
      strengths: ['Suportif', 'Dapat diandalkan', 'Pengamat yang baik', 'Antusias', 'Pekerja keras', 'Keterampilan praktis baik'],
      weaknesses: ['Terlalu rendah hati', 'Sangat tertutup', 'Memendam perasaan', 'Terlalu tanpa pamrih', 'Ragu untuk berubah'],
      famousExamples: [
        'Mother Teresa', 'Ratu Elizabeth II', 'Beyoncé', 'Kate Middleton',
        'Vin Diesel', 'Halle Berry', 'Kapten Amerika (Marvel)',
        'Dr. Watson (Sherlock Holmes)', 'Samwise Gamgee (Lord of the Rings)'
      ],
      careerSuggestions: ['Perawat', 'Guru', 'Pekerja Sosial', 'Dokter', 'Desainer Interior', 'Pustawan'],
    ),
    'ESTJ': MBTIType(
      code: 'ESTJ',
      name: 'Eksekutif',
      group: 'Pengawal',
      description: 'Eksekutif (ESTJ) adalah perwakilan dari tradisi dan ketertiban, memanfaatkan pemahaman mereka tentang apa yang benar, salah, dan dapat diterima secara sosial untuk menyatukan keluarga dan komunitas. Mereka adalah organisator yang unggul, tak tertandingi dalam mengelola berbagai hal, termasuk orang-orang.',
      traits: ['Administrator', 'Manajer', 'Terorganisir', 'Jujur', 'Tradisional'],
      strengths: ['Berdedikasi', 'Berkemauan kuat', 'Jujur', 'Setia', 'Sabar', 'Pengatur ulung'],
      weaknesses: ['Tidak fleksibel', 'Keras kepala', 'Sulit bersantai', 'Suka menghakimi', 'Sulit mengekspresikan emosi'],
      famousExamples: [
        'Sonia Sotomayor', 'John D. Rockefeller', 'Lyndon B. Johnson', 'Judge Judy',
        'Emma Watson', 'Frank Sinatra', 'Boromir (Lord of the Rings)',
        'Dwight Schrute (The Office)', 'Robb Stark (Game of Thrones)'
      ],
      careerSuggestions: ['Manajer', 'Hakim', 'Petugas Polisi', 'Analis Keuangan', 'Kepala Sekolah', 'Eksekutif'],
    ),
    'ESFJ': MBTIType(
      code: 'ESFJ',
      name: 'Konsul',
      group: 'Pengawal',
      description: 'Konsul (ESFJ) adalah pribadi yang penuh perhatian, supel, dan berorientasi pada masyarakat serta selalu ingin membantu. Mereka adalah "si pemandu sorak" di sekolah atau "si populer" yang selalu ada untuk teman-temannya. Dermawan dan dapat diandalkan, mereka sering melakukan sesuatu untuk menyatukan komunitas mereka.',
      traits: ['Peduli', 'Sosial', 'Populer', 'Suka membantu', 'Harmonis'],
      strengths: ['Keterampilan praktis kuat', 'Rasa kewajiban kuat', 'Sangat setia', 'Sensitif dan hangat', 'Pandai bergaul'],
      weaknesses: ['Khawatir status sosial', 'Tidak fleksibel', 'Tidak suka dikritik', 'Sangat manja', 'Terlalu tanpa pamrih'],
      famousExamples: [
        'Taylor Swift', 'Bill Clinton', 'Jennifer Garner', 'Danny Glover',
        'Jennifer Lopez', 'Steve Harvey', 'Monica Geller (Friends)',
        'Sansa Stark (Game of Thrones)', 'Karakter Disney Princess (Cinderella, dll.)'
      ],
      careerSuggestions: ['Koordinator Acara', 'Perawat', 'Manajer Kantor', 'Guru TK', 'Agen Real Estat', 'Sales'],
    ),

    // ===========================================
    // Group 4: Penjelajah (Ungu)
    // ===========================================
    'ISTP': MBTIType(
      code: 'ISTP',
      name: 'Virtuoso',
      group: 'Penjelajah',
      description: 'Virtuoso (ISTP) adalah individu yang cenderung logis, analitis, dan praktis. Mereka senang menjelajahi dunia dengan tangan dan mata mereka, menyentuh dan mengamati dengan rasa ingin tahu yang rasional. Mereka adalah pemecah masalah alami, senang membongkar sesuatu dan menyatukannya kembali hanya untuk melihat cara kerjanya.',
      traits: ['Berani', 'Praktis', 'Eksperimenter', 'Rasional', 'Santai'],
      strengths: ['Optimis', 'Enerjik', 'Kreatif', 'Praktis', 'Baik dalam krisis', 'Santai'],
      weaknesses: ['Keras kepala', 'Tidak peka', 'Sangat tertutup', 'Mudah bosan', 'Pengambil risiko', 'Sulit berkomitmen'],
      famousExamples: [
        'Michael Jordan', 'Clint Eastwood', 'Tom Cruise', 'Bear Grylls',
        'Bruce Lee', 'Olivia Wilde', 'Indiana Jones (Indiana Jones)',
        'James Bond (007)', 'Arya Stark (Game of Thrones)'
      ],
      careerSuggestions: ['Mekanik', 'Insinyur', 'Pilot', 'Pemadam Kebakaran', 'Paramedis', 'Detektif'],
    ),
    'ISFP': MBTIType(
      code: 'ISFP',
      name: 'Petualang',
      group: 'Penjelajah',
      description: 'Petualang (ISFP) adalah seniman sejati, tetapi belum tentu dalam arti konvensional. Mereka adalah orang yang benar-benar optimistis dan selalu menemukan kegembiraan dalam setiap hari. Mereka menggunakan estetika, desain, dan bahkan pilihan mereka untuk mendorong batasan konvensi sosial, menjalani hidup yang penuh warna dan sensual.',
      traits: ['Fleksibel', 'Menawan', 'Artistik', 'Suka bertualang', 'Sensitif'],
      strengths: ['Menawan', 'Sensitif terhadap orang lain', 'Imajinatif', 'Penuh gairah', 'Penasaran', 'Artistik'],
      weaknesses: ['Sangat mandiri', 'Tidak terduga', 'Mudah stres', 'Terlalu kompetitif', 'Harga diri berfluktuasi'],
      famousExamples: [
        'Michael Jackson', 'Frida Kahlo', 'Britney Spears', 'Avril Lavigne',
        'Kevin Costner', 'Lana Del Rey', 'Harry Potter (Harry Potter)',
        'Eowyn (Lord of the Rings)', 'Legolas (Lord of the Rings)'
      ],
      careerSuggestions: ['Seniman', 'Musisi', 'Desainer', 'Koki', 'Fotografer', 'Perawat Hewan'],
    ),
    'ESTP': MBTIType(
      code: 'ESTP',
      name: 'Pengusaha',
      group: 'Penjelajah',
      description: 'Pengusaha (ESTP) adalah orang yang cerdas, energik, dan sangat tanggap, yang benar-benar menikmati hidup di tepi jurang. Bagi mereka, hidup adalah petualangan yang berani. Mereka senang menjadi pusat perhatian dan merupakan orang-orang yang paling mahir dalam memengaruhi orang lain, menjalani hidup dengan spontan dan menikmati setiap saat.',
      traits: ['Cerdas', 'Enerjik', 'Tanggap', 'Pengambil risiko', 'Sosial'],
      strengths: ['Berani', 'Rasional', 'Praktis', 'Orisinal', 'Pandai bergaul', 'Tanggap'],
      weaknesses: ['Tidak peka', 'Tidak sabaran', 'Rentan risiko', 'Tidak terstruktur', 'Suka menentang', 'Sulit fokus'],
      famousExamples: [
        'Ernest Hemingway', 'Jack Nicholson', 'Madonna', 'Bruce Willis',
        'Eddie Murphy', 'Nicolas Sarkozy', 'Han Solo (Star Wars)',
        'Jaime Lannister (Game of Thrones)', 'Rocket (Marvel)'
      ],
      careerSuggestions: ['Pengusaha', 'Detektif', 'Paramedis', 'Atlet', 'Sales', 'Perwira Polisi'],
    ),
    'ESFP': MBTIType(
      code: 'ESFP',
      name: 'Penghibur',
      group: 'Penjelajah',
      description: 'Penghibur (ESFP) adalah pribadi yang senang menghibur orang lain dan suka menjadi pusat perhatian. Mereka adalah orang yang spontan, energik, dan antusias—hidup tidak pernah membosankan di sekitar mereka. Mereka senang menjadi pusat perhatian dan tahu cara membuat setiap momen terasa seperti pesta.',
      traits: ['Spontan', 'Enerjik', 'Antusias', 'Penghibur', 'Sosial'],
      strengths: ['Berani', 'Orisinal', 'Estetika baik', 'Praktis', 'Pandai menghibur', 'Pandai mengamati'],
      weaknesses: ['Sensitif', 'Tidak suka konflik', 'Mudah bosan', 'Perencana jangka panjang buruk', 'Sulit fokus'],
      famousExamples: [
        'Marilyn Monroe', 'Adele', 'Elton John', 'Jamie Oliver',
        'Will Smith', 'Serena Williams', 'Jack Dawson (Titanic)',
        'Pippin Took (Lord of the Rings)', 'Fred & George Weasley (Harry Potter)'
      ],
      careerSuggestions: ['Aktor', 'Musisi', 'Perencana Acara', 'Pemandu Wisata', 'Pramugari', 'Desainer Busana'],
    ),
  };

  static Color getGroupColor(String group) {
    switch (group) {
      case 'Analis':
        return Colors.purple.shade600;
      case 'Diplomat':
        return Colors.green.shade600;
      case 'Pengawal':
        return Colors.blue.shade700;
      case 'Penjelajah':
        return Colors.amber.shade700;
      default:
        return Colors.grey;
    }
  }

  static IconData getGroupIcon(String group) {
    switch (group) {
      case 'Analis':
        return Icons.analytics_outlined;
      case 'Diplomat':
        return Icons.people_outline;
      case 'Pengawal':
        return Icons.shield_outlined;
      case 'Penjelajah':
        return Icons.explore_outlined;
      default:
        return Icons.person_outline;
    }
  }
}
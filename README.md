# PersonaTest - Aplikasi Tes Kepribadian MBTI

Sebuah aplikasi kuis MBTI yang dibangun menggunakan Flutter sebagai pemenuhan Ujian Tengah Semester (UTS).

## 👤 Data Diri

* **Nama:** Albert Sanggam Nalom Sinurat
* **NIM:** 231401034
* **Lab:** PM 1 (Pemrograman Mobile 1)


---

## 📝 Deskripsi Aplikasi

[cite_start](Sesuai dengan kriteria `b. Nama Aplikasi` [cite: 64] dan `c. Deskripsi Aplikasi` [cite: 65])

[cite_start]**PersonaTest** adalah aplikasi kuis pilihan ganda [cite: 7] yang dirancang untuk membantu pengguna menemukan tipe kepribadian MBTI (Myers-Briggs Type Indicator) mereka. Aplikasi ini dibuat untuk memenuhi tugas UTS Lab Pemrograman Mobile 1 (PM1) Semester Ganjil T.A. [cite_start]2025/2026[cite: 9, 10, 11].

[cite_start]Pengguna dapat memasukkan nama [cite: 7][cite_start], memilih gender (untuk avatar), menjawab 20 pertanyaan [cite: 7] [cite_start]yang dipilih secara acak dari bank soal, dan langsung melihat halaman hasil yang mendetail[cite: 7]. [cite_start]Aplikasi ini juga dilengkapi dengan fitur riwayat tes, dual-theme (Light/Dark mode)[cite: 28], dan fungsionalitas untuk menghapus data riwayat.

### ✨ Fitur Utama
* **Tes 20 Soal:** Menggunakan 5 pertanyaan acak per dikotomi (dari total 100 bank soal).
* **16 Tipe Kepribadian:** Halaman hasil yang kaya dan mendetail untuk semua 16 tipe.
* **Avatar Dinamis:** Gambar hasil (avatar) menyesuaikan dengan gender yang dipilih pengguna.
* [cite_start]**Dual-Theme:** Mendukung Light Mode dan Dark Mode secara penuh[cite: 28].
* **Riwayat Tes:** Menyimpan semua hasil tes sebelumnya secara lokal di perangkat.
* **Manajemen Riwayat:** Pengguna dapat menghapus semua riwayat sekaligus atau menghapus satu per satu.
* **Animasi & Haptic:** Dilengkapi animasi *loading*, *fade-in*, *slide-in*, *confetti* di halaman hasil, dan *haptic feedback* untuk UX yang lebih baik.
* **Fitur Berbagi:** Pengguna dapat membagikan hasil tes mereka ke aplikasi lain.

---

## 📸 Tampilan Aplikasi (Screenshot)

[cite_start](Sesuai dengan kriteria `e. Screenshot/Video Aplikasi` [cite: 67])

| Welcome Screen (Light) | Welcome Screen (Dark)|              Input Nama               |
| :---: | :---: |:-------------------------------------:|
| ![img.png](img.png) |![img_1.png](img_1.png) |        ![img_2.png](img_2.png)        |
| **Quiz Screen (Light)** | **Quiz Screen (Dark)** |       **Result Screen (Light)**       |
| ![img_3.png](img_3.png) |![img_6.png](img_6.png) | ![img_4.png](img_4.png)   |
| **Result Screen (Dark)** | **History Screen (Light)** |      **History Screen (Empty)**       |
| [![img_7.png](img_7.png) | ![img_5.png](img_5.png) | ![img_8.png](img_8.png) |

---

## 🎨 Mockup / Prototype (Figma)

[cite_start](Sesuai dengan kriteria `f. Link mockup/prototype Aplikasi` [cite: 68])

Seluruh desain dan prototipe aplikasi ini dibuat menggunakan Figma.

* **https://www.figma.com/design/dhRaJbPt6mi9InnxK2xlrD/mbti_quizz?node-id=2-2&t=oKlpSq2IFvk2cXkf-1**

---

## 📚 Aset & Referensi (Credit)

[cite_start](Sesuai dengan kriteria `d. Credit ke sumber-sumber aset yang digunakan` [cite: 66])

* [cite_start]**Konten & Avatar MBTI:** Seluruh data deskripsi, ciri-ciri, saran karir, dan gambar avatar kepribadian diambil dari [16Personalities.com](https://www.16personalities.com/id/tipe-kepribadian)[cite: 31, 32].
* **Logo Aplikasi:** `https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Fpremium-vector%2Fmyersbriggs-type-indicator-mbti-psychological-test-introversion-extraversion-feeling-judging-etc_33440073.htm&psig=AOvVaw2_qjqIZg-m59byi7OEHXAf&ust=1762555802033000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCNjw75XO3pADFQAAAAAdAAAAABAE`
* **Font:** [Google Fonts](https://fonts.google.com/) (Menggunakan font Poppins dan Inter).
* **Manajemen State:** [Provider](https://pub.dev/packages/provider).
* **Penyimpanan Lokal:** [shared_preferences](https://pub.dev/packages/shared_preferences).
* **Animasi Konfeti:** [confetti](https://pub.dev/packages/confetti).
* **Fitur Berbagi:** [share_plus](https://pub.dev/packages/share_plus).
* **Haptic Feedback:** [vibration](https://pub.dev/packages/vibration).
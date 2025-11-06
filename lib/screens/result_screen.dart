import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mbti_quiz/providers/quiz_provider.dart';
import 'package:mbti_quiz/data/mbti_data.dart';
import 'package:mbti_quiz/models/mbti_result_model.dart';

// Kita ubah kembali ke StatelessWidget. Ini lebih sederhana dan TEPAT.
// Kita akan mengambil data dari provider, BUKAN menghitungnya di sini.
class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  // === FUNGSI NAVIGASI "TES ULANG" ===
  // (Dipindah ke sini agar bisa diakses dari build method)
  void _handleRetest(BuildContext context) {
    // Ambil provider DENGAN listen: false
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    try {
      quizProvider.resetQuiz();
      Future.delayed(const Duration(milliseconds: 100), () {
        // 'mounted' tidak ada di StatelessWidget, tapi jika kita navigasi
        // widget ini akan di-dispose. Ini aman.
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main', // Navigasi ke /main (input nama)
              (route) => false, // Hapus semua rute sebelumnya
        );
      });
    } catch (e) {
      print('Error during retest: $e');
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
            (route) => false,
      );
    }
  }

  // === FUNGSI NAVIGASI "HOME" ===
  void _handleGoHome(BuildContext context) {
    // Ambil provider DENGAN listen: false
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    try {
      quizProvider.resetQuiz();
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/', // Navigasi ke / (Welcome Screen)
              (route) => false, // Hapus semua rute sebelumnya
        );
      });
    } catch (e) {
      print('Error during go home: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // AMBIL DATA DARI PROVIDER
    // Kita berasumsi calculateResult() SUDAH dipanggil di quiz_screen
    // dan provider BELUM di-reset.
    final quizProvider = Provider.of<QuizProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // === PERBAIKAN BUG FLICKER & 2X HISTORY ===
    // Jika provider di-reset (currentUser null), segera navigasi.
    // Ini mencegah build error DAN mencegah panggilan ganda.
    if (quizProvider.currentUser == null || !quizProvider.quizCompleted) {
      // Ini akan menangani kasus di-refresh atau di-reset
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      });
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Data tes tidak valid, mengarahkan...'),
            ],
          ),
        ),
      );
    }

    // === BUAT DATA HASIL SECARA LOKAL ===
    // Kita TIDAK memanggil calculateResult() lagi.
    // Kita hanya mengambil data yang SUDAH ADA di provider.
    final MBTIResult result = quizProvider.getCachedResult(); // Panggil fungsi getCachedResult
    final MBTIType mbtiType = MBTIData.types[result.mbtiType]!;
    final String imagePath = quizProvider.getGenderSpecificImage(result.mbtiType, noBackground: true);
    final Color groupColor = MBTIData.getGroupColor(mbtiType.group);
    final IconData groupIcon = MBTIData.getGroupIcon(mbtiType.group);

    // Ini adalah kode build UI Anda, tidak berubah
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('❌ Error loading image: $error');
                  print('🔍 Image path: $imagePath');
                  return Container(
                    color: isDarkMode ? Colors.grey.shade800 : groupColor.withOpacity(0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          groupIcon,
                          size: 100,
                          color: groupColor,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Gambar ${result.mbtiType}-${quizProvider.currentUser?.gender.toUpperCase()}(c) tidak ditemukan',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: isDarkMode ? Colors.grey.shade400 : groupColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pastikan file ada di: assets/images/',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: isDarkMode ? Colors.grey.shade500 : groupColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Selamat!',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: groupColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      '${result.user.name}',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: isDarkMode ? Colors.grey.shade400 : groupColor.withOpacity(0.8),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Card(
                    elevation: 4,
                    color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: groupColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: groupColor,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  result.mbtiType,
                                  style: GoogleFonts.poppins(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: groupColor,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  mbtiType.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode ? Colors.white : Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      groupIcon,
                                      size: 16,
                                      color: groupColor,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      mbtiType.group,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: groupColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            mbtiType.description,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  Text(
                    'Dimensi Kepribadian Anda',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildDimensionProgress(
                    context: context,
                    label: 'Extraversion (E)',
                    value: result.percentages['E']! / 100,
                    oppositeValue: result.percentages['I']! / 100,
                    oppositeLabel: 'Introversion (I)',
                    groupColor: groupColor,
                    isDarkMode: isDarkMode,
                  ),
                  _buildDimensionProgress(
                    context: context,
                    label: 'Sensing (S)',
                    value: result.percentages['S']! / 100,
                    oppositeValue: result.percentages['N']! / 100,
                    oppositeLabel: 'Intuition (N)',
                    groupColor: groupColor,
                    isDarkMode: isDarkMode,
                  ),
                  _buildDimensionProgress(
                    context: context,
                    label: 'Thinking (T)',
                    value: result.percentages['T']! / 100,
                    oppositeValue: result.percentages['F']! / 100,
                    oppositeLabel: 'Feeling (F)',
                    groupColor: groupColor,
                    isDarkMode: isDarkMode,
                  ),
                  _buildDimensionProgress(
                    context: context,
                    label: 'Judging (J)',
                    value: result.percentages['J']! / 100,
                    oppositeValue: result.percentages['P']! / 100,
                    oppositeLabel: 'Perceiving (P)',
                    groupColor: groupColor,
                    isDarkMode: isDarkMode,
                  ),
                  SizedBox(height: 32),

                  Text(
                    'Ciri-ciri Utama',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: mbtiType.traits.map((trait) {
                      return Chip(
                        label: Text(
                          trait,
                          style: GoogleFonts.inter(
                            color: isDarkMode ? Colors.white : groupColor,
                          ),
                        ),
                        backgroundColor: isDarkMode ? groupColor.withOpacity(0.3) : groupColor.withOpacity(0.1),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 24),
                  Text(
                    'Tokoh Terkenal dengan Kepribadian Sama',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: groupColor,
                      ),
                    ),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: mbtiType.famousExamples.map((person) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isDarkMode ? groupColor.withOpacity(0.3) : groupColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            person,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: isDarkMode ? Colors.white : groupColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(height: 24),
                  Text(
                    'Saran Karir yang Cocok',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: mbtiType.careerSuggestions.map((career) {
                      return Chip(
                        label: Text(
                          career,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: isDarkMode ? Colors.white : groupColor,
                          ),
                        ),
                        backgroundColor: isDarkMode ? groupColor.withOpacity(0.3) : groupColor.withOpacity(0.1),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 32),

                  // Memanggil _buildActionButtons
                  _buildActionButtons(context, groupColor, isDarkMode),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === PERUBAHAN DI SINI ===
  // (Tombol tidak perlu quizProvider lagi, karena fungsi navigasi
  //  sudah ada di dalam class ini)
  Widget _buildActionButtons(BuildContext context, Color groupColor, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            _handleRetest(context); // Panggil _handleRetest
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: groupColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Tes Ulang',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            _handleGoHome(context); // Panggil _handleGoHome
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: groupColor,
            side: BorderSide(
              color: groupColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Kembali ke Home',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12),
        TextButton(
          onPressed: () {
            _showShareDialog(context, groupColor);
          },
          child: Text(
            'Bagikan Hasil',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              color: groupColor.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }

  // Fungsi helper _buildDimensionProgress
  Widget _buildDimensionProgress({
    required BuildContext context,
    required String label,
    required double value,
    required double oppositeValue,
    required String oppositeLabel,
    required Color groupColor,
    required bool isDarkMode,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: groupColor,
                ),
              ),
              Text(
                oppositeLabel,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: groupColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                height: 8,
                width: MediaQuery.of(context).size.width * value,
                decoration: BoxDecoration(
                  color: groupColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(value * 100).round()}%',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
              Text(
                '${(oppositeValue * 100).round()}%',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi helper _showShareDialog
  void _showShareDialog(BuildContext context, Color groupColor) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Bagikan Hasil',
          style: TextStyle(color: groupColor),
        ),
        content: Text('Fitur berbagi hasil akan segera tersedia!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: TextStyle(color: groupColor),
            ),
          ),
        ],
      ),
    );
  }
}
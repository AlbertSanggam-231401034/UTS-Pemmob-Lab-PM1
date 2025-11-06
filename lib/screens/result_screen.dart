import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mbti_quiz/providers/quiz_provider.dart';
import 'package:mbti_quiz/data/mbti_data.dart';
import 'package:mbti_quiz/models/mbti_result_model.dart';

// Impor untuk fitur Polishing (Phase 4)
import 'package:mbti_quiz/utils/share_manager.dart';
import 'package:mbti_quiz/utils/haptic_feedback.dart'; // <-- Class HapticFeedback baru Anda
import 'package:mbti_quiz/widgets/animations/fade_in_animation.dart';
import 'package:mbti_quiz/widgets/animations/slide_in_animation.dart';
import 'package:mbti_quiz/widgets/animations/confetti_animation.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // State untuk Confetti (dari kode baru Anda)
  bool _showConfetti = true;

  // State untuk Data Hasil (dari perbaikan bug kita)
  MBTIResult? _result;
  MBTIType? _mbtiType;
  String? _imagePath;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Panggil fungsi untuk memuat data DENGAN AMAN
    _loadResultData();

    // Jalankan Haptic Feedback & timer Konfeti (dari kode baru Anda)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HapticFeedback.success(); // Panggil class HapticFeedback baru Anda
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showConfetti = false;
        });
      }
    });
  }

  void _loadResultData() {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);

    // Keamanan jika state hilang
    if (quizProvider.currentUser == null || !quizProvider.quizCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      });
      return;
    }

    // === PERBAIKAN BUG UTAMA ===
    // Panggil getCachedResult(), BUKAN calculateResult()
    final result = quizProvider.getCachedResult();
    // ===========================

    final mbtiType = MBTIData.types[result.mbtiType]!;
    final imagePath = quizProvider.getGenderSpecificImage(result.mbtiType, noBackground: true);

    setState(() {
      _result = result;
      _mbtiType = mbtiType;
      _imagePath = imagePath;
      _isLoading = false;
    });
  }

  // === FUNGSI NAVIGASI "TES ULANG" (dari perbaikan bug kita) ===
  void _handleRetest(BuildContext context) {
    setState(() { _isLoading = true; }); // Mencegah error flicker
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    try {
      quizProvider.resetQuiz();
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/main',
                (route) => false,
          );
        }
      });
    } catch (e) {
      print('Error during retest: $e');
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    }
  }

  // === FUNGSI NAVIGASI "HOME" (dari perbaikan bug kita) ===
  void _handleGoHome(BuildContext context) {
    setState(() { _isLoading = true; }); // Mencegah error flicker
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    try {
      quizProvider.resetQuiz();
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
                (route) => false,
          );
        }
      });
    } catch (e) {
      print('Error during go home: $e');
    }
  }

  // === FUNGSI SHARE (dari kode baru Anda) ===
  void _shareResult(BuildContext context, MBTIResult result) {
    HapticFeedback.medium(); // Panggil class HapticFeedback baru Anda
    ShareManager.shareResult(
      mbtiType: result.mbtiType,
      userName: result.user.name,
      percentages: result.percentages,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan loading spinner (Spinner kustom Anda akan dipakai di sini jika Anda mau)
    if (_isLoading || _result == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Menyiapkan hasil tes Anda...'),
            ],
          ),
        ),
      );
    }

    // Setelah loading, kita jamin data tidak null
    final result = _result!;
    final mbtiType = _mbtiType!;
    final imagePath = _imagePath!;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final groupColor = MBTIData.getGroupColor(mbtiType.group);
    final groupIcon = MBTIData.getGroupIcon(mbtiType.group);

    // Kode UI Anda yang baru, dengan Confetti
    return ConfettiAnimation(
      isStopped: !_showConfetti,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeInAnimation( // <-- Animasi dari kode baru
                  duration: const Duration(milliseconds: 1000),
                  child: Image.asset(
                    imagePath, // Menggunakan imagePath dari state
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: isDarkMode ? Colors.grey.shade800 : groupColor.withOpacity(0.1),
                        child: Icon(
                          groupIcon,
                          size: 100,
                          color: groupColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SlideInAnimation( // <-- Animasi dari kode baru
                beginOffset: const Offset(0.0, 0.3), // Sedikit di-adjust
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Congratulations (dengan emoji dari kode baru)
                      FadeInAnimation(
                        duration: const Duration(milliseconds: 800),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Selamat! 🎉',
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${result.user.name}',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // MBTI Type Card
                      _buildMBTITypeCard(result, mbtiType, isDarkMode, groupColor, groupIcon),
                      const SizedBox(height: 24),

                      // Personality Dimensions
                      _buildDimensionsSection(result, isDarkMode, groupColor),
                      const SizedBox(height: 32),

                      // Key Traits
                      _buildKeyTraitsSection(mbtiType, isDarkMode, groupColor),
                      const SizedBox(height: 24),

                      // Famous Examples Section
                      _buildFamousExamplesSection(mbtiType, isDarkMode, groupColor),
                      const SizedBox(height: 24),

                      // Career Suggestions Section
                      _buildCareerSuggestionsSection(mbtiType, isDarkMode, groupColor),
                      const SizedBox(height: 32),

                      // Action Buttons (Versi 3 tombol yang sudah diperbaiki)
                      _buildActionButtons(context, result, groupColor),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPER (Menggabungkan kode baru + perbaikan bug) ---

  Widget _buildMBTITypeCard(MBTIResult result, MBTIType mbtiType, bool isDarkMode, Color groupColor, IconData groupIcon) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 1200),
      child: Card(
        elevation: 8,
        color: isDarkMode ? Colors.grey.shade800 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                    const SizedBox(height: 8),
                    Text(
                      mbtiType.name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          groupIcon,
                          size: 16,
                          color: groupColor,
                        ),
                        const SizedBox(width: 8),
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
              const SizedBox(height: 20),
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
    );
  }

  Widget _buildDimensionsSection(MBTIResult result, bool isDarkMode, Color groupColor) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dimensi Kepribadian Anda',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildDimensionProgress(
            label: 'Extraversion (E)',
            value: result.percentages['E']! / 100,
            oppositeValue: result.percentages['I']! / 100,
            oppositeLabel: 'Introversion (I)',
            isDarkMode: isDarkMode,
            color: groupColor, // Menggunakan groupColor dinamis
          ),
          _buildDimensionProgress(
            label: 'Sensing (S)',
            value: result.percentages['S']! / 100,
            oppositeValue: result.percentages['N']! / 100,
            oppositeLabel: 'Intuition (N)',
            isDarkMode: isDarkMode,
            color: groupColor, // Menggunakan groupColor dinamis
          ),
          _buildDimensionProgress(
            label: 'Thinking (T)',
            value: result.percentages['T']! / 100,
            oppositeValue: result.percentages['F']! / 100,
            oppositeLabel: 'Feeling (F)',
            isDarkMode: isDarkMode,
            color: groupColor, // Menggunakan groupColor dinamis
          ),
          _buildDimensionProgress(
            label: 'Judging (J)',
            value: result.percentages['J']! / 100,
            oppositeValue: result.percentages['P']! / 100,
            oppositeLabel: 'Perceiving (P)',
            isDarkMode: isDarkMode,
            color: groupColor, // Menggunakan groupColor dinamis
          ),
        ],
      ),
    );
  }

  Widget _buildKeyTraitsSection(MBTIType mbtiType, bool isDarkMode, Color groupColor) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 1600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ciri-ciri Utama',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
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
                backgroundColor: groupColor.withOpacity(0.1), // Dibuat konsisten
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFamousExamplesSection(MBTIType mbtiType, bool isDarkMode, Color groupColor) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 1800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tokoh Terkenal dengan Kepribadian Sama',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey.shade800 : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: groupColor.withOpacity(0.5), // Dibuat konsisten
              ),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: mbtiType.famousExamples.map((person) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: groupColor.withOpacity(0.1), // Dibuat konsisten
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    person,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white70 : groupColor, // Dibuat konsisten
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareerSuggestionsSection(MBTIType mbtiType, bool isDarkMode, Color groupColor) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 2000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saran Karir yang Cocok',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
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
                backgroundColor: groupColor.withOpacity(0.1), // Dibuat konsisten
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // === MENGGUNAKAN VERSI 3 TOMBOL (FIX INFINITY LOOP) + HAPTIC & SHARE ===
  Widget _buildActionButtons(BuildContext context, MBTIResult result, Color groupColor) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 2200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tombol 1: Tes Ulang (ElevatedButton - Paling Penting)
          ElevatedButton(
            onPressed: () {
              HapticFeedback.medium(); // Panggil class HapticFeedback baru Anda
              _handleRetest(context); // Panggil _handleRetest (navigasi ke /main)
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

          // Tombol 2: Kembali ke Home (OutlinedButton - Pilihan Sekunder)
          OutlinedButton(
            onPressed: () {
              HapticFeedback.light(); // Panggil class HapticFeedback baru Anda
              _handleGoHome(context); // Panggil _handleGoHome (navigasi ke /)
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

          // Tombol 3: Bagikan Hasil (TextButton - Pilihan Tersier)
          TextButton(
            onPressed: () {
              _shareResult(context, result); // Panggil fungsi share baru Anda
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share_rounded, size: 20, color: groupColor.withOpacity(0.8)),
                SizedBox(width: 8),
                Text(
                  'Bagikan Hasil',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: groupColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper _buildDimensionProgress (diperbarui untuk groupColor)
  Widget _buildDimensionProgress({
    required String label,
    required double value,
    required double oppositeValue,
    required String oppositeLabel,
    required bool isDarkMode,
    required Color color, // Menggunakan parameter 'color'
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                  color: color, // Menggunakan 'color'
                ),
              ),
              Text(
                oppositeLabel,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color, // Menggunakan 'color'
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
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
                  color: color, // Menggunakan 'color'
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
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
}
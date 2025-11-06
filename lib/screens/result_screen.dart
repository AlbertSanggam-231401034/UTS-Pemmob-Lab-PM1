import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mbti_quiz/providers/quiz_provider.dart';
import 'package:mbti_quiz/data/mbti_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final result = quizProvider.calculateResult();
    final mbtiType = MBTIData.types[result.mbtiType]!;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Dapatkan warna grup MBTI
    final groupColor = MBTIData.getGroupColor(mbtiType.group);
    final groupIcon = MBTIData.getGroupIcon(mbtiType.group);

    // Debug information
    final imagePath = quizProvider.getGenderSpecificImage(result.mbtiType, noBackground: true);
    print('=== DEBUG RESULT SCREEN ===');
    print('Current User Gender: ${quizProvider.currentUser?.gender}');
    print('MBTI Type: ${result.mbtiType}');
    print('MBTI Group: ${mbtiType.group}');
    print('Group Color: $groupColor');
    print('Image Path: $imagePath');

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
                  // Congratulations
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

                  // MBTI Type Card
                  Card(
                    elevation: 4,
                    color: isDarkMode ? Colors.grey.shade800 : Colors.white,
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

                  // Personality Dimensions
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

                  // Key Traits
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

                  // Famous Examples Section
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

                  // Career Suggestions Section
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

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            quizProvider.resetQuiz();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                                  (route) => false,
                            );
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
                            'Tes Ulang',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Share or save results
                            _showShareDialog(context, groupColor);
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
                            'Bagikan Hasil',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbti_quiz/data/mbti_data.dart';

class AboutMBTIScreen extends StatelessWidget {
  const AboutMBTIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang MBTI',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(isDarkMode),
            const SizedBox(height: 32),

            // What is MBTI
            _buildInfoCard(
              icon: Icons.psychology_rounded,
              title: 'Apa itu MBTI?',
              content: 'Myers-Briggs Type Indicator (MBTI) adalah alat assessment kepribadian yang dikembangkan oleh Katherine Cook Briggs dan putrinya Isabel Briggs Myers. MBTI mengkategorikan kepribadian manusia menjadi 16 tipe berdasarkan 4 dimensi utama.',
              isDarkMode: isDarkMode,
            ),

            const SizedBox(height: 24),

            // Four Dimensions
            Text(
              '4 Dimensi Kepribadian MBTI',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            _buildDimensionCard(
              dimension: 'E / I',
              title: 'Extraversion vs Introversion',
              description: 'Sumber Energi',
              trait1: 'Dari dunia luar dan interaksi sosial',
              trait2: 'Dari dunia dalam dan refleksi pribadi',
              isDarkMode: isDarkMode,
            ),

            _buildDimensionCard(
              dimension: 'S / N',
              title: 'Sensing vs Intuition',
              description: 'Cara Memproses Informasi',
              trait1: 'Fokus pada fakta, detail, dan realitas praktis',
              trait2: 'Fokus pada pola, kemungkinan, dan gambaran besar',
              isDarkMode: isDarkMode,
            ),

            _buildDimensionCard(
              dimension: 'T / F',
              title: 'Thinking vs Feeling',
              description: 'Cara Mengambil Keputusan',
              trait1: 'Berdasarkan logika, objektivitas, dan keadilan',
              trait2: 'Berdasarkan nilai, empati, dan dampak personal',
              isDarkMode: isDarkMode,
            ),

            _buildDimensionCard(
              dimension: 'J / P',
              title: 'Judging vs Perceiving',
              description: 'Gaya Hidup',
              trait1: 'Lebih suka struktur, perencanaan, dan kepastian',
              trait2: 'Lebih suka fleksibilitas, spontanitas, dan keterbukaan',
              isDarkMode: isDarkMode,
            ),

            const SizedBox(height: 32),

            // Personality Groups
            Text(
              '4 Kelompok Kepribadian',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            _buildGroupCard(
              group: 'Analis',
              color: Colors.blue.shade700,
              description: 'Visioner yang strategis dan inovatif',
              types: ['INTJ', 'INTP', 'ENTJ', 'ENTP'],
              icon: Icons.analytics_rounded,
              isDarkMode: isDarkMode,
            ),

            _buildGroupCard(
              group: 'Diplomat',
              color: Colors.green.shade600,
              description: 'Empatik dan idealis yang mengutamakan harmoni',
              types: ['INFJ', 'INFP', 'ENFJ', 'ENFP'],
              icon: Icons.people_rounded,
              isDarkMode: isDarkMode,
            ),

            _buildGroupCard(
              group: 'Pengawal',
              color: Colors.amber.shade700,
              description: 'Praktis dan dapat diandalkan yang menjaga tradisi',
              types: ['ISTJ', 'ISFJ', 'ESTJ', 'ESFJ'],
              icon: Icons.security_rounded,
              isDarkMode: isDarkMode,
            ),

            _buildGroupCard(
              group: 'Penjelajah',
              color: Colors.purple.shade600,
              description: 'Spontan dan enerjik yang menikmati momen',
              types: ['ISTP', 'ISFP', 'ESTP', 'ESFP'],
              icon: Icons.explore_rounded,
              isDarkMode: isDarkMode,
            ),

            const SizedBox(height: 24),

            // How to Interpret Results
            _buildInfoCard(
              icon: Icons.lightbulb_rounded,
              title: 'Cara Menafsirkan Hasil',
              content: 'Hasil MBTI bukanlah label yang kaku, melainkan alat untuk memahami preferensi alami Anda. Setiap tipe memiliki kekuatan dan tantangan unik. Gunakan hasil ini untuk pengembangan diri, memahami orang lain, dan menemukan lingkungan yang sesuai.',
              isDarkMode: isDarkMode,
            ),

            const SizedBox(height: 24),

            // Disclaimer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.amber.shade900 : Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_rounded, color: Colors.amber.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'Penting untuk Dipahami',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'MBTI adalah alat untuk eksplorasi diri dan pengembangan pribadi, bukan tes psikologis yang divalidasi secara klinis. '
                        'Hasil ini merupakan aproksimasi untuk tujuan refleksi dan hiburan. Kepribadian manusia kompleks dan tidak dapat '
                        'sepenuhnya direduksi menjadi 16 tipe.',
                    style: GoogleFonts.inter(
                      color: Colors.amber.shade800,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/main');
        },
        icon: Icon(Icons.play_arrow_rounded),
        label: Text('Mulai Tes'),
        backgroundColor: isDarkMode ? Colors.red.shade700 : Colors.blue.shade700,
      ),
    );
  }

  Widget _buildHeaderSection(bool isDarkMode) {
    return Column(
      children: [
        Image.asset(
          'assets/images/MBTI_logo(c).png',
          width: 350,
          height: 200,
        ),
        const SizedBox(height: 16),
        Text(
          'Myers-Briggs Type Indicator',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Temukan dan Pahami Kepribadian Anda',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 2,
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDimensionCard({
    required String dimension,
    required String title,
    required String description,
    required String trait1,
    required String trait2,
    required bool isDarkMode,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.red.shade700 : Colors.blue.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                dimension,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.inter(
                color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 12),
            _buildTraitRow(Icons.arrow_forward_rounded, trait1, isDarkMode),
            _buildTraitRow(Icons.arrow_back_rounded, trait2, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildTraitRow(IconData icon, String text, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: isDarkMode ? Colors.grey.shade300 : Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupCard({
    required String group,
    required Color color,
    required String description,
    required List<String> types,
    required IconData icon,
    required bool isDarkMode,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: types.map((type) {
                return Chip(
                  label: Text(
                    type,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: color,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
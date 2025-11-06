import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkMode
                ? [
              Colors.grey.shade900,
              Colors.black,
            ]
                : [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo MBTI dengan animasi sederhana
                Hero(
                  tag: 'mbti-logo',
                  child: Image.asset(
                    'assets/images/MBTI_logo(c).png',
                    width: 500,
                    height: 350,
                  ),
                ),

                const SizedBox(height: 32),

                // Title dengan gradient text
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: isDarkMode
                        ? [Colors.red.shade400, Colors.red.shade600]
                        : [Colors.blue.shade800, Colors.blue.shade600],
                  ).createShader(bounds),
                  child: Text(
                    'MBTI Personality\nTest',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Discover your true personality type\nand understand yourself better',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // Play Button
                _buildGradientButton(
                  context: context,
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                  text: 'Start Test',
                  icon: Icons.play_arrow_rounded,
                ),

                const SizedBox(height: 16),

                // What is MBTI Button
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
                    side: BorderSide(
                      color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.help_outline_rounded, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'What is MBTI?',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Theme Toggle
                _buildThemeToggle(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDarkMode
              ? [Colors.red.shade600, Colors.red.shade800]
              : [Colors.blue.shade600, Colors.blue.shade800],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.red.withOpacity(0.3)
                : Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final themeProvider = Theme.of(context);
    final isDarkMode = themeProvider.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
          color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          isDarkMode ? 'Dark Mode' : 'Light Mode',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
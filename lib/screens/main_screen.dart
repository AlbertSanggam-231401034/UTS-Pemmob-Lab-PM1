import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mbti_quiz/providers/quiz_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Information',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "Let's Get Started!",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please provide some basic information to personalize your experience',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 40),

            // Name Input
            Text(
              'Your Name',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                hintStyle: GoogleFonts.inter(
                  color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade300,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.person_rounded,
                  color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey.shade800 : Colors.blue.shade50,
              ),
              style: GoogleFonts.inter(
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),

            const SizedBox(height: 32),

            // Gender Selection
            Text(
              'Gender',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildGenderOption(
                    gender: 'male',
                    label: 'Male',
                    isSelected: _selectedGender == 'male',
                    onTap: () => setState(() => _selectedGender = 'male'),
                    isDarkMode: isDarkMode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGenderOption(
                    gender: 'female',
                    label: 'Female',
                    isSelected: _selectedGender == 'female',
                    onTap: () => setState(() => _selectedGender = 'female'),
                    isDarkMode: isDarkMode,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 48),

            // Start Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.red.shade700 : Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.quiz_rounded),
                    const SizedBox(width: 8),
                    Text(
                      'Start Personality Test',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption({
    required String gender,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDarkMode ? Colors.red.shade900 : Colors.blue.shade50)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade50),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? (isDarkMode ? Colors.red.shade400 : Colors.blue.shade600)
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: isDarkMode
                    ? Colors.red.withOpacity(0.3)
                    : Colors.blue.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              gender == 'male' ? Icons.male_rounded : Icons.female_rounded,
              size: 48,
              color: isSelected
                  ? (isDarkMode ? Colors.red.shade400 : Colors.blue.shade600)
                  : (isDarkMode ? Colors.grey.shade500 : Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? (isDarkMode ? Colors.red.shade400 : Colors.blue.shade600)
                    : (isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startQuiz() {
    if (_nameController.text.isEmpty) {
      _showErrorDialog('Please enter your name');
      return;
    }

    if (_selectedGender == null) {
      _showErrorDialog('Please select your gender');
      return;
    }

    // Save user data and start quiz
    Provider.of<QuizProvider>(context, listen: false).setUserData(
      _nameController.text.trim(),
      _selectedGender!,
    );

    Navigator.pushNamed(context, '/quiz');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Missing Information',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
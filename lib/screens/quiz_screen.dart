import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mbti_quiz/providers/quiz_provider.dart';
import 'package:mbti_quiz/models/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final questions = quizProvider.currentQuiz;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loading questions...'),
            ],
          ),
        ),
      );
    }

    final currentQuestion = questions[_currentQuestionIndex];
    final totalQuestions = questions.length;
    final progress = (_currentQuestionIndex + 1) / totalQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personality Test',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                '${_currentQuestionIndex + 1}/$totalQuestions',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: progress,
              backgroundColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
              color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade600,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: 24),

            // Question Card
            Expanded(
              child: Card(
                elevation: 4,
                color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Number
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.red.shade900 : Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Question ${_currentQuestionIndex + 1}',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.red.shade400 : Colors.blue.shade700,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Question Text
                      Expanded(
                        child: Text(
                          currentQuestion.questionText,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.white : Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),

                      // Options
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: currentQuestion.options.length,
                          itemBuilder: (context, index) {
                            final option = currentQuestion.options[index];
                            final isSelected = quizProvider.userAnswers[currentQuestion.id] == option;

                            return _buildOptionButton(
                              option: option,
                              isSelected: isSelected,
                              onTap: () {
                                quizProvider.answerQuestion(currentQuestion.id, option);
                                setState(() {});
                              },
                              isDarkMode: isDarkMode,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Navigation Buttons
            Row(
              children: [
                // Previous Button
                Expanded(
                  child: OutlinedButton(
                    onPressed: _currentQuestionIndex > 0
                        ? () {
                      setState(() {
                        _currentQuestionIndex--;
                      });
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.red.shade400 : Colors.blue.shade800,
                      side: BorderSide(
                        color: _currentQuestionIndex > 0
                            ? (isDarkMode ? Colors.red.shade400 : Colors.blue.shade800)
                            : Colors.grey,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_rounded, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Previous',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),

                // Next/Submit Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentQuestionIndex < totalQuestions - 1) {
                        setState(() {
                          _currentQuestionIndex++;
                        });
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // Calculate result and navigate to result screen
                        final result = quizProvider.calculateResult();
                        Navigator.pushNamed(
                          context,
                          '/result',
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.red.shade700 : Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentQuestionIndex < totalQuestions - 1 ? 'Next' : 'Submit',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          _currentQuestionIndex < totalQuestions - 1
                              ? Icons.arrow_forward_rounded
                              : Icons.check_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required MBTIOption option,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDarkMode ? Colors.red.shade900 : Colors.blue.shade50)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
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
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? (isDarkMode ? Colors.red.shade400 : Colors.blue.shade600)
                      : (isDarkMode ? Colors.grey.shade600 : Colors.grey.shade400),
                  width: 2,
                ),
                color: isSelected
                    ? (isDarkMode ? Colors.red.shade400 : Colors.blue.shade600)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                Icons.check_rounded,
                size: 16,
                color: Colors.white,
              )
                  : null,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                option.text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
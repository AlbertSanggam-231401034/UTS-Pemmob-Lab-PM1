import 'package:flutter/material.dart';
import 'package:mbti_quiz/models/user_model.dart';
import 'package:mbti_quiz/models/question_model.dart';
import 'package:mbti_quiz/models/mbti_result_model.dart';
import 'package:mbti_quiz/data/mbti_data.dart';
import 'package:mbti_quiz/data/question_bank.dart';
import 'package:mbti_quiz/utils/storage_manager.dart';

class QuizProvider with ChangeNotifier {
  User? _currentUser;
  List<MBTIQuestion> _currentQuiz = [];
  Map<String, MBTIOption> _userAnswers = {};
  bool _quizCompleted = false;

  // Menyimpan hasil kalkulasi terakhir.
  MBTIResult? _lastResult;

  User? get currentUser => _currentUser;
  List<MBTIQuestion> get currentQuiz => _currentQuiz;
  Map<String, MBTIOption> get userAnswers => _userAnswers;
  bool get quizCompleted => _quizCompleted;

  void setUserData(String name, String gender) {
    _currentUser = User(
      name: name,
      gender: gender,
      createdAt: DateTime.now(),
    );
    _generateUniqueQuiz();
    notifyListeners();
  }

  void _generateUniqueQuiz() {
    _currentQuiz = _getRandomQuestions();
    _userAnswers = {};
    _quizCompleted = false;
    _lastResult = null; // Hapus hasil lama saat kuis baru dibuat
  }

  List<MBTIQuestion> _getRandomQuestions() {
    List<MBTIQuestion> quiz = [];
    quiz.addAll(_getRandomQuestionsForDichotomy('EI', 5));
    quiz.addAll(_getRandomQuestionsForDichotomy('SN', 5));
    quiz.addAll(_getRandomQuestionsForDichotomy('TF', 5));
    quiz.addAll(_getRandomQuestionsForDichotomy('JP', 5));
    quiz.shuffle();
    return quiz;
  }

  List<MBTIQuestion> _getRandomQuestionsForDichotomy(String dichotomy, int count) {
    var availableQuestions = QuestionBank.allQuestions.where((q) => q.dichotomy == dichotomy).toList();
    availableQuestions.shuffle();
    return availableQuestions.take(count).toList();
  }

  void answerQuestion(String questionId, MBTIOption selectedOption) {
    _userAnswers[questionId] = selectedOption;
    notifyListeners();
  }

  // === FUNGSI INI UNTUK DIPANGGIL DARI QUIZ_SCREEN ===
  void calculateAndSaveResult() {
    // Jika sudah dihitung dan disimpan, jangan lakukan apa-apa
    if (_quizCompleted && _lastResult != null) {
      return;
    }

    Map<String, int> scores = _calculateScores();
    String mbtiType = _calculateMBTIType(scores);
    Map<String, double> percentages = _calculatePercentages(scores);

    _quizCompleted = true;

    // Buat objek hasil dan simpan di state provider
    _lastResult = MBTIResult(
      user: _currentUser!,
      mbtiType: mbtiType,
      scores: scores,
      percentages: percentages,
      date: DateTime.now(),
    );

    // Simpan ke storage HANYA SEKALI
    _saveResultToStorage(_lastResult!);
  }

  // === FUNGSI INI UNTUK DIPANGGIL DARI RESULT_SCREEN ===
  MBTIResult getCachedResult() {
    // Jika _lastResult masih null (karena error), buat hasil dummy
    if (_lastResult == null) {
      print("❌ ERROR: getCachedResult dipanggil tapi _lastResult null.");
      // Hitung ulang tapi JANGAN SIMPAN
      Map<String, int> scores = _calculateScores();
      String mbtiType = _calculateMBTIType(scores);
      Map<String, double> percentages = _calculatePercentages(scores);
      _lastResult = MBTIResult(
        user: _currentUser ?? User(name: "Error", gender: "M", createdAt: DateTime.now()),
        mbtiType: mbtiType,
        scores: scores,
        percentages: percentages,
        date: DateTime.now(),
      );
    }
    return _lastResult!;
  }

  // Fungsi helper internal untuk menghitung skor
  Map<String, int> _calculateScores() {
    Map<String, int> scores = {
      'E': 0, 'I': 0, 'S': 0, 'N': 0,
      'T': 0, 'F': 0, 'J': 0, 'P': 0
    };
    _userAnswers.forEach((questionId, option) {
      option.scores.forEach((dimension, score) {
        scores[dimension] = scores[dimension]! + score;
      });
    });
    return scores;
  }

  // Fungsi _saveResultToStorage sekarang menerima MBTIResult
  void _saveResultToStorage(MBTIResult result) {
    final resultData = {
      'userName': result.user.name,
      'userGender': result.user.gender,
      'mbtiType': result.mbtiType,
      'scores': result.scores,
      'percentages': result.percentages,
      'date': result.date.toIso8601String(),
      'timestamp': result.date.millisecondsSinceEpoch,
    };

    StorageManager.saveResult(resultData);
  }

  String _calculateMBTIType(Map<String, int> scores) {
    String type = '';
    type += scores['E']! > scores['I']! ? 'E' : 'I';
    type += scores['S']! > scores['N']! ? 'S' : 'N';
    type += scores['T']! > scores['F']! ? 'T' : 'F';
    type += scores['J']! > scores['P']! ? 'J' : 'P';
    return type;
  }

  Map<String, double> _calculatePercentages(Map<String, int> scores) {
    Map<String, double> percentages = {};
    // Tambahkan cek pembagian dengan nol
    percentages['E'] = (scores['E']! + scores['I']! == 0) ? 50 : (scores['E']! / (scores['E']! + scores['I']!)) * 100;
    percentages['I'] = 100 - percentages['E']!;
    percentages['S'] = (scores['S']! + scores['N']! == 0) ? 50 : (scores['S']! / (scores['S']! + scores['N']!)) * 100;
    percentages['N'] = 100 - percentages['S']!;
    percentages['T'] = (scores['T']! + scores['F']! == 0) ? 50 : (scores['T']! / (scores['T']! + scores['F']!)) * 100;
    percentages['F'] = 100 - percentages['T']!;
    percentages['J'] = (scores['J']! + scores['P']! == 0) ? 50 : (scores['J']! / (scores['J']! + scores['P']!)) * 100;
    percentages['P'] = 100 - percentages['J']!;
    return percentages;
  }

  String getGenderSpecificImage(String mbtiType, {bool noBackground = false}) {
    if (_currentUser == null) {
      print('❌ Current user is null');
      return 'assets/images/default.png';
    }

    final typeData = MBTIData.types[mbtiType];
    if (typeData == null) {
      print('❌ MBTI type not found: $mbtiType');
      return 'assets/images/default.png';
    }

    final imagePath = typeData.getImagePath(_currentUser!.gender, noBackground: noBackground);
    print('🖼️ Generated image path: $imagePath');

    return imagePath;
  }

  void resetQuiz() {
    _currentUser = null;
    _currentQuiz = [];
    _userAnswers = {};
    _quizCompleted = false;
    _lastResult = null; // Reset hasil terakhir
    notifyListeners();
  }
}
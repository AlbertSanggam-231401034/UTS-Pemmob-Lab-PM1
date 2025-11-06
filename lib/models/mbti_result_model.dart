import 'user_model.dart';

class MBTIResult {
  final User user;
  final String mbtiType;
  final Map<String, int> scores;
  final Map<String, double> percentages;
  final DateTime date;

  MBTIResult({
    required this.user,
    required this.mbtiType,
    required this.scores,
    required this.percentages,
    required this.date,
  });
}
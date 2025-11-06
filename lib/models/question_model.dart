class MBTIQuestion {
  final String id;
  final String questionText;
  final List<MBTIOption> options;
  final String dichotomy; // 'EI', 'SN', 'TF', 'JP'
  final String dimension;

  MBTIQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.dichotomy,
    required this.dimension,
  });
}

class MBTIOption {
  final String text;
  final Map<String, int> scores;

  MBTIOption({
    required this.text,
    required this.scores,
  });
}
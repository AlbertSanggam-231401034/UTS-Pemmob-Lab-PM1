class User {
  final String name;
  final String gender; // 'male' or 'female'
  final DateTime createdAt;

  User({
    required this.name,
    required this.gender,
    required this.createdAt,
  });
}
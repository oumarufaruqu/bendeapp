class Flashcard {
  final String id;
  final String topicId;
  final String frontContent;
  final String backContent;
  final DateTime createdAt;

  const Flashcard({
    required this.id,
    required this.topicId,
    required this.frontContent,
    required this.backContent,
    required this.createdAt,
  });
}

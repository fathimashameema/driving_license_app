class ExamQuestionModel {
  final int id;
  final String question;
  final List<String> options;
  final int correctAnswer;

  ExamQuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
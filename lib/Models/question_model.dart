class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class ExamQuestionModel {
  final int id;
  final String question;
  final List<String> options;

  ExamQuestionModel({
    required this.id,
    required this.question,
    required this.options,
  });
}

class SubjectModel {
  final int id;
  final String title;
  final int categoryId;

  SubjectModel({
    required this.id,
    required this.title,
    required this.categoryId,
  });
}

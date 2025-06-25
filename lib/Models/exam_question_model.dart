class ExamQuestionModel {
  final int id;
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String? previewVideo;
  final String? correctVideo;
  final String? wrongVideo;

  ExamQuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.previewVideo,
    this.correctVideo,
    this.wrongVideo,
  });

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) {
    return ExamQuestionModel(
      id: json['id'],
      question: json['question'],
      options: (json['answers'] as List)
          .map((e) => e.toString().replaceFirst(RegExp(r'^\d+\n'), ''))
          .toList(),
      correctAnswer: json['correctAnswer'],
      previewVideo: json['previewVideo'],
      correctVideo: json['correctVideo'],
      wrongVideo: json['wrongVideo'],
    );
  }
}

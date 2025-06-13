// import 'package:avtoskola_varketilshi/Models/question_model.dart';
// import 'package:get/get.dart';

// class QuestionController extends GetxController {
//   final currentIndex = 0.obs;
//   final questions = <QuestionModel>[].obs;
//   final correctAnswers = 0.obs;
//   final totalQuestions = 0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadQuestions();
//   }

//   void loadQuestions() {
//     final sample = [
//       QuestionModel(
//         question: 'How should environment impact mitigation be achieved ?',
//         options: [
//           'Despite the congested traffic, driving your own vehicle',
//           'Despite the congested traffic, driving your own vehicle Despite the congested traffic, driving your own vehicle',
//         ],
//       ),
//     ];
//     questions.assignAll(sample);
//     totalQuestions.value = sample.length;
//   }

//   void nextQuestion() {
//     if (currentIndex.value < questions.length - 1) {
//       currentIndex.value++;
//     }
//   }

//   void selectOption(int index) {
//     // Future: add logic for correctness
//   }
// }


import 'dart:async';
import 'package:get/get.dart';
import '../../Models/question_model.dart';

class QuestionController extends GetxController {
  final questions = <QuestionModel>[].obs;
  final currentIndex = 0.obs;
  final selectedOption = RxnInt();
  final correctAnswers = 0.obs;
  Timer? _nextTimer;

  void loadQuestions(List<QuestionModel> newQuestions) {
    questions.assignAll(newQuestions);
    currentIndex.value = 0;
    correctAnswers.value = 0;
    selectedOption.value = null;
  }

  void selectOption(int index) {
    if (selectedOption.value != null) return; // Already answered

    selectedOption.value = index;

    if (index == questions[currentIndex.value].correctAnswer) {
      correctAnswers.value++;
    }

    _nextTimer = Timer(const Duration(seconds: 5), nextQuestion);
  }

  void nextQuestion() {
    _nextTimer?.cancel();
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedOption.value = null;
    }
  }

  void onTapAdvance() {
    if (selectedOption.value != null) {
      nextQuestion();
    }
  }

  bool isCorrect(int index) =>
      selectedOption.value != null &&
      index == questions[currentIndex.value].correctAnswer;

  bool isWrong(int index) =>
      selectedOption.value != null &&
      index == selectedOption.value &&
      selectedOption.value != questions[currentIndex.value].correctAnswer;
}

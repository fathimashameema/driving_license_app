import 'dart:async';
import 'package:avtoskola_varketilshi/Models/exam_question_model.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {
  final questions = <ExamQuestionModel>[].obs;
  final currentIndex = 0.obs;
  final selectedAnswers = <int, int>{}.obs;

  /// ✅ Correct use of .obs
  final RxInt remainingTime = (30 * 60).obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
    startTimer();
  }

  void loadQuestions() {
    questions.assignAll(List.generate(3, (i) {
      return ExamQuestionModel(
        id: 800 + i,
        question: 'A drover is prohibited from:',
        options: [
          'Despite the congested traffic, driving your own vehicle',
          'Despite the congested traffic, driving your own vehicle',
          'Despite the congested traffic, driving your own vehicle',
        ],
      );
    }));
  }

  void selectOption(int optionIndex) {
    selectedAnswers[currentIndex.value] = optionIndex;
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < questions.length) {
      currentIndex.value = index;
    }
  }

  void nextQuestion() => goToQuestion(currentIndex.value + 1);
  void prevQuestion() => goToQuestion(currentIndex.value - 1);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
        // Optional: finish exam logic
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String get formattedTime {
    final minutes = remainingTime.value ~/ 60;
    final seconds = remainingTime.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

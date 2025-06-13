import 'package:avtoskola_varketilshi/Models/review_question_model.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  final questions = <ReviewQuestionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
  }

  void loadQuestions() {
    questions.assignAll(List.generate(7, (i) {
      return ReviewQuestionModel(
        id: 1001 + i,
        question: 'How should environment impact mitigation be achieved ?',
        options: [
          'Despite the congested traffic, driving your own vehicle',
          'Despite the congested traffic, driving your own vehicle',
          'About driver, passengers and the infantry, the signs, the Convention',
        ],
        correctIndex: 2,
        selectedIndex: null,
        imageUrl: 'assets/images/sample_bg.jpg',
      );
    }));
  }

  void toggleExpand(int index) {
    questions[index].isExpanded = !questions[index].isExpanded;
    questions.refresh();
  }
}

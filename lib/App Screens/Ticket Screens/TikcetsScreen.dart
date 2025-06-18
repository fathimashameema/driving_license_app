import 'package:avtoskola_varketilshi/App%20Screens/Exams%20Screens/unanswered_review_screen.dart';
import 'package:avtoskola_varketilshi/App%20Widegts/exam_option_tile.dart';
import 'package:avtoskola_varketilshi/App%20Widegts/showTestPassedDialog.dart';
import 'package:avtoskola_varketilshi/Controllers/Exams%20Controllers/exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TikcetsScreen extends StatelessWidget {
  const TikcetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() {
          final question = controller.questions[controller.currentIndex.value];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top stats row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(UnansweredReviewScreen());
                      },
                      child: _infoBox(controller.formattedTime, color: Colors.red)),
                    const SizedBox(width: 6),
                    _infoBox('1(${controller.selectedAnswers.length})'),
                    const SizedBox(width: 6),
                    _infoBox('0'), // Placeholder for score
                    const SizedBox(width: 6),
                    _infoBox('#${question.question}'),
                    const Spacer(),
                    Image.asset('assets/images/slogo.png', height: 36),
                  ],
                ),
              ),

              /// Question
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Text(
                    question.question,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              /// Options
              ...List.generate(question.options.length, (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ExamOptionTile(
                    index: i,
                    text: question.options[i],
                    selected: controller.selectedAnswers[controller.currentIndex.value] == i,
                    onTap: () => controller.selectOption(i),
                  ),
                );
              }),

              const Spacer(),

              /// Bottom Navigation
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: controller.prevQuestion,
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
                    ),
                    ...List.generate(controller.questions.length, (i) {
                      final isSelected = i == controller.currentIndex.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () => controller.goToQuestion(i),
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              color: isSelected ? Colors.red : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${i + 1}',
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    IconButton(
                      onPressed:(){ controller.nextQuestion;
                                    showTestPassedDialog(context);
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _infoBox(String text, {Color color = Colors.red}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}

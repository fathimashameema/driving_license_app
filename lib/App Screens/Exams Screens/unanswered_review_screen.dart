import 'package:avtoskola_varketilshi/App%20Screens/Home%20Screens/HomeScreen.dart';
import 'package:avtoskola_varketilshi/App%20Widegts/review_question_tile.dart';
import 'package:avtoskola_varketilshi/Controllers/Exams%20Controllers/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnansweredReviewScreen extends StatelessWidget {
  const UnansweredReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 GestureDetector(
                          onTap: () {
                            Get.to(HomeScreen());
                          },
                    child: Image.asset('assets/images/menu.png', height: 24)),
                  Image.asset('assets/images/slogo.png', height: 36),
                  Image.asset('assets/images/drawer.png', height: 24),
                ],
              ),
            ),

            const Text(
              'You did not answer all questions',
              style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Try again, we believe in you!',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 10),

            /// List
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) {
                    final question = controller.questions[index];
                    return ReviewQuestionTile(
                      question: question,
                      onToggle: () => controller.toggleExpand(index),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

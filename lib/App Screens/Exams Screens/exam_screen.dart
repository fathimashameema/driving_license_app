// import 'package:avtoskola_varketilshi/App%20Screens/Exams%20Screens/unanswered_review_screen.dart';
// import 'package:avtoskola_varketilshi/App%20Widegts/exam_option_tile.dart';
// import 'package:avtoskola_varketilshi/App%20Widegts/showTestPassedDialog.dart';
// import 'package:avtoskola_varketilshi/Controllers/Exams%20Controllers/exam_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ExamScreen extends StatelessWidget {
//   const ExamScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ExamController());

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Obx(() {
//           final question = controller.questions[controller.currentIndex.value];

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
// /// Top stats row
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//        // Prev arrow
//       GestureDetector(
//         onTap: () {
//         Get.back();
//         },
//         child: Icon(Icons.arrow_back_ios_new, color: Colors.red,)),
//         SizedBox(width: 6,),

//       GestureDetector(
//         onTap: () {
//           Get.to(UnansweredReviewScreen());
//         },
//         child: _infoBox(controller.formattedTime, color: Colors.red)),
//       const SizedBox(width: 6),
//       _infoBox('#${controller.selectedAnswers.length}'),
//       const SizedBox(width: 6),
//       _infoBox('#${controller.correctAnswersCount}'),
//       const SizedBox(width: 6),
//       _infoBox('#${question.id}'),
//       const Spacer(),
//       Image.asset('assets/images/slogo.png', height: 36),
//     ],
//   ),
// ),

// /// Question
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//   child: Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(14),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.white),
//     ),
//     child: Text(
//       question.question,
//       style: const TextStyle(color: Colors.white),
//     ),
//   ),
// ),

//               /// Options
//               ...List.generate(question.options.length, (i) {

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                   child: ExamOptionTile(
//                     index: i,
//                     text: question.options[i],
//                     selected: controller.selectedAnswers[controller.currentIndex.value] == i,
//                     onTap: () => controller.selectOption(i),
//                   ),
//                 );
//               }),

//   const Spacer(),
//   // Bottom navigation bar
//   Container(
//     color: Colors.white,
//     padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//     child: Row(
//       children: [
//         // Prev arrow
//         IconButton(
//           onPressed: () {
//             controller.prevQuestion();
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
//         ),

//         // Question number buttons (mid expandable)
//         Expanded(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(controller.questions.length, (i) {
//                 final isSel = i == controller.currentIndex.value;
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: GestureDetector(
//                     onTap: () => controller.goToQuestion(i),
//                     child: Container(
//                       width: 36,
//                       height: 36,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.red),
//                         color: isSel ? Colors.red : Colors.white,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         '${i + 1}',
//                         style: TextStyle(
//                           color: isSel ? Colors.white : Colors.red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),

//         // Next arrow
//         IconButton(
//           onPressed: () {
//             controller.nextQuestion();
//             if (controller.currentIndex.value == controller.questions.length - 1) {
//               showTestPassedDialog(context);
//             }
//           },
//           icon: const Icon(Icons.arrow_forward_ios, color: Colors.red),
//         ),
//       ],
//     ),
//   ),
// ],
//           );
//         }),
//       ),
//     );
//    }

//   Widget _infoBox(String text, {Color color = Colors.red}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: color),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
//       ),
//     );
//   }
// }

import 'package:avtoskola_varketilshi/App Screens/Exams Screens/unanswered_review_screen.dart';
import 'package:avtoskola_varketilshi/App Widegts/exam_option_tile.dart';
import 'package:avtoskola_varketilshi/App Widegts/showTestPassedDialog.dart';
import 'package:avtoskola_varketilshi/App%20Widegts/VideoPlayerBox.dart';
import 'package:avtoskola_varketilshi/Controllers/Exams Controllers/exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() {
          if (controller.questions.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
          final q = controller.questions[controller.currentIndex.value];
          final question = controller.questions[controller.currentIndex.value];
          return Column(
            children: [
              /// Top stats row
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Prev arrow
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: 6,
                    ),

                    GestureDetector(
                        onTap: () {
                          Get.to(UnansweredReviewScreen());
                        },
                        child: _infoBox(controller.formattedTime,
                            color: Colors.red)),
                    const SizedBox(width: 6),
                    _infoBox('#${controller.selectedAnswers.length}'),
                    const SizedBox(width: 6),
                    _infoBox('#${controller.correctAnswersCount}'),
                    const SizedBox(width: 6),
                    _infoBox('#${question.id}'),
                    const Spacer(),
                    Image.asset('assets/images/slogo.png', height: 36),
                  ],
                ),
              ),

              /// Question
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // options
                      for (int i = 0; i < q.options.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: ExamOptionTile(
                            index: i,
                            text: q.options[i],
                            selected: controller.selectedAnswers[
                                    controller.currentIndex.value] ==
                                i,
                            isCorrect: controller
                                    .hasAnsweredCurrentQuestion.value &&
                                i ==
                                    q.correctAnswer, // Highlight correct answer
                            onTap: () {
                              if (!controller
                                      .hasAnsweredCurrentQuestion.value &&
                                  !controller.videoPlaying.value) {
                                controller.selectOption(i);
                              }
                            },
                          ),
                        ),

                      // video container
                      Container(
                        height: 180,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Colors.black,
                        child: Obx(() {
                          return controller.currentVideo.value.isEmpty
                              ? const Center(
                                  child: Text('Preview',
                                      style: TextStyle(color: Colors.grey)),
                                )
                              : VideoPlayerBox(
                                  key: ValueKey(controller.currentVideo.value),
                                  videoPath: controller.currentVideo.value,
                                  onFinished: controller.onVideoEnd,
                                );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom navigation bar
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    // Prev arrow
                    IconButton(
                      onPressed: () {
                        controller.prevQuestion();
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
                    ),

                    // Question number buttons (mid expandable)
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(controller.questions.length, (i) {
                            final isSel = i == controller.currentIndex.value;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: GestureDetector(
                                onTap: () => controller.goToQuestion(i),
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    color: isSel ? Colors.red : Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${i + 1}',
                                    style: TextStyle(
                                      color: isSel ? Colors.white : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    // Next arrow
                    IconButton(
                      onPressed: () {
                        controller.nextQuestion();
                        if (controller.currentIndex.value ==
                            controller.questions.length - 1) {
                          showTestPassedDialog(context);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
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
      child: Text(text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}

// import 'package:avtoskola_varketilshi/App%20Widegts/option_button.dart';
// import 'package:avtoskola_varketilshi/Controllers/Subject%20Controllers/question_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SubjectDetailScreen extends StatelessWidget {
//   const SubjectDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(QuestionController());

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Obx(() {
//           final question = controller.questions[controller.currentIndex.value];

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Header row
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '#${controller.currentIndex.value + 1}/${controller.totalQuestions}',
//                       style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                     ),
//                     Image.asset('assets/images/slogo.png', height: 38),
//                     Text(
//                       '${controller.correctAnswers}/0',
//                       style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
// SizedBox(height: 20,),
//               /// Question
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   question.question,
//                   style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//               ),

//               /// Options
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: question.options.length,
//                   itemBuilder: (context, index) {
//                     return OptionButton(
//                       text: question.options[index],
//                       onPressed: () => controller.selectOption(index),
//                     );
//                   },
//                 ),
//               ),

              // /// Bottom Navigation
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              //   decoration: const BoxDecoration(
              //     border: Border(top: BorderSide(color: Colors.red)),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //         icon: const Icon(Icons.error, color: Colors.red, ),
              //         onPressed: () {},
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.settings, color: Colors.white),
              //         onPressed: () {},
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //            IconButton(
              //             icon: const Icon(Icons.skip_previous, color: Colors.white),
              //             onPressed: controller.nextQuestion,
              //           ),
              //           IconButton(
              //             icon: const Icon(Icons.skip_next, color: Colors.white),
              //             onPressed: controller.nextQuestion,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
//               )
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }


import 'package:avtoskola_varketilshi/Controllers/Subject%20Controllers/question_controller.dart';
import 'package:avtoskola_varketilshi/Models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubjectDetailScreen extends StatelessWidget {
  const SubjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionController());
    final questions = Get.arguments as List<QuestionModel>;
    controller.loadQuestions(questions);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() {
          final question = controller.questions[controller.currentIndex.value];
          return GestureDetector(
            onTap: controller.onTapAdvance,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#${controller.currentIndex.value + 1}/${controller.questions.length}',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/images/slogo.png', height: 38),
                      Text(
                        '${controller.correctAnswers}/${controller.questions.length}',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                /// Question
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    question.question,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),

                /// Options
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      final isCorrect = controller.isCorrect(index);
                      final isWrong = controller.isWrong(index);

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: isCorrect
                              ? Colors.green
                              : isWrong
                                  ? Colors.red
                                  : Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ListTile(
                          title: Text(
                            question.options[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () => controller.selectOption(index),
                        ),
                      );
                    },
                  ),
                ),

                 /// Bottom Navigation
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.error, color: Colors.red, ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         IconButton(
                          icon: const Icon(Icons.skip_previous, color: Colors.white),
                          onPressed: controller.nextQuestion,
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next, color: Colors.white),
                          onPressed: controller.nextQuestion,
                        ),
                      ],
                    ),
                  ],
                ),
              )
              ],
            ),
          );
        }),
      ),
    );
  }
}

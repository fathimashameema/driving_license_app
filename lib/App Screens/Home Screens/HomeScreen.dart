// // import 'package:avtoskola_varketilshi/App%20Screens/Exams%20Screens/exam_screen.dart';
// // import 'package:avtoskola_varketilshi/App%20Screens/Subjects%20screens/SubjectListScreen.dart';
// // import 'package:avtoskola_varketilshi/App%20Widegts/CommonButton.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/state_manager.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   int currentIndex = 0;

// //   final List<Map<String, String>> carItems = [
// //     {'image': 'assets/images/car.png', 'label': 'B, B1'},
// //     {'image': 'assets/images/truck.png', 'label': ' C '},
// //     {'image': 'assets/images/bus.png', 'label': ' D '},
// //     {'image': 'assets/images/tractor.png', 'label': 'T, S'},
// //   ];

// //   void _nextCar() {
// //     setState(() {
// //       currentIndex = (currentIndex + 1) % carItems.length;
// //     });
// //       }

// //   void _prevCar() {
// //     setState(() {
// //       currentIndex = (currentIndex - 1 + carItems.length) % carItems.length;
// //     });
// //   }

// //   void _openDialer() async {
// //   final Uri phoneUri = Uri(scheme: 'tel', path: '112');
// //   if (await canLaunchUrl(phoneUri)) {
// //     await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
// //   } else {
// //     Get.snackbar('Error', 'Could not open dialer');
// //   }
// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     final currentCar = carItems[currentIndex];

// //     return Scaffold(
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         decoration: const BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage('assets/images/bg.png'), // Background road image
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             const SizedBox(height: 90),
// //             const Text(
// //               'Avtoskola Varketilshi',
// //               style: TextStyle(
// //                 fontSize: 22,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             const Text(
// //               'Take practical training with us, Call us now',
// //               style: TextStyle(fontSize: 13, color: Colors.black54),
// //               textAlign: TextAlign.center,
// //             ),
// //             const SizedBox(height: 30),
// //             ElevatedButton.icon(
// //                 onPressed: _openDialer,
// //               icon: const Icon(Icons.phone, color: Colors.white),
// //               label: const Text('599 99 87 35', style: TextStyle(color: Colors.white)),
// //               style: ElevatedButton.styleFrom(
                
// //                 backgroundColor: Color.fromRGBO(186,20,29,1),
// //                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //               ),
// //             ),
// //             const SizedBox(height: 70),

// //             /// Car Swiper
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 IconButton(onPressed: _prevCar, icon: const Icon(Icons.arrow_back_ios,  color: Color.fromARGB(255, 250, 18, 1))),
// //                 Column(
// //                   children: [
// //                     Image.asset(currentCar['image']!, height: 150),
// //                     const SizedBox(height: 8),
// //                     Text(
// //                       currentCar['label']!,
// //                       style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
// //                     ),
// //                   ],
// //                 ),
// //                 IconButton(onPressed: _nextCar, icon: const Icon(Icons.arrow_forward_ios, color:Color.fromARGB(255, 250, 18, 1))),
// //               ],
// //             ),
// //             const SizedBox(height: 100),

// //             /// Buttons
// //             CommonRedButton(
// //               label: 'By Subject',
// //               onPressed: () {
// //                 Get.to(SubjectListScreen());
// //               },
// //             ),
// //             const SizedBox(height: 16),
// //             CommonRedButton(
// //               label: 'All Tickets',
// //               onPressed: () {
// //                 // Navigate or logic
// //               },
// //             ),
// //             const SizedBox(height: 16),
// //             CommonRedButton(
// //               label: 'Exam',
// //               onPressed: () {
// //                 Get.to(ExamScreen());
// //                 // Navigate or logic
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// // lib/views/home_screen.dart
// import 'package:avtoskola_varketilshi/App Screens/Exams Screens/exam_screen.dart';
// import 'package:avtoskola_varketilshi/App Screens/Subjects screens/SubjectListScreen.dart';
// import 'package:avtoskola_varketilshi/App Widegts/CommonButton.dart';
// import 'package:avtoskola_varketilshi/Controllers/Exams%20Controllers/exam_controller.dart';
// import 'package:avtoskola_varketilshi/Controllers/category_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   final carItems = [
//     {'image': 'assets/images/car.png', 'label': 'B, B1'},
//     {'image': 'assets/images/truck.png', 'label': 'C'},
//     {'image': 'assets/images/bus.png', 'label': 'D'},
//     {'image': 'assets/images/tractor.png', 'label': 'T, S'},
//   ];
//   String? selectedCategory; 
//   @override
//   Widget build(BuildContext context) {
//     final categoryCtrl = Get.put(CategoryController());

//     return Scaffold(
//       body: Obx(() {
//         final idx = categoryCtrl.currentIndex.value;
//         final car = carItems[idx];

//         return Container(
//           // ... same background + layout ...
//           child: Column(
//             // ...
//             children: [
//               // Swipe row:
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(onPressed: () {
//                     final ni = (idx -1 + carItems.length)%carItems.length;
//                     categoryCtrl.setIndex(ni);
//                   }, icon: const Icon(Icons.arrow_back_ios, color: Color(0xffFA1201))),
//                   Column(
//                     children: [
//                       Image.asset(car['image']!, height: 150),
//                       const SizedBox(height: 8),
//                       Text(car['label']!, /* styling */),
//                     ],
//                   ),
//                   IconButton(onPressed: () {
//                     categoryCtrl.setIndex((idx+1)%carItems.length);
//                   }, icon: const Icon(Icons.arrow_forward_ios, color: Color(0xffFA1201))),
//                 ],
//               ),
//               // ...
//               CommonRedButton(
//                 label: 'By Subject',
//                 onPressed: () {
//                   Get.to(() => SubjectListScreen(), arguments: {'category': idx});
//                 },
//               ),
//               // similarly pass arguments to tickets/exam
//               CommonRedButton(
//                 label: 'Exam',
//                  onPressed: () {
//                 if (selectedCategory != null) {
//                   Get.to(() => ExamScreen(), arguments: selectedCategory);
//                 } else {
//                   Get.snackbar('Error', 'Please select a category first');
//                 }
//               },
//             ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Controllers/category_controller.dart';
import '../../Controllers/Exams Controllers/exam_controller.dart';
import '../Exams Screens/exam_screen.dart';
import '../Subjects screens/SubjectListScreen.dart';
import '../../App Widegts/CommonButton.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final carItems = [
    {'image': 'assets/images/car.png', 'label': 'B, B1'},
    {'image': 'assets/images/truck.png', 'label': 'C'},
    {'image': 'assets/images/bus.png', 'label': 'D'},
    {'image': 'assets/images/tractor.png', 'label': 'T, S'},
  ];

  void _openDialer() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '112');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not open dialer');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryCtrl = Get.put(CategoryController());

    return Scaffold(
      body: Obx(() {
        final idx = categoryCtrl.currentIndex.value;
        final car = carItems[idx];

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              const Text('Avtoskola Varketilshi',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
              const Text(
                'Take practical training with us, Call us now',
                style: TextStyle(fontSize: 13, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _openDialer,
                icon: const Icon(Icons.phone, color: Colors.white),
                label: const Text('599 99 87 35', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(186, 20, 29, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 70),

              /// Car Swiper
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      final newIndex = (idx - 1 + carItems.length) % carItems.length;
                      categoryCtrl.setIndex(newIndex);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Color(0xffFA1201)),
                  ),
                  Column(
                    children: [
                      Image.asset(car['image']!, height: 150),
                      const SizedBox(height: 8),
                      Text(
                        car['label']!,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      final newIndex = (idx + 1) % carItems.length;
                      categoryCtrl.setIndex(newIndex);
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Color(0xffFA1201)),
                  ),
                ],
              ),
              const SizedBox(height: 100),

              /// Buttons
              CommonRedButton(
                label: 'By Subject',
                onPressed: () {
                  Get.to(() => SubjectListScreen(), arguments: {'category': idx});
                },
              ),
              const SizedBox(height: 16),
              CommonRedButton(
                label: 'All Tickets',
                onPressed: () {
                  // Future: implement ticket screen and pass idx
                },
              ),
              const SizedBox(height: 16),
              CommonRedButton(
                label: 'Exam',
                   onPressed: () {
                  final categoryCtrl = Get.find<CategoryController>();
                  final selectedCategory = categoryCtrl.currentLabel;

                  // Register controller and pass argument only after Get.to
                  Get.to(() => const ExamScreen(), arguments: selectedCategory);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}


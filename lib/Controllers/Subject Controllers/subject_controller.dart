// import 'package:avtoskola_varketilshi/Models/subject_model.dart';
// import 'package:get/get.dart';
// class SubjectController extends GetxController {
//   final subjects = <SubjectModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadSubjects();
//   }

//   void loadSubjects() {
//     subjects.assignAll([
//       SubjectModel(id: 1, title: '1. the driver, passengers and the infantry,\nthe signs, the Convention'),
//       SubjectModel(id: 2, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 3, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 4, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 5, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 6, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 7, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 8, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 9, title: '2. Disorder and driving conditions'),
//       SubjectModel(id: 10, title: '2. Disorder and driving conditions'),
//     ]);
//   }
// }


import 'package:avtoskola_varketilshi/Models/subject_model.dart';
import 'package:get/get.dart';
import '../../Models/question_model.dart';

class SubjectController extends GetxController {
  final subjects = <SubjectModel>[].obs;

@override
void onInit() {
  super.onInit();
  loadSubjects();
}

  Map<int, List<QuestionModel>> subjectQuestions = {
    1: [
      QuestionModel(
        question: 'How should environment impact mitigation be achieved ?',
        options: [
          'Drive your own car always',
          'Use public transport',
          'Ignore traffic rules',
        ],
        correctAnswer: 1,
      ),
      QuestionModel(
        question: 'When to use seat belts?',
        options: ['Always', 'Only on highway', 'Never'],
        correctAnswer: 0,
      ),
    ],
    2: [
      QuestionModel(
        question: 'Driving in fog needs?',
        options: ['High beam', 'Low beam', 'Hazards only'],
        correctAnswer: 1,
      )
    ],
  };

  void loadSubjects() {
    subjects.assignAll([
      SubjectModel(id: 1, title: '1. Environment & Safety'),
      SubjectModel(id: 2, title: '2. Driving Conditions'),
    ]);
  }
}

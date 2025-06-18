
import 'package:avtoskola_varketilshi/Models/question_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubjectController extends GetxController {
  final subjects = <SubjectModel>[].obs;

  /// Questions by subject ID
  final Map<int, List<QuestionModel>> subjectQuestions = {};

  @override
  void onInit() {
    super.onInit();
    loadSubjects();
  }

  void loadSubjects() {
    subjects.assignAll([
      // Category 0
      SubjectModel(id: 1, title: '1. Road Safety', categoryId: 0),
      SubjectModel(id: 2, title: '2. Environment', categoryId: 0),

      // Category 1
      SubjectModel(id: 3, title: '1. Truck Basics', categoryId: 1),
      SubjectModel(id: 4, title: '2. Cargo Safety', categoryId: 1),

      // Category 2
      SubjectModel(id: 5, title: '1. Passenger Rules', categoryId: 2),

      // Category 3
      SubjectModel(id: 6, title: '1. Farm Equipment', categoryId: 3),
    ]);

    subjectQuestions[1] = [
      QuestionModel(
        question: 'What is the safe speed in a residential area?',
        options: ['30 km/h', '50 km/h', '70 km/h'],
        correctAnswer: 0,
      ),
      QuestionModel(
        question: 'What is the safe speed in a residential area?',
        options: ['30 km/h', '50 km/h', '70 km/h'],
        correctAnswer: 0,
      ),
      QuestionModel(
        question: 'What is the safe speed in a residential area?',
        options: ['30 km/h', '50 km/h', '70 km/h'],
        correctAnswer: 0,
      ),
    ];

    subjectQuestions[2] = [
      QuestionModel(
        question: 'When should you turn off the engine?',
        options: ['Never', 'At long stops', 'In tunnels'],
        correctAnswer: 1,
      ),
    ];

    subjectQuestions[3] = [
      QuestionModel(
        question: 'What is max load for a C truck?',
        options: ['5 tons', '15 tons', '25 tons'],
        correctAnswer: 2,
      ),
    ];

    subjectQuestions[4] = [
      QuestionModel(
        question: 'How do you secure cargo?',
        options: ['With net', 'With chains', 'Both'],
        correctAnswer: 2,
      ),
    ];

    subjectQuestions[5] = [
      QuestionModel(
        question: 'What is max standing passengers in D bus?',
        options: ['10', '15', '20'],
        correctAnswer: 1,
      ),
    ];

    subjectQuestions[6] = [
      QuestionModel(
        question: 'Which vehicles are exempt from license?',
        options: ['Bicycles', 'Tractors', 'Scooters'],
        correctAnswer: 1,
      ),
    ];
  }

  List<SubjectModel> getSubjectsByCategory(int categoryId) {
  return subjects.where((s) => s.categoryId == categoryId).toList();
}

List<QuestionModel> getQuestionsForSubject(int subjectId) {
  return subjectQuestions[subjectId] ?? [];
}

}

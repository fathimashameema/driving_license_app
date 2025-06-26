import 'dart:convert';
import 'dart:developer';

import 'package:avtoskola_varketilshi/Models/question_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SubjectController extends GetxController {
  // All categories share the same subjects
  final subjects = <SubjectModel>[
    SubjectModel(
        id: 1, title: '1.Driver, passenger and pedestrian, signs, convention'),
    SubjectModel(id: 2, title: '2.Irregularities and driving conditions'),
    SubjectModel(id: 3, title: '3.Warning signs'),
    SubjectModel(id: 4, title: '4.Priority signs'),
    SubjectModel(id: 5, title: '5.Prohibitory signs'),
    SubjectModel(id: 6, title: '6.Indicative signs'),
    SubjectModel(id: 7, title: '7.Information-indicative signs'),
    SubjectModel(id: 8, title: '8.Service marks'),
    SubjectModel(id: 9, title: '9.Signs of additional information'),
    SubjectModel(id: 10, title: '10.Traffic light signals'),
    SubjectModel(id: 11, title: '11.Regulator signals'),
    SubjectModel(id: 12, title: '12.Use of special signal'),
    SubjectModel(id: 13, title: '13.Emergency beacon signaling'),
    SubjectModel(id: 14, title: '14.Lighting tools, sound signal'),
    SubjectModel(id: 15, title: '15.Movement, maneuvering, undercarriage'),
    SubjectModel(
        id: 16, title: '16.Overtaking by bypassing the oncoming vehicle'),
    SubjectModel(id: 17, title: '17.Movement speed'),
    SubjectModel(id: 18, title: '18.Brake distance, distance'),
    SubjectModel(id: 19, title: '19.stop standing'),
    SubjectModel(id: 20, title: '20.Passing the intersection'),
    SubjectModel(id: 21, title: '21.Railway crossing'),
    SubjectModel(id: 22, title: '22.Traffic on the highway'),
    SubjectModel(id: 23, title: '23.Residential zone, bus priority'),
    SubjectModel(id: 24, title: '24.Towing'),
    SubjectModel(id: 25, title: '25.Learning move'),
    SubjectModel(id: 26, title: '26.Shipments, people, cargo'),
    SubjectModel(id: 27, title: '27.Bicycle, moped and cattle driving'),
    SubjectModel(id: 28, title: '28.Road marking'),
    SubjectModel(id: 29, title: '29.Medical assistance'),
    SubjectModel(id: 30, title: '30.Traffic safety'),
    SubjectModel(id: 31, title: '31.Administrative law'),
    SubjectModel(id: 32, title: '32.ECO-Driving[new]'),
  ].obs;

  /// Questions by category and subject
  /// categoryId -> subjectId -> List<QuestionModel
  final Map<int, Map<int, List<QuestionModel>>> categorySubjectQuestions = {};

  /// Loading state
  final RxBool isLoading = true.obs;

  /// Map of categoryId -> subjectId -> file path
  final Map<int, Map<int, String>> questionFilePaths = {
    0: {
      1: 'assets/questions/bb1_sign_conventions.json',
      2: 'assets/questions/bb1_driving_conditions.json',
      3: 'assets/questions/bb1_warning_signs.json',
      4: 'assets/questions/bb1_priority_signs.json',
      5: 'assets/questions/bb1_prohobitory_signs.json',
      6: 'assets/questions/bb1_indicative_signs.json',
      7: 'assets/questions/bb1_information_signs.json',
      8: 'assets/questions/bb1_service_marks.json',
      9: 'assets/questions/bb1_additional_info.json',
      10: 'assets/questions/bb1_traffic_signals.json',
      11: 'assets/questions/bb1_regulator_signs.json',
      12: 'assets/questions/bb1_spcl_signs_use.json',
      13: 'assets/questions/bb1_emergency_signal.json',
      14: 'assets/questions/bb1_light_and_sound.json',
      15: 'assets/questions/bb1_maneuvering.json',
      16: 'assets/questions/bb1_overtaking.json',
      17: 'assets/questions/bb1_movement_speed.json',
      18: 'assets/questions/bb1_distance.json',
      19: 'assets/questions/bb1_stop_standing.json',
      20: 'assets/questions/bb1_intersection.json',
      21: 'assets/questions/bb1_railway_crossing.json',
      22: 'assets/questions/bb1_highway_traffic.json',
      23: 'assets/questions/bb1_residential_zone.json',
      24: 'assets/questions/bb1_towing.json',
      25: 'assets/questions/bb1_learning_move.json',
      26: 'assets/questions/bb1_shipment.json',
      27: 'assets/questions/bb1_bicycle.json',
      28: 'assets/questions/bb1_road_marking.json',
      29: 'assets/questions/bb1_medical.json',
      30: 'assets/questions/bb1_traffic_safety.json',
      31: 'assets/questions/bb1_law.json',
      32: 'assets/questions/bb1_eco_driving.json'
      //category 0
    },
    1: {
      1: 'assets/questions/bb1_sign_conventions.json',
      2: 'assets/questions/bb1_driving_conditions.json',
      3: 'assets/questions/bb1_warning_signs.json',
      4: 'assets/questions/bb1_priority_signs.json',
      5: 'assets/questions/bb1_prohobitory_signs.json',
      6: 'assets/questions/bb1_indicative_signs.json',
      7: 'assets/questions/bb1_information_signs.json',
      8: 'assets/questions/bb1_service_marks.json',
      9: 'assets/questions/bb1_additional_info.json',
      10: 'assets/questions/bb1_traffic_signals.json',
      11: 'assets/questions/bb1_regulator_signs.json',
      12: 'assets/questions/bb1_spcl_signs_use.json',
      13: 'assets/questions/bb1_emergency_signal.json',
      14: 'assets/questions/bb1_light_and_sound.json',
      15: 'assets/questions/bb1_maneuvering.json',
      16: 'assets/questions/bb1_overtaking.json',
      17: 'assets/questions/bb1_movement_speed.json',
      18: 'assets/questions/bb1_distance.json',
      19: 'assets/questions/bb1_stop_standing.json',
      20: 'assets/questions/bb1_intersection.json',
      21: 'assets/questions/bb1_railway_crossing.json',
      22: 'assets/questions/bb1_highway_traffic.json',
      23: 'assets/questions/bb1_residential_zone.json',
      24: 'assets/questions/bb1_towing.json',
      25: 'assets/questions/bb1_learning_move.json',
      26: 'assets/questions/bb1_shipment.json',
      27: 'assets/questions/bb1_bicycle.json',
      28: 'assets/questions/bb1_road_marking.json',
      29: 'assets/questions/bb1_medical.json',
      30: 'assets/questions/bb1_traffic_safety.json',
      31: 'assets/questions/bb1_law.json',
      32: 'assets/questions/bb1_eco_driving.json'
      //  category 1
    },
    2: {
      1: 'assets/questions/bb1_sign_conventions.json',
      2: 'assets/questions/bb1_driving_conditions.json',
      3: 'assets/questions/bb1_warning_signs.json',
      4: 'assets/questions/bb1_priority_signs.json',
      5: 'assets/questions/bb1_prohobitory_signs.json',
      6: 'assets/questions/bb1_indicative_signs.json',
      7: 'assets/questions/bb1_information_signs.json',
      8: 'assets/questions/bb1_service_marks.json',
      9: 'assets/questions/bb1_additional_info.json',
      10: 'assets/questions/bb1_traffic_signals.json',
      11: 'assets/questions/bb1_regulator_signs.json',
      12: 'assets/questions/bb1_spcl_signs_use.json',
      13: 'assets/questions/bb1_emergency_signal.json',
      14: 'assets/questions/bb1_light_and_sound.json',
      15: 'assets/questions/bb1_maneuvering.json',
      16: 'assets/questions/bb1_overtaking.json',
      17: 'assets/questions/bb1_movement_speed.json',
      18: 'assets/questions/bb1_distance.json',
      19: 'assets/questions/bb1_stop_standing.json',
      20: 'assets/questions/bb1_intersection.json',
      21: 'assets/questions/bb1_railway_crossing.json',
      22: 'assets/questions/bb1_highway_traffic.json',
      23: 'assets/questions/bb1_residential_zone.json',
      24: 'assets/questions/bb1_towing.json',
      25: 'assets/questions/bb1_learning_move.json',
      26: 'assets/questions/bb1_shipment.json',
      27: 'assets/questions/bb1_bicycle.json',
      28: 'assets/questions/bb1_road_marking.json',
      29: 'assets/questions/bb1_medical.json',
      30: 'assets/questions/bb1_traffic_safety.json',
      31: 'assets/questions/bb1_law.json',
      32: 'assets/questions/bb1_eco_driving.json'
      //  category 2
    },
    3: {
      1: 'assets/questions/bb1_sign_conventions.json',
      2: 'assets/questions/bb1_driving_conditions.json',
      3: 'assets/questions/bb1_warning_signs.json',
      4: 'assets/questions/bb1_priority_signs.json',
      5: 'assets/questions/bb1_prohobitory_signs.json',
      6: 'assets/questions/bb1_indicative_signs.json',
      7: 'assets/questions/bb1_information_signs.json',
      8: 'assets/questions/bb1_service_marks.json',
      9: 'assets/questions/bb1_additional_info.json',
      10: 'assets/questions/bb1_traffic_signals.json',
      11: 'assets/questions/bb1_regulator_signs.json',
      12: 'assets/questions/bb1_spcl_signs_use.json',
      13: 'assets/questions/bb1_emergency_signal.json',
      14: 'assets/questions/bb1_light_and_sound.json',
      15: 'assets/questions/bb1_maneuvering.json',
      16: 'assets/questions/bb1_overtaking.json',
      17: 'assets/questions/bb1_movement_speed.json',
      18: 'assets/questions/bb1_distance.json',
      19: 'assets/questions/bb1_stop_standing.json',
      20: 'assets/questions/bb1_intersection.json',
      21: 'assets/questions/bb1_railway_crossing.json',
      22: 'assets/questions/bb1_highway_traffic.json',
      23: 'assets/questions/bb1_residential_zone.json',
      24: 'assets/questions/bb1_towing.json',
      25: 'assets/questions/bb1_learning_move.json',
      26: 'assets/questions/bb1_shipment.json',
      27: 'assets/questions/bb1_bicycle.json',
      28: 'assets/questions/bb1_road_marking.json',
      29: 'assets/questions/bb1_medical.json',
      30: 'assets/questions/bb1_traffic_safety.json',
      31: 'assets/questions/bb1_law.json',
      32: 'assets/questions/bb1_eco_driving.json'
      //  category 3
    },
  };

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
  }

  Future<List<QuestionModel>> loadSubjectQuestions(String questionFile) async {
    try {
      final String jsonString = await rootBundle.loadString(questionFile);
      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData
          .map((questionJson) => QuestionModel.fromJson(questionJson))
          .toList();
    } catch (e) {
      log("Error loading questions: $e");
      return [];
    }
  }

  Future<void> loadQuestions() async {
    isLoading.value = true;
    final categories = questionFilePaths.keys;
    for (final categoryId in categories) {
      categorySubjectQuestions[categoryId] = {};
      final subjectMap = questionFilePaths[categoryId]!;
      for (final subjectId in subjectMap.keys) {
        final filePath = subjectMap[subjectId]!;
        try {
          final questions = await loadSubjectQuestions(filePath);
          categorySubjectQuestions[categoryId]![subjectId] = questions;
        } catch (e) {
          categorySubjectQuestions[categoryId]![subjectId] = [];
        }
      }
    }
    isLoading.value = false;
  }

  List<SubjectModel> getSubjects() => subjects;

  List<QuestionModel> getQuestionsForSubject(int categoryId, int subjectId) {
    if (isLoading.value) return [];
    return categorySubjectQuestions[categoryId]?[subjectId] ?? [];
  }
}

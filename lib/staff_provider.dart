import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vesti_exercise/staff_model.dart';

final staffListProvider =
StateNotifierProvider.autoDispose<StaffListProvider, List<StaffModel>>(
        (ref) => StaffListProvider());


class StaffListProvider extends StateNotifier<List<StaffModel>> {
  StaffListProvider() : super([]);

  //add staff
  void addStaff(StaffModel staff) {
    state = [...state,staff];
  }

  //remove staff
  void removeStaff(int index) {
    state = List.from(state)..removeAt(index);
  }

  void editStaff(int index, {String? fullName, String? email, List<String>? skills}) {
    state =
        [
          for (var i = 0; i < state.length; i++)
            if (i == index) state[i].copyWith(fullName: fullName, email: email, skills: skills) else state[i]
        ];

  }

  void addSkill(int userIndex, String skill) {
    List<String> skills = [...state[userIndex].skills, skill] ;
    state =
    [
      for (var i = 0; i < state.length; i++)
        if (i == userIndex) state[i].copyWith(skills: skills) else state[i]
    ];
  }

  void removeSkill(int userIndex, int skillIndex) {
    state =
    [
      for (var i = 0; i < state.length; i++)
        if (i == userIndex) state[userIndex].copyWith(skills: [
          for (var si = 0; si < state[userIndex].skills.length; si++)
            if (si != skillIndex) state[userIndex].skills[si]
        ]) else state[i]
    ];
  }


}


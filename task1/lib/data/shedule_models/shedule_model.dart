import 'package:task1/data/constants.dart';
import 'package:task1/data/shedule_models/week_model.dart';

class Shedule {
  List<Week> shedule = [];

  Week selectGroup(String groupName) {
    groupName = groupName.replaceAll('-', '');
    return shedule.firstWhere((element) => element.groupName == groupName);
  }

  Shedule.fromJSON(Map<String, dynamic> json) {
    for (var element in Constants.groupNames) {
      shedule.add(Week.fromJSON(json[element.replaceAll("-", '')]));
    }
  }
}

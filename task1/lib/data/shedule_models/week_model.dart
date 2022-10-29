import 'package:task1/data/constants.dart';
import 'day_model.dart';

class Week {
  late String groupName;
  Map<String, List<Day>> days = {};

  Week.fromJSON(Map<String, dynamic> json) {
    groupName = json['groupName'];
    for (var element in Constants.weekDays) {
      days.addAll(
          {element: json[element].map<Day>((e) => Day.fromJson(e)).toList()});
    }
  }
}

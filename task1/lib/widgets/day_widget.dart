import 'package:flutter/material.dart';
import 'package:task1/data/shedule_models/day_model.dart';
import 'package:task1/widgets/para_widget.dart';

class DayShedule extends StatelessWidget {
  const DayShedule({super.key, required this.days});
  final List<Day> days;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: days.length,
      itemBuilder: (BuildContext context, int index) {
        return ParaShedule(day: days[index]);
      },
    );
  }
}

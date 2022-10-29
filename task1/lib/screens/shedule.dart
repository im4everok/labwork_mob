import 'package:flutter/material.dart';
import 'package:task1/data/constants.dart';
import 'package:task1/data/shedule_models/week_model.dart';
import 'package:task1/widgets/day_widget.dart';

class Shedule extends StatelessWidget {
  const Shedule({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments as Week);

    return DefaultTabController(
      length: args.days.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(args.groupName),
            bottom: TabBar(
              tabs: Constants.weekDays.map((e) => Tab(text: e)).toList(),
            ),
          ),
          body: TabBarView(
              children: args.days.values
                  .map((e) => DayShedule(days: e))
                  .toList())),
    );
  }
}

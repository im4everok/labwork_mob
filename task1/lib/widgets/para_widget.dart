import 'package:flutter/material.dart';
import 'package:task1/data/shedule_models/day_model.dart';

class ParaShedule extends StatelessWidget {
  const ParaShedule({super.key, required this.day});
  final Day day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(day.para.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(day.subject, style: const TextStyle(fontSize: 15)),
                        const Divider(
                          thickness: 2,
                        ),
                        Text(day.position,
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic)),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/data/constants.dart';
import 'package:task1/data/data.dart';
import 'package:task1/data/shedule_models/shedule_model.dart';

import '../data/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future isLoading;
  late Shedule shedule;
  late String dropdownValue;

  initShedule() async {
    final String response = await rootBundle.loadString('assets/shedule.json');
    final data = await json.decode(response);
    shedule = Shedule.fromJSON(data);
  }

  @override
  void initState() {
    dropdownValue = Constants.groupNames.first;
    isLoading = initShedule();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments ??
        Data("Unknown", "Unknown")) as Data;

    return Scaffold(
        body: FutureBuilder(
      future: isLoading,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Home screen", style: TextStyle(fontSize: 25)),
                Text("${args.name} ${args.surname}"),
                DropdownButton(
                    hint: const Text('Select group'),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    items: Constants.groupNames
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: ((value) {
                      setState(() {
                        dropdownValue = value.toString();
                      });
                    })),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.schedule,
                        arguments: shedule.selectGroup(dropdownValue));
                  },
                  child: const Text('SEE SCHEDULE'),
                )
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}

import 'package:flutter/material.dart';

import '../services/http_service.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedChapter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Select chapter $selectedChapter',
                style: Theme.of(context).textTheme.headline4),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter number'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    selectedChapter = 1;
                  });
                  return;
                }

                if (int.parse(value) != 0 && int.parse(value) <= 1000) {
                  setState(() {
                    selectedChapter = int.parse(value);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Number cant be 0 or > 1000')));
                }
              },
            ),
          ),
          ElevatedButton(
            child: const Text("Get chapter name"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultScreen(
                      chapter: HttpService().getData(selectedChapter))));
            },
          )
        ],
      ),
    ));
  }
}

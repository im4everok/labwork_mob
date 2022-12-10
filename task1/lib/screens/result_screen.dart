import 'package:flutter/material.dart';
import 'package:task1/data/data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chapter});
  final Future<Data> chapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: chapter,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 75, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data!.tamExp,
                              style: Theme.of(context).textTheme.headline4),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Text(snapshot.data!.eng,
                              style: Theme.of(context).textTheme.headline5),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Text(snapshot.data!.engExp,
                              style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Error: ${snapshot.error}',
                        style: Theme.of(context).textTheme.headline6));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}

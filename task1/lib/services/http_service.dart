import 'dart:convert';
import 'package:http/http.dart';
import 'package:task1/data/data.dart';
import 'package:task1/data/http_data.dart';

class HttpService {
  Future<Data> getData(int chapterNumber) async {
    try {
      final response =
          await get(Uri.parse(HttpData.url + chapterNumber.toString()));
      if (response.statusCode == 200) {
        return Data.fromJson(json.decode(response.body));
      } else {
        return Data('No data', 'No data', 'No data');
      }
    } catch (e) {
      return Data(e.toString(), 'No data', 'No data');
    }
  }
}

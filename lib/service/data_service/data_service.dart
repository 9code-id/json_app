import 'dart:convert';

import 'package:flutter/services.dart';

class DataService {
  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<List> loadDataJson() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    return jsonDecode(jsonString);
  }
}

import 'dart:developer';

import 'package:coffecafe/model/itemmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Item>?> getUsers(String api) async {
    try {
      var url = Uri.parse(api);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Item> _model = itemModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
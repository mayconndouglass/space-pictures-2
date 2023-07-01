import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/nasa_data.dart';

class NasaDataProvider with ChangeNotifier {
  final _baseUrl =
    "https://api.nasa.gov/planetary/apod?api_key=dnMJvz348Yg7Olj2eapd8c1GkXC5klWTqKzX1Yji";
  final List<NasaData> dataList = [];

  Future<void> loadData({required int count }) async {
    final url = "$_baseUrl&count=$count";

    final response = await http.get(Uri.parse(url));
    
    try {
      final List<dynamic> body = jsonDecode(response.body);
      dataList.clear();
      dataList.addAll(body.map((data) => NasaData.fromJson(data)));
      
      notifyListeners();
    } catch (error) {
      throw Exception('Ops, Erro no carregamento dos dados');
    }
  }
}

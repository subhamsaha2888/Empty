
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wall/wall_model.dart';

class WallApi {
  static Future<List<WallModel>> getPhotos() async {
    const wallUrl = 'https://raw.githubusercontent.com/SarthakDesigns/walls/main/main.json';
    final response = await http.get(Uri.parse(wallUrl));
    debugPrint("URL: ${Uri.encodeFull(wallUrl)}");


    if (response.statusCode == 200) {
      debugPrint('Response Code : ${response.statusCode}');
      final List wallsList = json.decode(response.body);
      return wallsList.map((json) => WallModel.fromJson(json)).toList();
    } else {
      debugPrint('Response Code : ${response.statusCode}');
      throw Exception();
    }
  }
}
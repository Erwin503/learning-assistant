import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/course.dart';
import '../models/category.dart';
import '../models/card.dart';

class ApiService {
  final String baseUrl = "https://fakerapi.it/api/v1";
  final String urlToServer = "http://localhost:3000/api";

  Future<Map<String, dynamic>> createBlock(
      Map<String, dynamic> blockData) async {
    var url = Uri.parse('$baseUrl/block');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(blockData),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to create block. Status code: ${response.statusCode}');
    }
  }

  Future<List<Course>> fetchCourses() async {
    var url = Uri.parse(
        '$baseUrl/custom?_quantity=10&title=name&student_count=counter&card_count=counter&icon_url=word&description=text');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<Course> courses = (json['data'] as List)
          .map((courseJson) => Course.fromJson(courseJson))
          .toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<List<BlockCard>> fetchCards() async {
    var url = Uri.parse('$urlToServer/card');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<BlockCard> cards = (json['data'] as List)
          .map((mapJson) => BlockCard.fromJson(mapJson))
          .toList();
      return cards;
    } else {
      throw Exception('Failed to load cards');
    }
  }

  Future<List<BlockCategory>> fetchCategories() async {
    var url = Uri.parse('$urlToServer/category');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<BlockCategory> categories = (json['data'] as List)
          .map((mapJson) => BlockCategory.fromJson(mapJson))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

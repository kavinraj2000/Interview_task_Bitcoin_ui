import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:interview/dashboard/model/dashboardmodel.dart';
import 'package:logger/logger.dart';

class Repository {
  final log = Logger();

  Future<List<DashboardModel>> getData() async {
    try {
      final response = await rootBundle.loadString('assets/json/data.json');
      final jsonData = json.decode(response);
      log.i("Raw JSON Loaded: $jsonData");

      final List<dynamic> dataList = jsonData['data'];
      return dataList.map((e) => DashboardModel.fromJson(e)).toList();
    } catch (e) {
      log.e("Error loading dashboard data: $e");
      rethrow;
    }
  }
}

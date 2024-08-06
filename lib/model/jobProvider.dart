import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'jobModel.dart';

class JobProvider with ChangeNotifier {
  List<JobModel> _jobs = [];

  List<JobModel> get jobs => _jobs;

  Future<void> loadJobs() async {
    final String response = await rootBundle.loadString('assets/job.json');
    final List<dynamic> data = json.decode(response);
    _jobs = data.map((json) => JobModel.fromJson(json)).toList();
    notifyListeners();
  }
}

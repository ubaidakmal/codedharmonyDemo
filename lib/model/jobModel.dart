import 'dart:convert';

import 'package:flutter/material.dart';

class JobModel {
  final int id;
  final String color;
  final String company;
  final String logo;
  final bool isNew;
  final bool isFeatured;
  final String position;
  final String role;
  final String level;
  final String postedAt;
  final String contract;
  final String location;
  final List<String> languages;
  final List<String> tools;

  JobModel({
    required this.id,
    required this.color,
    required this.company,
    required this.logo,
    required this.isNew,
    required this.isFeatured,
    required this.position,
    required this.role,
    required this.level,
    required this.postedAt,
    required this.contract,
    required this.location,
    required this.languages,
    required this.tools,
  });

  // Factory constructor to create a JobModel from JSON
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      color: json['color'],
      company: json['company'],
      logo: json['logo'],
      isNew: json['new'],
      isFeatured: json['featured'],
      position: json['position'],
      role: json['role'],
      level: json['level'],
      postedAt: json['postedAt'],
      contract: json['contract'],
      location: json['location'],
      languages: List<String>.from(json['languages']),
      tools: List<String>.from(json['tools']),
    );
  }

  // Method to convert a JobModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'company': company,
      'logo': logo,
      'new': isNew,
      'featured': isFeatured,
      'position': position,
      'role': role,
      'level': level,
      'postedAt': postedAt,
      'contract': contract,
      'location': location,
      'languages': languages,
      'tools': tools,
    };
  }

  // Static method to parse a list of JobModel from JSON
  static List<JobModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => JobModel.fromJson(json)).toList();
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  final dio = Dio();
  final List<ColorModel> test = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }


  void fetch() async {
    try {
     final response = await dio.get('https://www.jsonkeeper.com/b/N5M6');
     final resultClass = response.data;
        print("-----");
        for (int i = 0; i < resultClass.length; i++) {
          final doctor = ColorModel.fromJson(resultClass[i]);
          test.add(doctor);
        }
        print(test);

    } catch (e) {

    }

  }


    @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: Center(
  child:Text("sqsadlhbiewufd"),
),
    );
  }
}

class ColorModel {
  int? type;
  String? color;

  ColorModel({this.type, this.color});

  ColorModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['color'] = this.color;
    return data;
  }
}
import 'dart:convert';

import 'package:api/get/Nationalize/getmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class nation extends StatefulWidget {
  const nation({super.key});

  @override
  State<nation> createState() => _nationState();
}

class _nationState extends State<nation> {
  
  Future<Nationalize> nalize() async{
    var NationalResult = await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
    return Nationalize.fromJson(jsonDecode(NationalResult.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

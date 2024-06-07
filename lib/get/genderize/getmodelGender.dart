import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getapi.dart';

class GenderMF extends StatefulWidget {
  const GenderMF({super.key});

  @override
  State<GenderMF> createState() => _GenderMFState();
}

class _GenderMFState extends State<GenderMF> {
  
  Future<Gender> MFGender() async{
    var MFFM = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
    return Gender.fromJson(jsonDecode(MFFM.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: MFGender(), 
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.count.toString()),
                      Text(snapshot.data!.name.toString()),
                      Text(snapshot.data!.gender.toString()),
                      Text(snapshot.data!.probability.toString()),
                    ],
                  );
                }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

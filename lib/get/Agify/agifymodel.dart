import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getagifyapi.dart';

class AgifyModel extends StatefulWidget {
  const AgifyModel({super.key});
 
  @override
  State<AgifyModel> createState() => _AgifyModelState();
}

class _AgifyModelState extends State<AgifyModel> {
  
  Future<Agify> ioagify() async{
    var Ageify = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
    return Agify.fromJson(jsonDecode(Ageify.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: ioagify(), 
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.count.toString()),
                      Text(snapshot.data!.name.toString()),
                      Text(snapshot.data!.age.toString()),
                    ],
                  );
                }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

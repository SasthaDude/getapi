import 'dart:convert';

import 'package:api/get/Dogs/getmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class God extends StatefulWidget {
  const God({super.key});

  @override
  State<God> createState() => _GodState();
}

class _GodState extends State<God> {

  Future<Dogssss> Dogo() async{
    var dogsResult = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    return Dogssss.fromJson(jsonDecode(dogsResult.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Dogo(), 
          builder: (BuildContext context, snapshot){
            if(snapshot.hasData){
              return Column(
                children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!.message!),
                  ),
                ),
                ),
                  Text(snapshot.data!.status.toString()),
                ],
              );
            }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            } return CircularProgressIndicator();
          }
      ),
    );
  }
}

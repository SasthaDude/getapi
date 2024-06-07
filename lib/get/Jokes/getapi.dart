import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getmodel.dart';

class FunJokes extends StatefulWidget {
  const FunJokes({super.key});

  @override
  State<FunJokes> createState() => _FunJokesState();
}

class _FunJokesState extends State<FunJokes> {
  
  Future<Jokes> JokesFun() async{
    var JokesResult = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    return Jokes.fromJson(jsonDecode(JokesResult.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: JokesFun(), 
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.type.toString()),
                      Text(snapshot.data!.setup.toString()),
                      Text(snapshot.data!.punchline.toString()),
                      Text(snapshot.data!.id.toString()),
                    ],
                  );
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

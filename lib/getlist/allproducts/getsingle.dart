import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getmodel.dart';
class getSinglePro extends StatefulWidget {
  final int id;
  const getSinglePro({super.key, required this.id});

  @override
  State<getSinglePro> createState() => _getSingleProState();
}

class _getSingleProState extends State<getSinglePro> {
  
  Future<ALLProducts> SinglePro() async{
    final int id = widget.id;
    var SingleResult = await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));
    return ALLProducts.fromJson(jsonDecode(SingleResult.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: SinglePro(),
              builder: (BuildContext context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.price.toString()),
                      Text(snapshot.data!.id.toString()),
                      Text(snapshot.data!.rating!.rate.toString()),
                      Text(snapshot.data!.rating!.count.toString()),
                      Text(snapshot.data!.category.toString()),
                      Text(snapshot.data!.description.toString()),
                      Text(snapshot.data!.title.toString()),
                      Image.network(snapshot.data!.image!),
                    ],
                  );
                } else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

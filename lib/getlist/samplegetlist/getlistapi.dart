import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class getListApi extends StatefulWidget {
  const getListApi({super.key});

  @override
  State<getListApi> createState() => _getListApiState();
}

class _getListApiState extends State<getListApi> {
  
  Future<List<Data>> fetchdata() async {
    var res = await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    var data = jsonDecode(res.body)["data"];
    return (data as List).map((obj) => Data.fromJson(obj)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetchdata(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  List<Data> sas = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: sas.length,
                        itemBuilder: (context, int index){
                        return ListTile(
                          leading: Text(sas[index].iDYear.toString()),
                          title: Column(
                            children: [
                              Text(sas[index].population.toString()),
                              Text(sas[index].iDNation.toString()),
                              Text(sas[index].nation.toString()),
                              Text(sas[index].year.toString()),
                            ],
                          ),
                        );
                        }
                    ),
                  );
                } if(snapshot.hasError){
                  return Text("error");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

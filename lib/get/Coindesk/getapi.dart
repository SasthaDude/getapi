import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'getmodel.dart';

class deskcoin extends StatefulWidget {
  const deskcoin({super.key});

  @override
  State<deskcoin> createState() => _deskcoinState();
}

class _deskcoinState extends State<deskcoin> {
  
  Future<Coindesk> code() async{
    var deskCoinResult = await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    return Coindesk.fromJson(jsonDecode(deskCoinResult.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: code(), 
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.time!.updatedISO.toString()),
                      Text(snapshot.data!.time!.updated.toString()),
                      Text(snapshot.data!.time!.updateduk.toString()),
                      Text(snapshot.data!.disclaimer.toString()),
                      Text(snapshot.data!.chartName.toString()),
                      Text(snapshot.data!.bpi!.uSD!.code.toString()),
                      Text(snapshot.data!.bpi!.uSD!.symbol.toString()),
                      Text(snapshot.data!.bpi!.uSD!.rate.toString()),
                      Text(snapshot.data!.bpi!.uSD!.rateFloat.toString()),
                      Text(snapshot.data!.bpi!.uSD!.description.toString()),
                      Text(snapshot.data!.bpi!.gBP!.code.toString()),
                      Text(snapshot.data!.bpi!.gBP!.symbol.toString()),
                      Text(snapshot.data!.bpi!.gBP!.rate.toString()),
                      Text(snapshot.data!.bpi!.gBP!.rateFloat.toString()),
                      Text(snapshot.data!.bpi!.gBP!.description.toString()),
                      Text(snapshot.data!.bpi!.eUR!.code.toString()),
                      Text(snapshot.data!.bpi!.eUR!.symbol.toString()),
                      Text(snapshot.data!.bpi!.eUR!.rate.toString()),
                      Text(snapshot.data!.bpi!.eUR!.rateFloat.toString()),
                      Text(snapshot.data!.bpi!.eUR!.description.toString()),
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

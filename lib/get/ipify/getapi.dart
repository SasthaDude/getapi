import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getmodel.dart';

class ifyIp extends StatefulWidget {
  const ifyIp({super.key});

  @override
  State<ifyIp> createState() => _ifyIpState();
}

class _ifyIpState extends State<ifyIp> {
  
  Future<IP> newIp() async{
    var IPResult = await http.get(Uri.parse("https://api.ipify.org?format=json"));
    return IP.fromJson(jsonDecode(IPResult.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: newIp(),
          builder: (BuildContext context, snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data!.ip.toString());
            }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            } return CircularProgressIndicator();
          }
      ),
    );
  }
}

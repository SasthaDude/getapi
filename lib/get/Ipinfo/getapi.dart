import 'dart:convert';

import 'package:api/get/Ipinfo/getmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfoIp extends StatefulWidget {
  const InfoIp({super.key});

  @override
  State<InfoIp> createState() => _InfoIpState();
}

class _InfoIpState extends State<InfoIp> {
  
  Future<ippinfoo> info() async {
    var infoResult = await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));
    return ippinfoo.fromJson(jsonDecode(infoResult.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: info(), 
              builder: (BuildContext context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.ip.toString()),
                      Text(snapshot.data!.city.toString()),
                      Text(snapshot.data!.country.toString()),
                      Text(snapshot.data!.loc.toString()),
                      Text(snapshot.data!.org.toString()),
                      Text(snapshot.data!.postal.toString()),
                      Text(snapshot.data!.readme.toString()),
                      Text(snapshot.data!.timezone.toString()),
                      Text(snapshot.data!.region.toString()),
                    ],
                  );
                } else if(snapshot.hasError) {
                  return Text("${snapshot.error}");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}

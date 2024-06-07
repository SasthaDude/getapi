import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getmodel.dart';

class RanUser extends StatefulWidget {
  const RanUser({super.key});

  @override
  State<RanUser> createState() => _RanUserState();
}

class _RanUserState extends State<RanUser> {

  Future<Random> UserRan() async{
    var UserResult = await http.get(Uri.parse("https://randomuser.me/api/"));
    return Random.fromJson(jsonDecode(UserResult.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        ],
      ),
    );
  }
}


// FutureBuilder(
// future: UserRan(),
// builder: (BuildContext context, snapshot){
// if(snapshot.hasData){
// // List<Random> RAUS = snapshot.data!;
// return ListView.builder(
// // itemCount: RAUS.length,
// itemBuilder: (context, int index){
// return Column(
// children: [
// Text(snapshot.data!.),
// Text(RAUS[index].name!.title.toString()),
// Text(RAUS[index].name!.first.toString()),
// Text(RAUS[index].name!.last.toString()),
// Text(RAUS[index].location!.street!.name.toString()),
// Text(RAUS[index].location!.street!.number.toString()),
// Text(RAUS[index].location!.city.toString()),
// Text(RAUS[index].location!.country.toString()),
// Text(RAUS[index].location!.coordinates!.latitude.toString()),
// Text(RAUS[index].location!.coordinates!.longitude.toString()),
// Text(RAUS[index].location!.state.toString()),
// Text(RAUS[index].location!.postcode.toString()),
// Text(RAUS[index].location!.timezone!.description.toString()),
// Text(RAUS[index].location!.timezone!.offset.toString()),
// Text(RAUS[index].email.toString()),
// Text(RAUS[index].login!.uuid.toString()),
// Text(RAUS[index].login!.username.toString()),
// Text(RAUS[index].login!.password.toString()),
// Text(RAUS[index].login!.salt.toString()),
// Text(RAUS[index].login!.sha1.toString()),
// Text(RAUS[index].login!.sha256.toString()),
// Text(RAUS[index].login!.md5.toString()),
// Text(RAUS[index].dob!.age.toString()),
// Text(RAUS[index].dob!.date.toString()),
// Text(RAUS[index].phone.toString()),
// Text(RAUS[index].cell.toString()),
// Text(RAUS[index].id!.name.toString()),
// Text(RAUS[index].id!.value.toString()),
// Text(RAUS[index].picture!.large.toString()),
// Text(RAUS[index].picture!.medium.toString()),
// Text(RAUS[index].picture!.thumbnail.toString()),
// Text(RAUS[index].nat.toString()),
// Text(snapshot.data!.info!.seed.toString()),
// ],
// )
// }
// )
// }
// }
// )
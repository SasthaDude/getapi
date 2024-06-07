// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'getmodel.dart';
//
// class CartsAll extends StatefulWidget {
//   const CartsAll({super.key});
//
//   @override
//   State<CartsAll> createState() => _CartsAllState();
// }
//
// class _CartsAllState extends State<CartsAll> {
//
//   Future<List<carts>> AllCarts() async{
//     var allCartRes = await http.get(Uri.parse("https://fakestoreapi.com/carts"));
//     var car = jsonDecode(allCartRes.body);
//     return (car as List).map((obj) => carts.fromJson(obj)).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           FutureBuilder(
//               future: AllCarts(),
//               builder: (BuildContext context, snapshot){
//                 if(snapshot.hasData){
//                   List<carts> NewCarts = snapshot.data!;
//                   return ListView.builder(
//                       itemCount: NewCarts.length,
//                       itemBuilder: (context, int index){
//                         return ListTile(
//                           title: Column(
//                             children: [
//
//                             ],
//                           ),
//                         )
//                       }
//                   )
//                 }
//               }
//           )
//         ],
//       ),
//     );
//   }
// }

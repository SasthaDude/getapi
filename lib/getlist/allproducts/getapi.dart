import 'dart:convert';
import 'package:api/getlist/allproducts/getsingle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'getmodel.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  
  Future<List<ALLProducts>> ALLP() async{
    var AllProductResult = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var Produ = jsonDecode(AllProductResult.body);
    return (Produ as List).map((obj) => ALLProducts.fromJson(obj)).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: ALLP(),
              builder: (BuildContext context, snapshot) {
                if(snapshot.hasData){
                  List<ALLProducts> pRO = snapshot.data!;
                  return Container(
                    height: 900,
                    child: ListView.builder(
                      itemCount: pRO.length,
                        itemBuilder: (context, int index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => getSinglePro(id: pRO[index].id!,)));
                          },
                          child: ListTile(

                            title: Column(
                              children: [
                                Text(pRO[index].id.toString()),
                                Text(pRO[index].title.toString()),
                                Text(pRO[index].price.toString()),
                                Text(pRO[index].description.toString()),
                                Text(pRO[index].category.toString()),
                                Image.network(pRO[index].image!),
                                Text(pRO[index].rating!.count.toString()),
                                Text(pRO[index].rating!.rate.toString()),
                              ],
                            ),
                          ),
                        );
                        }
                    ),
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

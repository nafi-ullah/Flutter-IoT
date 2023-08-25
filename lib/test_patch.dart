import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;


class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _dataShow();
  // }


  void  _dataShow() async{
   // final authToken = "AIzaSyCETcOmu-zJq1Gv2GST75hjP4cSNeHwEZY";
    // final url = Uri.https(
    //     'lightapp-e11f3-default-rtdb.asia-southeast1.firebasedatabase.app',
    //     'L1.json');
    //
    // final response = await http.get(url);
    // print('get data response:');
    // String valuess = response.body.toString();
    // print(valuess);


  final url = Uri.https(
          'lightapp-e11f3-default-rtdb.asia-southeast1.firebasedatabase.app','light.json');
 // final response = await http.put(url, body: request);

    http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body:json.encode(
       {
         'isOn' : "0",
       }
      )
    );

  // if(response.statusCode == 200){
  //   print(response.body);
  // }else{
  //   print('nothing changed');
  // }


  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
          child: ElevatedButton(onPressed: _dataShow,
              child: Text('Button'))
      ),
    );
  }
}

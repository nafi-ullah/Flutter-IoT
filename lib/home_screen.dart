import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pera_on/battery.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var buttonColorLight = Colors.red;
  var buttonColorCharger = Colors.red;
  String lightText = "Nafi's Pain is Off";
  String chargerText = "Charger is Off";
  var lightOn ;
  var chargerOn ;
  //final docUser;
  //-------------Adding battery percentage------------------------------
  var battery = Battery();
  int level = 100;
  BatteryState batteryState = BatteryState.full;
  late Timer timer;
  late StreamSubscription streamSubscription;





  void lightFunction(){
    final url = Uri.https(
        'lightapp-e11f3-default-rtdb.asia-southeast1.firebasedatabase.app','light.json');
    setState(() {
      if(lightOn == "0"){

        lightOn = "1";
        http.put(
            url,
            headers: {
              'Content-Type': 'application/json',
            },
            body:json.encode(
                {
                  'isOn' : lightOn,
                }
            )
        );

        buttonColorLight = Colors.green;
        lightText = "Nafi's Pain is On";
      }
      else{


      lightOn = "0";

      http.put(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body:json.encode(
              {
                'isOn' : lightOn,
              }
          )
      );


        buttonColorLight = Colors.red;
        lightText = "Nafi's Pain is OFF";
      }

    });
  }
  void chargerFunction(){
    final url1 = Uri.https(
        'lightapp-e11f3-default-rtdb.asia-southeast1.firebasedatabase.app','charger.json');

    setState(() {
      if(chargerOn == "0"){
        chargerOn= "1";

        http.put(
            url1,
            headers: {
              'Content-Type': 'application/json',
            },
            body:json.encode(
                {
                  'isOn' : chargerOn,
                }
            )
        );

         buttonColorCharger = Colors.green;
         chargerText = "Charger is on";
      }
      else{
        chargerOn= "0";

        http.put(
            url1,
            headers: {
              'Content-Type': 'application/json',
            },
            body:json.encode(
                {
                  'isOn' : chargerOn,
                }
            )
        );

        buttonColorCharger = Colors.red;
        chargerText = "Charger is off";
      }

    });

  }






  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text("Pain to Husband",
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
        decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.deepPurple, Colors.purple, Colors.deepPurple])
      ),
        ),
    ),
      body: Container(
        decoration: const BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC5A9FF),
              Colors.purpleAccent, Colors.purple],
            stops: [0.1, 0.5, 0.9],
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(onPressed: lightFunction,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColorLight, //background color of button
                    side: const BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: const EdgeInsets.all(20) //content padding inside button
                ),
                    child: Text(lightText,
                        style: TextStyle(color: Colors.white)
                    )

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: BatteryCheck(chargerText, buttonColorCharger, chargerFunction),

              )
            ],
          ),
        ),
      )
    );
  }
}

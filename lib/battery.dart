import 'package:flutter/material.dart';
import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BatteryCheck extends StatefulWidget {
   BatteryCheck(
       this.chargerText,
       this.bgClr,
       this.chargerFunction, {super.key});

  Function chargerFunction;
  Color bgClr;
  String chargerText;



  @override
  State<BatteryCheck> createState() => _BatteryCheckState();
}

class _BatteryCheckState extends State<BatteryCheck> {
  var battery = Battery();
  int level = 100;
  BatteryState batteryState = BatteryState.full;
  late Timer timer;
  late StreamSubscription streamSubscription;
  String? chargingText;
  Color? chargeClr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryPercentage();
    getBatteryState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getBatteryPercentage();
      getBatteryState();
    });
  }
  void getBatteryPercentage() async {
    final batteryLevel = await battery.batteryLevel;
    this.level = batteryLevel;
    print(level);
    final urlcc = Uri.https(
        'lightapp-e11f3-default-rtdb.asia-southeast1.firebasedatabase.app','charger.json');

    if(level < 70 ){
      http.put(
          urlcc,
          headers: {
            'Content-Type': 'application/json',
          },
          body:json.encode(
              {
                'isOn' : "1",
              }
          )
      );


    }
    else if(level >= 95){
      http.put(
          urlcc,
          headers: {
            'Content-Type': 'application/json',
          },
          body:json.encode(
              {
                'isOn' : "0",
              }
          )
      );

    }

    setState(() {});
  }


  void getBatteryState() {
    streamSubscription = battery.onBatteryStateChanged.listen((state) {
      setState(() {
        this.batteryState = state;

      });
    });
  }
  @override
  void dispose() {
    streamSubscription.cancel();
    timer.cancel();
  }
  void autoCharging(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Charger is connected. No need to press.'),

      ),
    );

  }




  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: autoCharging,
        style: ElevatedButton.styleFrom(
            backgroundColor: batteryState== BatteryState.charging ? Colors.black26 : Colors.pink ,
            //background color of button
            side: const BorderSide(width: 3, color: Colors.brown),
            //border width and color
            elevation: 3,
            //elevation of button
            shape: RoundedRectangleBorder( //to set border radius to button
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.all(20) //content padding inside button
        ),
        child: Text( batteryState== BatteryState.charging ?  "Auto Charging:- ${level} %" : "Charging Is OFF:- ${level} %",
            style: TextStyle(color: Colors.white)
        )

    );
  }
}

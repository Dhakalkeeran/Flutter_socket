import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class RecordScreen extends StatelessWidget {

  final Socket socket;
  final String host;

  RecordScreen(this.socket, this.host);

  @override
  Widget build(BuildContext context) {

    //Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Recording Mode"), 
        leading: IconButton(icon: Icon(
          Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueGrey
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Text(
            "Connected to  " + host +" : 4567",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey
            ),
          ),

          Container(
            height: 90
          ),
          
          Expanded(
            child: Text(
              "Record the co-ordinates through the System administrator",
              style: TextStyle(
                fontSize:25,
                color: Colors.grey 
              ),
            )
          ),

          Container(
            height: 110
          )

        ],
      )
    );
  }
}

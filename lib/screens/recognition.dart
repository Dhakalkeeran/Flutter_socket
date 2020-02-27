import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
//import 'package:flutter_socket/screens/initial.dart';


class RecogScreen extends StatelessWidget {

  final Socket socket;
  final String host;

  RecogScreen(this.socket, this.host);

  @override
  Widget build(BuildContext context) {

    //Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Recognition Mode"), 
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

          
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    socket.write('p');
                  },
                  child: Icon(Icons.pause,
                    color: Colors.grey,
                    size: 60,
                  )
                ),
              
                RaisedButton(
                  onPressed: (){
                    socket.write('s');
                  },
                  child: Icon(Icons.stop,
                    color: Colors.red[900],
                    size: 60,
                  )
                ),
              ],
            ),
          ),

          Container(
            height: 110
          )

        ],   
      )
    );
  }
}

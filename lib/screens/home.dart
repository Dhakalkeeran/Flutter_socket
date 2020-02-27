import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:flutter_socket/screens/record.dart';
import 'package:flutter_socket/screens/recognition.dart';


class HomeScreen extends StatelessWidget {

  final Socket socket;
  final String host;

  //final List<String> data = ['u', 'l', 'r', 'd'];

  HomeScreen(this.socket, this.host);

  @override
  Widget build(BuildContext context) {

    //Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    //For control of robotic arm by co-ordinates
    /*
    return Scaffold(
      appBar: AppBar(
        title: Text("RoboControl"), 
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
            child: Center(
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_up),
                iconSize: 40,
                onPressed: () {
                  debugPrint('Icon up_arrow was pressed');
                  socket.write('u');
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, size: 40),
                  onPressed: () {
                    debugPrint('Icon left_arrow was pressed');
                    socket.write('l');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right, size: 40),
                  onPressed: () {
                    debugPrint('Icon right_arrow was pressed');
                    socket.write('r');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: IconButton(
              icon: Icon(Icons.keyboard_arrow_down, size: 40),
              onPressed: () {
                debugPrint('Icon down_arrow was pressed');
                socket.write('d');
              },
            ),
          )),
        ],
      ),
    );*/

    //for control of robotic arm by record and recognition method
    return Scaffold(
      appBar: AppBar(
        title: Text("RoboControl"), 
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
                    socket.write('r');
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RecordScreen(socket, host);
                    }));
                  },
                  child: Text('Record',
                    style: TextStyle(fontSize: 20)
                  )
                ),
              
                RaisedButton(
                  onPressed: (){
                    socket.write('m');
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RecogScreen(socket, host);
                    }));
                  },
                  child: Text('Recognition',
                    style: TextStyle(fontSize: 20)
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

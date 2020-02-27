import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:flutter_socket/screens/home.dart';

class InitScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    //Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    var socket;
    var host;

    TextEditingController myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Connection to Server")),
      body: Column(
        children: <Widget>[

          Spacer(flex: 6),

          Padding(
            padding: EdgeInsets.only(left: 210, right: 240),
            child: TextField(
              controller: myController,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              onChanged: (value){
                debugPrint('Something changed in IP address text field');
              },
              decoration: InputDecoration(
                icon: Icon(Icons.computer, color: Colors.grey),
                filled: true,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                fillColor: Colors.grey[600],
                hintText: 'Enter ip address'
              ),
            ),
          ),

          Spacer(flex: 1),

          RaisedButton(
            onPressed: () async{
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return Center(child: CircularProgressIndicator(backgroundColor: Colors.blue));
                }
              );
              host = myController.text;
              debugPrint('About to connect');
              socket = await connectionSetup(host);
              debugPrint('Connected');
              //await new Future.delayed(const Duration(seconds: 3));
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen(socket, host);
              }));
            },
            child: Text('Connect',
              style: TextStyle(fontSize: 20)
            )
          ),

          Spacer(flex: 14),

        ],
      )
      );
  }
}

///*
Future<Socket> connectionSetup(host) {
  Future<Socket> sock = Socket.connect(host, 4567);
  return sock;
}
//*/
/*
Future<Socket> connectionSetup(socket, host) async{
  Socket.connect(host, 4567).then((Socket sock){
    socket = sock;
    socket.write('how');
    debugPrint('socket write command executed');
  });
  debugPrint('Connection command is executed');
  return socket;
}
*/
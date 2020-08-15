import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Notifications extends StatefulWidget {
  
  @override
  _NotificationsState createState() => _NotificationsState();
  
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: (){
            
          },
          padding: EdgeInsets.all(0.0),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 6.0),
          child: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black
            ),
          ),
        )
      )
    );
  }
}
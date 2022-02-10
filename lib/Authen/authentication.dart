
import 'package:flutter_appcovid/Authen/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(


                color: Colors.white,



            ),
          ),
          title: Text(
            "CovidHealthTech",
            style: TextStyle(fontSize: 50,color: Colors.pink,fontFamily: "Signatra"),
          ),
          centerTitle: true,
          bottom: TabBar(
          tabs : [
            Tab(
            icon: Icon(Icons.lock,color: Colors.pink,),
              child: Text("Login", style: TextStyle(color: Colors.pink, ),),
            ),

        Tab(
        icon: Icon(Icons.person,color: Colors.pink,),
          child: Text("Register", style: TextStyle(color: Colors.pink, ),),


    ),
          ],
          indicatorColor: Colors.white38,
        indicatorWeight:4.0,
        )
        ),
    body: Container(

    decoration: BoxDecoration(
    color: Colors.white,

    ),
     child: TabBarView(
       children: [
         Login(),
         Register(),
       ],
     ),
    ),

    ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_appcovid/Authen/authentication.dart';
import 'package:flutter_appcovid/Config/config.dart';
import 'package:flutter_appcovid/Home/Exercise.dart';
import 'package:flutter_appcovid/Home/food.dart';
import 'package:flutter_appcovid/Home/homemenu.dart';
import 'package:flutter_appcovid/Home/ttodo.dart';
import 'package:flutter_appcovid/Monitoring/Monitoring.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top:25.0, bottom:10.0),
          decoration: new BoxDecoration(


            color: Colors.white,



          ),
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                elevation: 8.0,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      HealthApp.sharedPreferences.getString(HealthApp.userAvatarUrl),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                HealthApp.sharedPreferences.getString(HealthApp.userName),
                style: TextStyle(color: Colors.pink, fontSize: 33.0, fontFamily: "Signatra"),
              )
            ],
          ),
        ),

        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 1,),


          child: Column(

            children:[
              ListTile(
                leading: Icon(Icons.home, color: Colors.pink,),
                title: Text("Home",style: TextStyle(color: Colors.pink),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (_) => HomeApp());
                  Navigator.pushReplacement(context, route);
                }
              ),
              Divider(height:10.0, color: Colors.pink,thickness: 4.0,),
              ListTile(
                  leading: Icon(Icons.note, color: Colors.pink,),
                  title: Text("Reminder/Diary",style: TextStyle(color: Colors.pink),),
                  onTap: (){
                    Route route = MaterialPageRoute(builder: (_) => TodoApp());
                    Navigator.pushReplacement(context, route);
                  }
              ),
              Divider(height:10.0, color: Colors.pink,thickness: 4.0,),
              ListTile(
                  leading: Icon(Icons.fitness_center, color: Colors.pink,),
                  title: Text("Exercise",style: TextStyle(color: Colors.pink),),
                  onTap: (){
                    Route route = MaterialPageRoute(builder: (_) => Exercise());
                    Navigator.pushReplacement(context, route);
                  }
              ),
              Divider(height:10.0, color: Colors.pink,thickness: 4.0,),
              ListTile(
                  leading: Icon(Icons.food_bank, color: Colors.pink,),
                  title: Text("Dietary Menu",style: TextStyle(color: Colors.pink),),
                  onTap: (){
                    Route route = MaterialPageRoute(builder: (_) => Food());
                    Navigator.pushReplacement(context, route);
                  }
              ),
              Divider(height:10.0, color: Colors.pink,thickness: 4.0,),
              ListTile(
                  leading: Icon(Icons.note, color: Colors.pink,),
                  title: Text("Monitoring",style: TextStyle(color: Colors.pink),),
                  onTap: (){
                    Route route = MaterialPageRoute(builder: (_) => Monitoring());
                    Navigator.pushReplacement(context, route);
                  }
              ),
              Divider(height:10.0, color: Colors.pink,thickness: 4.0,),
              ListTile(
                  leading: Icon(Icons.logout, color: Colors.pink,),
                  title: Text("Logout",style: TextStyle(color: Colors.pink),),
                  onTap: (){
                    HealthApp.auth.signOut().then((c)
                   {
                     Route route = MaterialPageRoute(builder: (_) => AuthenticScreen());
                     Navigator.pushReplacement(context, route);
                   }
                   );
                  }
              ),
              Divider(height:10.0, color: Colors.pink,thickness: 4.0,),


              SizedBox(height: 100,),
            ],
          ),

        )
      ],

      ),
    );
  }
}

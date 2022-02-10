
import 'package:flutter_appcovid/Config/config.dart';
import 'package:flutter_appcovid/counter/itemcounter.dart';
import 'package:flutter_appcovid/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeApp extends StatefulWidget {
  @override
  _Homestate createState() => _Homestate();
}


class _Homestate extends State<HomeApp> {
  DateTime backButtonPressed;
  @override
  Widget build(BuildContext context) {
   MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.pink),
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
          actions: [
            Stack(
              children: [

                Positioned(
                  child:
                  Stack(
                      children:[
                        Icon(
                          Icons.brightness_1,
                          size: 18,
                          color: Colors.white,
                        ),
                        Positioned(
                          top: 3.0,
                          bottom: 4.0 ,
                          left: 4.0,
                          child: Consumer<CartItemCounter>(
                            builder: (context, counter, _)
                            {
                              return Text(
                                (HealthApp.sharedPreferences.getStringList(HealthApp.userCartList).length-1).toString(),
                                style: TextStyle(color: Colors.pink, fontSize: 12.0, fontWeight: FontWeight.bold),
                              );
                            },

                          ),

                        ),

                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
        drawer:
        MyDrawer(),
        body:


        Column(
        ),

      ),

    );
  }
}

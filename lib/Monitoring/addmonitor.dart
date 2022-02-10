import 'package:flutter_appcovid/Config/config.dart';
import 'package:flutter_appcovid/Home/Exercise.dart';
import 'package:flutter_appcovid/Home/homemenu.dart';
import 'package:flutter_appcovid/Widgets/customAppBar.dart';
import 'package:flutter_appcovid/Models/monitoring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appcovid/widgets/myDrawer.dart';

import 'Monitoring.dart';


class AddMonitoring extends StatelessWidget
{
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cDay = TextEditingController();
  final cBloodpre = TextEditingController();
  final cTemp = TextEditingController();
  final cOxyLevel = TextEditingController();
  final cHeartBeat = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()
          {
            if(formKey.currentState.validate())
            {
              final model = MonitoringModel(
                day:  cDay.text,
                bloodpressure: cBloodpre.text,

                oxygenlevel: cOxyLevel.text,
                temperature: cTemp.text,
                heartbeat: cHeartBeat.text,
              ).toJson();

              //add to firestore
              HealthApp.firestore.collection(HealthApp.collectionUser)
                  .document(HealthApp.sharedPreferences.getString(HealthApp.userUID))
                  .collection(HealthApp.subCollectionMonitoring)
                  .document(DateTime.now().millisecondsSinceEpoch.toString())
                  .setData(model)
                  .then((value){
                final snack = SnackBar(content: Text("New Address added successfully."));
                scaffoldKey.currentState.showSnackBar(snack);
                FocusScope.of(context).requestFocus(FocusNode());
                formKey.currentState.reset();
              });

              Route route = MaterialPageRoute(builder: (_) => Monitoring());
              Navigator.pushReplacement(context, route);
            }
          },
          label: Text("Done",style: TextStyle(color:Colors.white),),
          backgroundColor: Colors.pink ,
          icon: Icon(Icons.check,color: Colors.white,),
        ),
        body:
        Container(

          child:SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Add New Monotoring",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        hint: "Day",
                        controller: cDay,
                      ),
                      MyTextField(
                        hint: "Blood Pressure",
                        controller: cBloodpre,
                      ),
                      MyTextField(


                        hint: "Oxygen Level",
                        controller: cOxyLevel,


                      ),
                      MyTextField(
                        hint: "Temperature",
                        controller: cTemp,
                      ),
                      MyTextField(
                        hint: "HeartBeat",
                        controller: cHeartBeat,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

class MyTextField extends StatelessWidget
{
  final String hint;
  final TextEditingController controller;

  MyTextField({Key key, this.hint, this.controller, decoration,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: hint,hintStyle: TextStyle(color:Colors.pink),),
        validator: (val) => val.isEmpty ? "Field can not be empty." : null,
      ),
    );
  }
}



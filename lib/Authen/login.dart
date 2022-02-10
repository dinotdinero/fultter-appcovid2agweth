


import 'package:flutter_appcovid/Config/config.dart';
import 'package:flutter_appcovid/Dialog/ErroDial.dart';
import 'package:flutter_appcovid/Dialog/alertDial.dart';
import 'package:flutter_appcovid/Home/homemenu.dart';
import 'package:flutter_appcovid/widgets/customT.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}





class _LoginState extends State<Login> {
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width,
        _screenHeight = MediaQuery
            .of(context)
            .size
            .height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset("images/login2.png",
                height: 240,
                width: 240,),

            ),
            Padding(padding: EdgeInsets.all(5.0),
              child: Text(
                "Login To Your Account",
                style: TextStyle(color: Colors.black,),

              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [

                  CustomTextField(
                    contr: _emailTextEditingController,
                    image: Icons.email,
                    hintT: "E-mail",
                    iso: false,


                  ),
                  CustomTextField(
                    contr: _passwordTextEditingController,
                    image: Icons.person,
                    hintT: "Password",
                    iso: true,


                  ),

                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () {
                _emailTextEditingController.text.isNotEmpty
                    && _passwordTextEditingController.text.isNotEmpty
                    ? loginUser()
                    : showDialog(
                    context: context,
                    builder: (c) {
                      return ErrorAlertDialog(
                        message: "Please write email and password",);
                    }
                );
              },

              color: Colors.pink,
              child: Text("Login", style: TextStyle(color: Colors.white,),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

          ],
        ),
      ),
    );


  }
  FirebaseAuth _auth = FirebaseAuth.instance;
 void loginUser() async
 {
   showDialog(context: context,
       builder: (c) {
         return LoadingAlertDialog(
           message: "Authenticating, Please wait......",);
       });
   FirebaseUser firebaseUser;
   await _auth.signInWithEmailAndPassword(
     email: _emailTextEditingController.text.trim(),
     password: _passwordTextEditingController.text.trim(),
   ).then((authUser) {
     firebaseUser = authUser.user;
   }).catchError((error) {
     Navigator.pop(context);
     showDialog(
         context: context,
         builder: (c) {
           return ErrorAlertDialog(message: error.message.toString(),);
         });
   });
   if (firebaseUser != null)
     {
       readData(firebaseUser).then((s)
       {
         Navigator.pop(context);
         Route route = MaterialPageRoute(builder: (c) => HomeApp());
         Navigator.pushReplacement(context, route);
       });
     }
 }
 Future readData(FirebaseUser fUser) async
 {
   Firestore.instance.collection("users").document(fUser.uid).get().then((dataSnapshot)
    async {
      await HealthApp.sharedPreferences.setString(HealthApp.userUID, dataSnapshot.data[HealthApp.userUID]);
      await HealthApp.sharedPreferences.setString(HealthApp.userEmail,  dataSnapshot.data[HealthApp.userEmail]);
      await HealthApp.sharedPreferences.setString(HealthApp.userName,  dataSnapshot.data[HealthApp.userName]);
      await HealthApp.sharedPreferences.setString(HealthApp.userAvatarUrl, dataSnapshot.data[HealthApp.userAvatarUrl]);

      List<String> cartList =  dataSnapshot.data[HealthApp.userCartList].cast<String>();
      await HealthApp.sharedPreferences.setStringList(HealthApp.userCartList,["cartList"]);
   });
 }
}
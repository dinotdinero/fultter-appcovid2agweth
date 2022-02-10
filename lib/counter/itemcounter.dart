
import 'package:flutter_appcovid/Config/config.dart';
import 'package:flutter/foundation.dart';


class CartItemCounter extends ChangeNotifier
{
  int _counter = HealthApp.sharedPreferences.getStringList(HealthApp.userCartList).length-1;
  int get count => _counter;

  Future<void> displayResult() async
  {
    int _counter = HealthApp.sharedPreferences.getStringList(HealthApp.userCartList).length-1;

    await Future.delayed(const Duration(milliseconds: 100), (){
      notifyListeners();
    });
  }
}
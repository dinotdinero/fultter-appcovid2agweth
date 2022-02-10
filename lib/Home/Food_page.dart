

import 'package:flutter_appcovid/Models/FoodModel.dart';
import 'package:flutter_appcovid/widgets/customAppBar.dart';
import 'package:flutter_appcovid/widgets/myDrawer.dart';
import 'package:flutter/material.dart';



class FoodPage extends StatefulWidget
{
  final ItemModel itemModel;
  FoodPage({this.itemModel});

  @override
  _FoodPageState createState() => _FoodPageState();
}



class _FoodPageState extends State<FoodPage>
{
  int foodquantityOfItems = 1;

  @override
  Widget build(BuildContext context)
  {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(

        ),

        drawer: MyDrawer(),
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.network(widget.itemModel.thumbnailUrl),
                      ),
                      Container(
                        color: Colors.grey[300],
                        child: SizedBox(
                          height: 1.0,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            widget.itemModel.title,
                            style: boldTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),


                          Text(
                            widget.itemModel.shortInfo.toString(),
                            style: boldTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),


                          Text(
                            widget.itemModel.longDescription.toString(),
                            style: boldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20);

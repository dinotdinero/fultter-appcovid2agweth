import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_appcovid/Config/config.dart';
import 'package:flutter_appcovid/Models/monitoring.dart';
import 'package:flutter_appcovid/counter/changeMonitoring.dart';
import 'package:flutter_appcovid/widgets/customAppBar.dart';
import 'package:flutter_appcovid/widgets/loadWidget.dart';
import 'package:flutter_appcovid/widgets/myDrawer.dart';
import 'package:flutter_appcovid/widgets/wbutton2.dart';

import 'addmonitor.dart';

class Monitoring extends StatefulWidget
{
  final double totalAmount;
  const Monitoring({Key key, this.totalAmount}) : super(key: key);

  @override
  _MonitoringState createState() => _MonitoringState();
}


class _MonitoringState extends State<Monitoring>
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body:
        Container(
        color: Colors.white,
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [






            Consumer<MonitoringChanger>(builder: (context, monitoring, c){
              return Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: HealthApp.firestore
                      .collection(HealthApp.collectionUser)
                      .document(HealthApp.sharedPreferences.getString(HealthApp.userUID))
                      .collection(HealthApp.subCollectionMonitoring).snapshots(),

                  builder: (context, snapshot)
                  {
                    return !snapshot.hasData
                        ? Center(child: circularProgress(),)
                        : snapshot.data.documents.length == 0
                        ? noMonitoringCard()
                        : ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index)
                      {
                        return MonitoringCard(
                          currentIndex: monitoring.counter,
                          value: index,
                          MonitoringId: snapshot.data.documents[index].documentID,
                          totalAmount: widget.totalAmount,
                          model: MonitoringModel.fromJson(snapshot.data.documents[index].data),
                        );
                      },
                    );
                  },
                ),
              );
            }),
          ],

      ),
        ),

        floatingActionButton: FloatingActionButton.extended(
          label: Text("Add New Monitoring",style: TextStyle(color: Colors.white, ),),
          backgroundColor: Colors.pink,
          icon: Icon(Icons.medical_services, color: Colors.white,),
          onPressed: ()
          {
            Route route = MaterialPageRoute(builder: (c) => AddMonitoring());
            Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }

  noMonitoringCard() {
    return Card(
      color: Colors.white,
      child: Container(

        height: 100.0,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_location, color: Colors.pink,),
            Text("No Monitoring has been saved.", style: TextStyle(color: Colors.pink, ),),

          ],
        ),
      ),
    );
  }
}



class MonitoringCard extends StatefulWidget
{
  final MonitoringModel model;
  final String MonitoringId;
  final double totalAmount;
  final int currentIndex;
  final int value;

  MonitoringCard({Key key, this.model, this.currentIndex, this.MonitoringId, this.totalAmount, this.value}) : super(key: key);

  @override
  _MonitoringCardState createState() => _MonitoringCardState();
}

class _MonitoringCardState extends State<MonitoringCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


      return InkWell(


      onTap: ()
      {
        Provider.of<MonitoringChanger>(context, listen: false).displayResult(widget.value);
      },
      child: Card(
        color: Colors.pink,
        child: Column(
          children: [
            Row(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      padding: EdgeInsets.all(10.0),
                      width: screenWidth * 0.8,
                      child: Table(
                        children: [

                          TableRow(
                              children: [
                                KeyText(msg: "Day",),
                                Text(widget.model.day),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Blood Pressure",),
                                Text(widget.model.bloodpressure),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Temperature",),
                                Text(widget.model.temperature),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Oxygen level",),
                                Text(widget.model.oxygenlevel),
                              ]
                          ),

                          TableRow(
                              children: [
                                KeyText(msg: "Heart Beat",),
                                Text(widget.model.heartbeat),
                              ]
                          ),



                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

                 Container(),
          ],
        ),
      ),
    );
  }
}





class KeyText extends StatelessWidget
{
  final String msg;

  KeyText({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
    );
  }
}

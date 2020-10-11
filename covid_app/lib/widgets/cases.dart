import 'package:covidapp/case_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Cases extends StatelessWidget {
  String title;
  Color mycolor;
  String cdata;
  String data;
  Cases(this.title,this.mycolor,this.cdata,this.data);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$title',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: mycolor,
            fontSize: 20,


          ),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
//                data.toString(),
                '$cdata',
                style: TextStyle(
                  fontSize: 16,
                  color:mycolor,
                ),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward,
                color: mycolor,

              ),
              Text('$data',
              style: TextStyle(
                color: mycolor,
                fontSize: 13,
              ),)
            ],
          )

        ],
      ),
    );
  }
}



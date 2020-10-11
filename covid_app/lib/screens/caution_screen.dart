import 'package:flutter/material.dart';
class CautionScreen extends StatelessWidget {
  static const routeName='/cautionscreen';
  Widget cardwidgetbuilder(context,String imageurl,String title ){
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 0.3,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 100,
            width: 100,
            child: Image.asset(imageurl,fit: BoxFit.cover,),
          ),
          Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromRGBO(108, 117, 125, 1),
            ),),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,
        vertical: 20),
        child: ListView(
          children:[
            Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Prevention Tips',style: TextStyle(
                      fontSize: 21,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 7,),
              cardwidgetbuilder(context, 'Assests/images/mask.png','Wear a FaceMask' ),
              SizedBox(height: 5,),
              cardwidgetbuilder(context, 'Assests/images/distance.png','Avoid Close Contacts' ),
              SizedBox(height: 5,),
              cardwidgetbuilder(context, 'Assests/images/wash_hands.png','Wash Hands Regularly' ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(222, 226, 230, 1),
                          Color.fromRGBO(73, 80, 87, 1)
                        ]
                      )
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                          width: 120,
                          height: 120,
                          child: Image.asset('Assests/images/own_test.png')),
                      Column(
                        children:[
                          Text('Query Related To covid-19',
                          style: TextStyle(
                          color: Color.fromRGBO(248, 249, 250, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),
                          SizedBox(height: 5,),
                          Text('Call Helpline:1075',
                            style: TextStyle(
                              color:  Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),),
                      ]),
                    ],
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}

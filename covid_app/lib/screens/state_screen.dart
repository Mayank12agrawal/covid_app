import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_provider.dart';
class StateScreen extends StatelessWidget {
  static const routeName='/state';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Wise Data'),
      ),
        body:
      Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Confirmed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Raleway',
                ),),
                Text('Deaths',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color:Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                  ),),
                Text('Recovered',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                  ),),
                Text('Active',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color:Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                  ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Provider.of<Stateprovider>(context).data(),
              builder: (ctx,snapshot)=>
                  snapshot.connectionState==ConnectionState.waiting?Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ):
                Expanded(
                child: ListView.builder(
                    itemBuilder:(ctx,index)=>
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                        height: 30,
                        color: Color.fromRGBO(206, 212, 218, 1),
                        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                        child: Text(
                        "${snapshot.data[index]['state']}",


                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold
                        ),),
                    alignment: Alignment.center,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${snapshot.data[index]['confirmed']}",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 0, 0, 1),
                        ),),
                        Text("${snapshot.data[index]['deaths']}",
                          style: TextStyle(
                            color: Color.fromRGBO(128, 128, 128, 1),
                          ),),
                        Text("${snapshot.data[index]['recovered']}",
                          style: TextStyle(
                            color: Color.fromRGBO(34, 139, 34, 1),
                          ),),
                        Text("${snapshot.data[index]['active']}",
                          style: TextStyle(
                            color: Color.fromRGBO(65, 105, 225, 1),
                          ),),
                      ],
                    ),

                  ],
                ),
                itemCount: snapshot.data.length,),
              ),
            )
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../widgets/cases.dart';
import '../case_provider.dart';
import '../state_provider.dart';
import '../screens/state_screen.dart';
class HomeScreen extends StatefulWidget {
  static const routeName='/homescreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isloading=false;
  List<Widget> pages;
  @override
  void initState() {
    pages=[
      HomeScreen(),
      StateScreen(),
    ];
    // TODO: implement initState
    setState(() {
      isloading=true;
    });
    Provider.of<CaseProvider>(context,listen: false).fetchCountryData().then((_) {
      setState(() {
        isloading = false;
      });
      Provider.of<Stateprovider>(context,listen: false).data();
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final casedata= Provider.of<CaseProvider>(context,listen: false).getdata;
    return Scaffold(
      appBar:null,
    body: isloading?
    Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,

      ),
    )
        :ListView(

      padding: EdgeInsets.all(10),
      children: [
      Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text("INDIA'S CASES",style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,

        ),),
      ),
      SizedBox(height: 15,),
      Container(
        height: 300,
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 9/8,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
          ),
          padding: EdgeInsets.all(10),
          children: [
            Cases('Total Cases',Color.fromRGBO(255, 0, 0, 1),casedata['totalcases'].toString(),casedata['todaycases'].toString()),
            Cases('Total deaths',Color.fromRGBO(128, 128, 128, 1),casedata['totaldeaths'].toString(),casedata['todaydeaths'].toString()),
            Cases('Active Cases',Color.fromRGBO(65, 105, 225, 1),casedata['activecases'].toString(),''),
            Cases('Recovered',Color.fromRGBO(34, 139, 34, 1),casedata['recovered'].toString(),casedata['todayrecover'].toString()),


          ],

        ),
      ),
        SizedBox(height: 5,),
        ListTile(
          leading: Text('State-Wise Data',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).primaryColor,
              size: 20,),

          ),
          onTap: (){
           Navigator.of(context).pushNamed(StateScreen.routeName);
          },
        )
      ],
    ),
);
  }
}

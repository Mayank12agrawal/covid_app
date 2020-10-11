import 'package:covidapp/screens/caution_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/home_screen.dart';
import '../screens/state_screen.dart';
class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> pages;
  int selectindex=0;
  @override
  void initState() {
    // TODO: implement initState
    pages=[
      HomeScreen(),
      CautionScreen(),
    ];
    super.initState();
  }
  void selectpage(int index)
  {
    setState(() {
      selectindex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 App'),
      ),
      body: pages[selectindex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: Duration(
          milliseconds: 500,
        ),
        color:Color.fromRGBO(233, 236,239, 1) ,
        backgroundColor: Theme.of(context).accentColor,
        buttonBackgroundColor: Color.fromRGBO(222, 226,230, 1),
        items: [
          Icon(Icons.home,size: 30,color: Colors.black,),
          Icon(Icons.description,size: 30,color: Colors.black,),

        ],
        onTap: selectpage,
      ),
    );
  }
}

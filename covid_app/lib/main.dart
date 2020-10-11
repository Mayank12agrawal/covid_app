import 'package:covidapp/screens/tab_screen.dart';

import './case_provider.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './state_provider.dart';
import './screens/state_screen.dart';
import './screens/caution_screen.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(33, 37, 41, .1),
      100:Color.fromRGBO(33, 37, 41, .2),
      200:Color.fromRGBO(33, 37, 41, .3),
      300:Color.fromRGBO(33, 37, 41, .4),
      400:Color.fromRGBO(33, 37, 41, .5),
      500:Color.fromRGBO(33, 37, 41, .6),
      600:Color.fromRGBO(33, 37, 41, .7),
      700:Color.fromRGBO(33, 37, 41, .8),
      800:Color.fromRGBO(33, 37, 41, .9),
      900:Color.fromRGBO(33, 37, 41, 1),
    };
    MaterialColor myColor = MaterialColor(0xFF212529, color);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx)=>CaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx)=>Stateprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'COVID APP',
        home: TabScreen(),
        theme: ThemeData(
          primarySwatch:myColor,
          accentColor: Color.fromRGBO(248, 249, 250, 1),
        ),
        routes: {
          HomeScreen.routeName:(ctx)=>HomeScreen(),
          StateScreen.routeName: (ctx)=>StateScreen(),
          CautionScreen.routeName:(ctx)=>CautionScreen(),
        },
      ),
    );
  }
}



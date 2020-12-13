import 'package:flutter/material.dart';
import 'package:restaurant_app/view/home.dart';
import 'package:restaurant_app/view/restaurant_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryColor: Colors.orange,
        accentColor: Colors.deepOrangeAccent,
        indicatorColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
              restaurants: ModalRoute.of(context).settings.arguments,
            ),
      },
      // home: TestJson(),
    );
  }
}

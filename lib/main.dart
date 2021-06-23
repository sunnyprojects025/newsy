import 'package:flutter/material.dart';
import 'package:newsy/provider/detailsProvider.dart';
import 'package:newsy/screens/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Detailsprovider())],
        child: MaterialApp(
            title: 'Shoppy',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen()));
  }
}

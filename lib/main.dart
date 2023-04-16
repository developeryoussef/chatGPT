import 'package:chatgpt/provider/Provider_Models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Dio/DioHelper/dio helper2.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
  DioHelper.intDio();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_)=>ModelsProvider()),
      ],
      child: MaterialApp(
debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.white),
          primarySwatch: Colors.blue,
        ),
        home:  HomePage(),
      ),
    );
  }
}


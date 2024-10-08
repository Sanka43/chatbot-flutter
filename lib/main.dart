import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
// import 'pages/home_page.dart';

void main() {
  runApp(Chatbot());
}

class Chatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatbot Web System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        // '/home': (context) => HomePage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_miniproject/views/about.dart';
import 'package:flutter_miniproject/views/dashboard.dart';
import 'package:flutter_miniproject/views/home.dart';
import 'package:flutter_miniproject/views/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REATful API : MINI PROJECT',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(title: "Dashboard Menu"),
        '/about': (context) => const AboutPage(title: "About Page"),
        '/profile': (context) => const ProfilePage(title: "Profile Page"),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tolu/screens/dashboard.dart';
import 'package:tolu/screens/login.dart';
import 'package:tolu/screens/welcomepage.dart'; // Import your LoginPage widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eduplay learn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Initial route can be '/' or any other route you prefer
      routes: {
        '/': (context) => const Welcome(), // Set LoginPage as the initial route
        '/dashboard': (context) => const Dashboard(
          selectedAvatar: 'path/to/avatar.png',
          selectedAgeImage: 'path/to/age_image.png',
        ),
        '/login': (context) => const LoginPage(), // Define the '/login' route
      },
      onGenerateRoute: (settings) {
        // Handle unknown routes
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}

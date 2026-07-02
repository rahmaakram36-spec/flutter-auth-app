import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
  await Firebase.initializeApp(options: FirebaseOptions(
  apiKey: "AIzaSyBfgjv5Rg7tWcIrx_ftUndauVAeRyvd3KU",
  authDomain: "first-fb-project-9cb69.firebaseapp.com",
  projectId: "first-fb-project-9cb69",
  storageBucket: "first-fb-project-9cb69.firebasestorage.app",
  messagingSenderId: "10199480631",
  appId: "1:10199480631:web:4a686b0b55e7eb7f02c2b2",
  measurementId: "G-E4C6XV9PS4")); 
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: LoginScreen());
  }
  }
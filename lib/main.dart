// ignore_for_file: prefer_const_constructors
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var option=FirebaseOptions(
    appId: '1:448618578101:web:0b650370bb29e29cac3efc',
    apiKey: 'AIzaSyAgUhHU8wSJgO5MVNy95tMT07NEjzMOfz0',
    projectId: 'react-native-firebase-testing',
    messagingSenderId: '448618578101',
  );
  await Firebase.initializeApp(
    options: option
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ChatScreen();
          }return LoginSignupScreen();
        },
      ),
    );
  }
}
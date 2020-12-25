import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: Auth().user,
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.black),
            // subtitle2: TextStyle(color: Colors.black),
          ),
        ),
        home: Wrapper(),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        debugShowCheckedModeBanner: false,
        //// home: WelcomeScreen(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user != null) {
      print("Wrapper user:${user.email}");
      return ChatScreen();
    } else {
      return WelcomeScreen();
    }
  }
}

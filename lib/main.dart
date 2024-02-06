import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/join_room_screen.dart';
import 'package:tic_tac_toe/screens/main_menu_screen.dart';
import 'package:tic_tac_toe/utilities/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName : (context) => const MainMenuScreen(),
        CreateRoomScreen.routeName : (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName : (context) => const JoinRoomScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}

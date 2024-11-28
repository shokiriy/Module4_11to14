import 'package:flutter/material.dart';
import 'package:four_apps/homework_11/Categories.dart';
import 'package:four_apps/homework_11/Checkkout_ScrollView.dart';
import 'package:four_apps/homework_11/CreditCard.dart';
import 'package:four_apps/homework_11/Vegetables.dart';
import 'package:four_apps/homework_11/item.dart';
import 'package:four_apps/homework_11/models/switch.dart';
import 'package:four_apps/homework_11/splashScreen.dart';
import 'package:four_apps/homework_12/HomeScreen.dart';
import 'package:four_apps/homework_12/Wishlist.dart';
import 'package:four_apps/homework_13/HomeScreen.dart';
import 'package:four_apps/homework_13/OnBoarding.dart';
import 'package:four_apps/homework_14/ChatsScreen.dart';
import 'package:four_apps/homework_14/EditProfile.dart';
import 'package:four_apps/homework_14/FavouritePlaces.dart';
import 'package:four_apps/homework_14/HomeScreen14.dart';
import 'package:four_apps/homework_14/Messages.dart';
import 'package:four_apps/homework_14/Notification.dart';
import 'package:four_apps/homework_14/PopularPackage.dart';
import 'package:four_apps/homework_14/PopularPlaces.dart';
import 'package:four_apps/homework_14/Profile.dart';
import 'package:four_apps/homework_14/ScheduleScreen.dart';
import 'package:four_apps/homework_14/SignIn.dart';
import 'package:four_apps/homework_14/Splash.dart';
import 'package:four_apps/homework_14/ViewScreen14.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Four Apps',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(surface: const Color.fromARGB(255, 233, 232, 232)),
      ),
      home: SplashScreen(),
    );
  }
}

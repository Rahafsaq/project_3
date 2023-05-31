import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3/component/navBar.dart';
import 'package:project_3/pages/firstPage.dart';

import 'model/meal.dart';
import 'model/restaurant.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      isLoggedIn = user != null;
      setState(() {});
    });
    final restaurantCollection = FirebaseFirestore.instance.collection('restaurant');
    for (final res in Data.restaurant) {
      final resDoc = restaurantCollection.doc(res.id);
      resDoc.set(res.toMap());
    }

    for (final meal in Data2.meals) {
      final restaurantCollection = FirebaseFirestore.instance.collection('meal');
      final resDoc = restaurantCollection.doc(meal.id);
      resDoc.set(meal.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    log('isLoggedIn gg $isLoggedIn');
    return MaterialApp(
      home: isLoggedIn ? const NavBar() : const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

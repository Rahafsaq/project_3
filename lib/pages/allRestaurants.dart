import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../component/restaurantCard.dart';
import '../model/restaurant.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({super.key});

  @override
  State<AllRestaurants> createState() => AllRestaurantsState();
}

class AllRestaurantsState extends State<AllRestaurants> {
  List<Restaurant> restaurants = [];
  @override
  void initState() {
    super.initState();

    listenToRestaurants();
  }

  listenToRestaurants() {
    FirebaseFirestore.instance.collection('restaurant').snapshots().listen((collection) {
      List<Restaurant> newList = [];
      for (final doc in collection.docs) {
        final restaurant = Restaurant.fromMap(doc.data());
        newList.add(restaurant);
      }

      restaurants = newList;
      setState(() {});
    });
  }

  Future<List<Restaurant>> getRestaurants() async {
    final collection = await FirebaseFirestore.instance.collection('restaurant').get();
    List<Restaurant> newList = [];
    for (final doc in collection.docs) {
      final restaurant = Restaurant.fromMap(doc.data());
      newList.add(restaurant);
    }

    return newList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_sharp, size: 18, color: Color(0xff59d8ed)),
        ),
        title: Center(
          child: Column(
            children: [
              const Text(
                'All Restaurants & Stores',
                style: TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Deliver to',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: Color(0xff59d8ed), fontSize: 15),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xff59d8ed)),
                ],
              ),
            ],
          ),
        ),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.search_outlined, size: 30, color: Color(0xff59d8ed)),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            for (final restaurant in restaurants)
              Padding(
                padding: const EdgeInsets.all(12),
                child: RestaurantCard(
                  restaurant: restaurant,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ]),
      backgroundColor: const Color(0xffedeef2),
    );
  }
}

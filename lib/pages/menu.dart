import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_3/model/meal.dart';

import '../component/menuCard.dart';
import '../model/restaurant.dart';

class Menu extends StatefulWidget {
  const Menu({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Meal> meals = [];
  @override
  void initState() {
    super.initState();

    listenToRestaurants();
  }

  listenToRestaurants() {
    FirebaseFirestore.instance.collection('meal').snapshots().listen((collection) {
      List<Meal> newList = [];
      for (final doc in collection.docs) {
        final meal = Meal.fromMap(doc.data());
        newList.add(meal);
      }

      meals = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(children: [
            Image.network(
              widget.restaurant.imageUrl,
              width: 500,
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Dellverey location',
                              style: TextStyle(color: Color(0xff184973), fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6, left: 4),
                              child: Row(
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
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff59d8ed),
                                    size: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.drive_eta_outlined,
                          color: Color(0xff59d8ed),
                        ),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'SAR 12.00',
                                  style: TextStyle(
                                      color: Color(0xff184973),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'SAR 5.00',
                                  style: TextStyle(color: Color(0xff184973), fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 6, left: 8),
                              child: Text(
                                'Minimum order SAR 74',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Menu',
              style: TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            for (final meals in meals) ...[
              if (widget.restaurant.id == meals.resId) ...[
                MenuCard(
                  meals: meals,
                  restaurant: widget.restaurant,
                ),
                const SizedBox(
                  height: 16,
                ),
              ]
            ]
          ]),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../component/trackOrderCard.dart';
import '../model/meal.dart';
import 'orderHistory.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  List<Meal> cartmeals = [];
  @override
  void initState() {
    super.initState();

    listenToRestaurants();
  }

  listenToRestaurants() {
    FirebaseFirestore.instance.collection('cart').snapshots().listen((collection) {
      List<Meal> newList = [];
      for (final doc in collection.docs) {
        final meal = Meal.fromMap(doc.data());
        newList.add(meal);
      }

      cartmeals = newList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff184973),
            ),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () {
                  final navigator = Navigator.of(context);
                  navigator.push(MaterialPageRoute(builder: (context) => const OrderHistory()));
                },
                child: const Text(
                  'History',
                  style: TextStyle(color: Color(0xff59d8ed), fontSize: 20),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 500,
                  width: 480,
                  padding: const EdgeInsets.all(16),
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.delivery_dining_outlined),
                          SizedBox(
                            width: 12,
                          ),
                          Text('Delivery'),
                        ],
                      ),
                      const TrackOrderCard(),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.0,
                              child: TimelineNode.simple(
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                              child: DashedLineConnector(
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                              child: TimelineNode.simple(
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                              child: DashedLineConnector(
                                color: Colors.grey,
                              ),
                            ),
                            const OutlinedDotIndicator(
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20.0,
                              child: DashedLineConnector(
                                color: Colors.grey,
                              ),
                            ),
                            const OutlinedDotIndicator(
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20.0,
                              child: DashedLineConnector(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Center(
                          child: Text('Preparing your order',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text('Order Total SAR 35', style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Icon(
                            Icons.apple_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            'Apple pay',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xffedeef2),
    );
  }
}

// class Orders {
//   final List<Meal> meals;

//   const Orders({
//     required this.meals,
//   });
// }

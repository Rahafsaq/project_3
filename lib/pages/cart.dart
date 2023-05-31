import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_3/model/meal.dart';
import 'package:project_3/pages/checkout.dart';

import '../component/cartCard.dart';

class Cart extends StatefulWidget {
  const Cart(
      {super.key, //required this.restaurant,
      required this.meals});
  // final Restaurant restaurant;
  final Meal meals;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Meal> cartMeals = [];
  StreamSubscription? subscription;
  @override
  void initState() {
    super.initState();

    subscription ??= FirebaseFirestore.instance.collection('cart').snapshots().listen((collection) {
      List<Meal> newList = [];
      for (final doc in collection.docs) {
        final meal = Meal.fromMap(doc.data());
        newList.add(meal);
      }

      cartMeals = newList;
      setState(() {});
    });
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
                'Cart',
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
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'cart Item',
                        style: TextStyle(color: Color(0xff184973), fontSize: 20),
                      ),
                    ),
                    for (final meals in cartMeals)
                      CartCard(
                        meals: meals,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.white),
            height: 120,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      'SAR ${widget.meals.price}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Checkout(
                                  meals: widget.meals,
                                )),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00b0e1),
                        shape: const StadiumBorder(),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Deliver to me',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xff00b0e1),
                        ),
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Deliver to friend',
                        style: TextStyle(color: Color(0xff00b0e1), fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffedeef2),
    );
  }
}

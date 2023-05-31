import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_3/model/meal.dart';
import 'package:project_3/pages/cart.dart';

import '../model/restaurant.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.restaurant, required this.meals});
  final Restaurant restaurant;
  final Meal meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(width: 500, height: 250, child: Image.network(meals.imageUrl, fit: BoxFit.fitWidth)),
        Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 234, 233, 233), borderRadius: BorderRadius.all(Radius.circular(12))),
            height: 200,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(meals.name,
                      style: const TextStyle(color: Color(0xff184973), fontWeight: FontWeight.bold, fontSize: 25)),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Text('from', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 2),
                    Text(restaurant.name, style: const TextStyle(color: Color(0xff59d8ed)))
                  ])
                ]))),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Item Price'),
                  const Spacer(),
                  Text(
                    'SAR ${meals.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 234, 233, 233),
                      border: Border.fromBorderSide(BorderSide()),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: 120,
                    height: 25,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                      Icon(Icons.add),
                      SizedBox(width: 10),
                      Text('1'),
                      SizedBox(width: 10),
                      Icon(Icons.remove),
                    ]),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('cart').doc(meals.id).set(meals.toMap());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00b0e1),
                      shape: const StadiumBorder(),
                      minimumSize: const Size(300, 35),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Cart(meals: meals))));
        },
        child: const Icon(Icons.shopping_bag_outlined, color: Color(0xff184973)),
      ),
    );
  }
}

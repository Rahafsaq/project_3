import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../model/restaurant.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.meals,
  });
  final Meal meals;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 100, height: 100, child: Image.network(meals.imageUrl, fit: BoxFit.cover)),
              const SizedBox(
                width: 12,
              ),
              Text(
                meals.name,
                style: const TextStyle(color: Color(0xff59d8ed), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Edit options',
            style: TextStyle(
              color: Color(0xff59d8ed),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 234, 233, 233),
                      border: Border.fromBorderSide(BorderSide()),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 90,
                  height: 32,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('1'),
                    SizedBox(width: 10),
                    Icon(Icons.remove)
                  ])),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  FirebaseFirestore.instance.collection('cart').doc(meals.id).delete();
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(
                    color: Color(0xff59d8ed),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'SAR ${meals.price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

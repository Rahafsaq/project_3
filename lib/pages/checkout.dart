import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_3/component/navBar.dart';
import 'package:project_3/model/meal.dart';

import '../component/checkoutCard.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required this.meals});
  final Meal meals;
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
  void dispose() {
    subscription?.cancel();
    super.dispose();
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
        title: const Center(
          child: Text(
            'Checkout',
            style: TextStyle(color: Color(0xff184973), fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Expanded(
          child: ListView(children: [
            Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration:
                        const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                    width: 480,
                    height: 180,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Payment method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Row(children: const [
                        Icon(Icons.apple_outlined),
                        SizedBox(width: 12),
                        Text('Apple pay', style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      ]),
                      const SizedBox(height: 12),
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(color: Color(0xfff5fdff)),
                          width: 400,
                          height: 60,
                          child: Row(children: const [
                            Icon(Icons.error_outline_outlined, color: Color(0xff59d8ed)),
                            SizedBox(width: 12),
                            Text(
                              'You will be able to complete the payment once Rep is assigned',
                              style: TextStyle(color: Color(0xff59d8ed), fontSize: 13),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                  width: 480,
                  height: 330,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Delivery location', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(children: const [
                      Text('Home', style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ]),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 380,
                        height: 180,
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMJxUfTJMIJLBiSSz4B2d6SdWvE31Ymo_Vaw&usqp=CAU',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                  width: 480,
                  height: 100,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Promo code', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(children: [
                      const Text('Add promo code', style: TextStyle(color: Colors.grey, fontSize: 16)),
                      const Spacer(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff00b0e1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        width: 50,
                        height: 25,
                        child: const Center(child: Text('Apply', style: TextStyle(color: Colors.white, fontSize: 12))),
                      ),
                    ]),
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                for (final meals in cartMeals)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CheckoutCard(
                      meals: meals,
                    ),
                  ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                  width: 480,
                  height: 100,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Delivery time', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(children: const [
                      Text('Now', style: TextStyle(color: Colors.black, fontSize: 16)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ]),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text('SAR ${widget.meals.price}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (Context) => SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const SizedBox(height: 30),
                          const Text(
                            'Order Confirmation',
                            style: TextStyle(color: Color(0xff184973), fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Please confirm to proceed and note that',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const Text(
                            'canceling after order placed may not be possible.',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          Row(children: [Column(children: const [])]),
                          Row(children: [
                            const Icon(Icons.money_outlined, color: Color(0xff184973)),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const Text(' Total', style: TextStyle(color: Colors.grey)),
                              const SizedBox(width: 12),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  'SAR ${widget.meals.price}',
                                  style: const TextStyle(color: Color(0xff184973), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                          ]),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Icon(Icons.timer_outlined, color: Color(0xff184973)),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                              Text(' ETA', style: TextStyle(color: Colors.grey)),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text(
                                  '37 - 46 MIN',
                                  style: TextStyle(color: Color(0xff184973), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                          ]),
                          const SizedBox(height: 24),
                          Center(
                            child: Column(children: [
                              ElevatedButton(
                                onPressed: () {
                                  final order = Order(meals: cartMeals);
                                  FirebaseFirestore.instance.collection('order').add(order.toMap());
                                  for (final meal in cartMeals) {
                                    FirebaseFirestore.instance.collection('cart').doc(meal.id).delete();
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: ((context) => const NavBar())),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff00b0e1),
                                  shape: const StadiumBorder(),
                                  minimumSize: const Size(400, 55),
                                ),
                                child: const Text('confirm order', style: TextStyle(fontSize: 18)),
                              ),
                            ]),
                          ),
                        ]),
                      ),
                    ),
                    isScrollControlled: true,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00b0e1),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(400, 50),
                ),
                child: const Text(
                  'Place order',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ]),
      backgroundColor: const Color(0xffedeef2),
    );
  }
}

class Order {
  final List<Meal> meals;

  const Order({
    required this.meals,
  });

  Map<String, dynamic> toMap() {
    return {
      'meals': meals.map((m) => m.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      meals: (map['meals'] as List).map((e) => Meal.fromMap(e)).toList(),
    );
  }
}

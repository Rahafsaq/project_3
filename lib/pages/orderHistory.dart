import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:flutter/material.dart';
import 'package:project_3/component/checkoutCard.dart';

import 'checkout.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrdersState();
}

class _OrdersState extends State<OrderHistory> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('order').get().then((collection) {
      final docs = collection.docs;

      for (final doc in docs) {
        final data = doc.data();
        final orderFromData = Order.fromMap(data);
        orders.add(orderFromData);
      }
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
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Color(0xff59d8ed),
            size: 18,
          ),
        ),
        title: const Center(
          child: Text(
            'Orders History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff184973),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          for (final order in orders) OrderCard(order: order),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OrderPage(order: order);
          }));
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Text(
                  'Number Of Item:',
                  style: TextStyle(fontSize: 20, color: Color(0xff184973)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  order.meals.length.toString(),
                  style: const TextStyle(fontSize: 20, color: Color(0xff184973)),
                ),
              ],
            ),
          ),
        ));
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Color(0xff59d8ed),
            size: 18,
          ),
        ),
        title: const Center(
          child: Text(
            'Orders ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff184973),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (final meal in order.meals)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CheckoutCard(meals: meal),
                  ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00b0e1),
              shape: const StadiumBorder(),
              minimumSize: const Size(400, 55),
            ),
            child: const Text(
              'Order Agian',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

// class Order {
//   final List<Meal> meals;

//   const Order({
//     required this.meals,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'meals': meals.map((m) => m.toMap()).toList(),
//     };
//   }

//   factory Order.fromMap(Map<String, dynamic> map) {
//     return Order(
//       meals: (map['meals'] as List).map((e) => Meal.fromMap(e)).toList(),
//     );
//   }
// }

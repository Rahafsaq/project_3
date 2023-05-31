import 'package:flutter/material.dart';
import 'package:project_3/model/meal.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
    required this.meals,
  }) : super(key: key);

  final Meal meals;
  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
      width: 480,
      height: 130,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Available items', style: TextStyle(color: Color(0xff90cd99), fontSize: 20)),
        ListTile(
          title: Text(widget.meals.name),
          subtitle: Text('SAR ${widget.meals.price}'),
          trailing: SizedBox(width: 80, height: 140, child: Image.network(widget.meals.imageUrl, fit: BoxFit.cover)),
        ),
      ]),
    );
  }
}

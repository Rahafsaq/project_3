import 'package:flutter/material.dart';
import 'package:project_3/model/restaurant.dart';
import 'package:project_3/pages/meal_Details.dart';

import '../model/meal.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({
    super.key,
    required this.meals,
    required this.restaurant,
  });

  final Meal meals;
  final Restaurant restaurant;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          final navigator = Navigator.of(context);
          navigator.push(
            MaterialPageRoute(
              builder: (context) => MealDetails(restaurant: widget.restaurant, meals: widget.meals),
            ),
          );
        },
        child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 234, 233, 233), borderRadius: BorderRadius.all(Radius.circular(12))),
            child: ListTile(
                title: Text(widget.meals.name,
                    style: const TextStyle(color: Color(0xff184973), fontWeight: FontWeight.bold)),
                subtitle: Row(children: [
                  Container(
                      decoration: const BoxDecoration(
                          border: Border.fromBorderSide(BorderSide(color: Color(0xff59d8ed))),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 90,
                      height: 25,
                      child: Center(
                          child: Text('SAR ${widget.meals.price}', style: const TextStyle(color: Color(0xff59d8ed))))),
                  const SizedBox(width: 12),
                  const Icon(Icons.favorite_outline, color: Color(0xff59d8ed))
                ]),
                trailing:
                    SizedBox(width: 80, height: 140, child: Image.network(widget.meals.imageUrl, fit: BoxFit.cover)))),
      ),
    );
  }
}

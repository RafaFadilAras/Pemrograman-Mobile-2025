import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widget/item_card.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item('Rice', 15000, 'images/rice.png', 'High-quality premium rice for daily meals'),
    Item('Sugar', 13000, 'images/sugar.png', 'Natural sweet sugar'),
    Item('Milk', 19000, 'images/milk.png', 'Nutritious fresh cow milk'),
    Item('Bread', 14000, 'images/bread.png', 'Soft and fresh daily bread'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemCard(item: items[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue[100],
            child: const Text(
              "Nama: Rafa Fadil Aras | NIM: 2341720007",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
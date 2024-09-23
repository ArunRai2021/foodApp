import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  final List<dynamic> productUnit;
  final Function(String) onUnitSelected;

  const ProductUnit(
      {super.key, required this.productUnit, required this.onUnitSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(productUnit.length, (index) {
      return ListTile(
        leading: const Icon(Icons.photo),
        title: Text(productUnit[index]),
        onTap: () {
          onUnitSelected(productUnit[index]);
          Navigator.pop(context);
        },
      );
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/widget/search_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text("Total Amount"),
        subtitle: Text(
          "\$ 170.00",
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
            child: const Text("Submit"),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Review Cart"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

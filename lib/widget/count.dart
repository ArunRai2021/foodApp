import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  bool activeAddButton = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: activeAddButton
          ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    count == 1
                        ? setState(() {
                            activeAddButton = false;
                          })
                        : setState(() {
                            count--;
                          });
                    ;
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 15,
                    color: Color(0xffd0b84c),
                  ),
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xffd0b84c)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Color(0xffd0b84c),
                  ),
                )
              ],
            )
          : Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeAddButton = true;
                  });
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
    ));
  }
}

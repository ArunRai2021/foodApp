import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final VoidCallback? onTap;
  final String productPrice;

  const SingleProduct(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 240,
        width: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Image.network(
                  productImage,
                  height: 150,
                  width: 150,
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text("$productPrice\$/50 Gram"),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "50 Gram",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.remove,
                              size: 15,
                              color: Color(0xffd0b84c),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffd0b84c)),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xffd0b84c),
                            )
                          ],
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

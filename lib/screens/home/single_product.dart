import 'package:flutter/material.dart';
import 'package:food_app/widget/count.dart';
import 'package:food_app/widget/product_unit.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final VoidCallback? onTap;
  String productPrice;
  final String productId;
  final List<dynamic>? productUnit;

  SingleProduct(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId,
      this.onTap,
      this.productUnit});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  String selectedUnit = "Select";

  void _onUnitSelected(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
                  widget.productImage,
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
                    widget.productName,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text("${widget.productPrice}\$/50 Gram"),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ProductUnit(
                                  productUnit: widget.productUnit!.toList(),
                                  onUnitSelected: _onUnitSelected,
                                );
                              });
                        },
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedUnit,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Count(
                        productPrice: widget.productPrice,
                        productName: widget.productName,
                        productImage: widget.productImage,
                        productId: widget.productId,
                        productUnit: selectedUnit,
                      )
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

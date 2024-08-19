import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  String? productName;
  String? productImage;
  String? productId;
  String? productPrice;

  Count({
    super.key,
    this.productPrice,
    this.productName,
    this.productImage,
    this.productId,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  bool activeAddButton = false;
  int count = 0;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = value.get("cartQuantity");
                        activeAddButton = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
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
                    if (count == 1) {
                      setState(() {
                        activeAddButton = false;
                      });
                      reviewCartProvider.reviewCardDataDelete(widget.productId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartQuantity: count,
                          cartPrice: widget.productPrice,
                          cartName: widget.productName);
                    }
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
                    reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count);
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
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                  );
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/wish_list_provider.dart';
import 'package:food_app/screens/reviewCart/review_cart.dart';
import 'package:food_app/widget/count.dart';
import 'package:provider/provider.dart';

enum SigninCharacter { fill, outline }

class ProductOverView extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productId;

  const ProductOverView({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
  });

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  SigninCharacter _charecter = SigninCharacter.fill;

  Widget bottomNavigationBar({
    required Color iconColor,
    required Color backGroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    final VoidCallback? onTap,
  }) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: backGroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: color),
              ),
            )
          ],
        ),
      ),
    ));
  }

  bool wishListBool = false;

  /// getWishListBool are here...
  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishListCart")
        .doc(widget.productId)
        .get()
        .then((value) {
      if (mounted) {
        if (value.exists) {
          setState(() {
            wishListBool = value.get("wishList");
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              iconColor: Colors.grey,
              backGroundColor: textColor,
              color: Colors.white70,
              title: wishListBool == false
                  ? "Add To WishList"
                  : "Added To wishList",
              iconData: wishListBool == false
                  ? Icons.favorite_border_outlined
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                      wishListId: widget.productId,
                      wishListImage: widget.productImage,
                      wishListPrice: int.parse(widget.productPrice.toString()),
                      wishListName: widget.productName,
                      wishListQuantity: 2);
                } else {
                  wishListProvider.deleteWishList(widget.productId);
                }
              }),
          bottomNavigationBar(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ReviewCart();
                }));
              },
              iconColor: Colors.white70,
              backGroundColor: primaryColor,
              color: textColor,
              title: "Go To Cart",
              iconData: Icons.shop_outlined)
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("\$${widget.productPrice}"),
                    ),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.all(40),
                      child: Image.network(widget.productImage
                          // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZYMERhGW1ln0NlWMh3H3xgDRVc5jP07MmTg&s"
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        "Available Options",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green[700],
                          ),
                          Radio(
                              value: SigninCharacter.fill,
                              groupValue: _charecter,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _charecter = value!;
                                });
                              }),
                          const Text("\$50"),
                          SizedBox(
                            height: 35,
                            width: 100,
                            child: Count(
                              productPrice: widget.productPrice,
                              productName: widget.productName,
                              productImage: widget.productImage,
                              productId: widget.productId,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About This Product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "n marketing, a product is an object, or system, or service made available for consumer use as of the consumer demand; it is anything that can be offered to a market to satisfy the desire or need of a customer",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

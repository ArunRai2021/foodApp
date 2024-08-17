import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

enum SigninCharacter { fill, outline }

class ProductOverView extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPrice;

  const ProductOverView(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  SigninCharacter _charecter = SigninCharacter.fill;

  Widget bottomNavigationBar(
      {required Color iconColor,
      required Color backGroundColor,
      required Color color,
      required String title,
      required IconData iconData}) {
    return Expanded(
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
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
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
              title: "Add To WishList",
              iconData: Icons.favorite_border_outlined),
          bottomNavigationBar(
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
              child: Container(
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
                          Row(
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
                                  })
                            ],
                          ),
                          const Text("\$50"),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 17,
                                  color: primaryColor,
                                ),
                                Text(
                                  "Add",
                                  style: TextStyle(color: primaryColor),
                                )
                              ],
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

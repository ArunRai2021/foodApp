import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/widget/count.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String? productImage;
  String? productName;
  String? productPrice;
  String? productId;
  int? productQuantity;
  bool? isWishList = false;
  Function()? onDelete;
  var productUnit;

  SingleItem(
      {super.key,
      required this.isBool,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.productQuantity,
      this.isWishList,
      this.onDelete,
      this.productUnit});

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  int count = 0;

  getCount() {
    setState(() {
      count = widget.productQuantity!;
    });
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCardProvider = Provider.of(context);
    reviewCardProvider.getReviewCarData();
    return Row(
      children: [
        // product Image are here..
        Expanded(
          child: SizedBox(
            height: 100,
            child: Center(
              child: Image.network(
                widget.productImage.toString(),
                width: 80,
                height: 80,
              ),
            ),
          ),
        ),

        /// row second element are here we show the in column productName rs anf quantity,
        Expanded(
            child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        Text(
                          "${widget.productPrice.toString()} Rs",
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    widget.isBool
                        ? Text(widget.productUnit)
                        : GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      children: <Widget>[
                                        ListTile(
                                          title: const Text("100 gram"),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("500 gram"),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("50 gram"),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("80 gram"),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("120 gram"),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  const Text(
                                    "50 Gram",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: primaryColor,
                                  )
                                ],
                              ),
                            ),
                          )
                  ],
                ))),
        widget.isBool
            ? Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: widget.onDelete,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.isWishList == false
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.grey)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      if (count == 1) {
                                        Fluttertoast.showToast(
                                            msg: "You Reach Minimum Limit");
                                      } else {
                                        setState(() {
                                          count--;
                                        });
                                        reviewCardProvider.updateReviewCartData(
                                            cartName: widget.productName,
                                            cartPrice: widget.productPrice,
                                            cartImage: widget.productImage,
                                            cartId: widget.productId,
                                            cartQuantity: count);
                                      }
                                    },
                                    child: const Icon(Icons.remove)),
                                Text(count.toString()),
                                GestureDetector(
                                    onTap: () {
                                      if (count < 10) {
                                        setState(() {
                                          count++;
                                        });
                                      }
                                      reviewCardProvider.updateReviewCartData(
                                          cartQuantity: count,
                                          cartId: widget.productId,
                                          cartImage: widget.productImage,
                                          cartPrice: widget.productPrice,
                                          cartName: widget.productName);
                                    },
                                    child: const Icon(Icons.add))
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            : Count()
      ],
    );
  }
}

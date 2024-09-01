import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String? productImage;
  String? productName;
  String? productPrice;
  String? productId;
  int? productQuantity;
  bool? isWishList = false;
  Function()? onDelete;

  SingleItem(
      {super.key,
      required this.isBool,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.productQuantity,
      this.isWishList,
      this.onDelete});

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
                productImage.toString(),
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
                          productName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        Text(
                          "${productPrice.toString()} Rs",
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    isBool
                        ? const Text("50 Gram")
                        : Container(
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          )
                  ],
                ))),
        isBool
            ? Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: onDelete,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    isWishList == false
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.grey)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.remove),
                                Text("1"),
                                Icon(Icons.add)
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            : Expanded(
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      "+ Add",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ))),
              )
      ],
    );
  }
}

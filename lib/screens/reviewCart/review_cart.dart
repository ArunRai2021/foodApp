import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/model/review_cart_model.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/screens/check_out/delievery_detail/deleivery_detail.dart';
import 'package:food_app/widget/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  ReviewCart({super.key});

  ReviewCartProvider reviewCartProvider = ReviewCartProvider();

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("No"));
    Widget continueButton = TextButton(
        onPressed: () {
          reviewCartProvider.reviewCardDataDelete(delete.cartId);
          Navigator.of(context).pop();
        },
        child: const Text("Yes"));
    AlertDialog alert = AlertDialog(
      title: const Text("Cart Product"),
      content: const Text("Are You Delete on Cart Product"),
      actions: [cancelButton, continueButton],
    );
    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCarData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text("Total Amount"),
        subtitle: Text(
          "\$${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const DeleiveryDetail();
              }));
            },
            child: const Text("Submit"),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Review Cart"),
      ),
      body: reviewCartProvider.getReviewCardDataList.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCardDataList.length,
              itemBuilder: (BuildContext context, int index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCardDataList[index];
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      isWishList: false,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      productUnit: data.cartUnit,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}

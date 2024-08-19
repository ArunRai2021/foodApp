import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/model/review_cart_model.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/widget/search_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCarData();
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
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                    ),
                  ],
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/providers/wish_list_provider.dart';
import 'package:food_app/widget/single_item.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  WishList({super.key});

  WishListProvider wishListProvider = WishListProvider();

  showAlertDialog(BuildContext context, ProductModel delete) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("No"));
    Widget continueButton = TextButton(
        onPressed: () {
          wishListProvider.deleteWishList(delete.productId);
          Navigator.of(context).pop();
        },
        child: const Text("Yes"));
    AlertDialog alert = AlertDialog(
      title: const Text("WishList Product"),
      content: const Text("Are You Delete on wishList Product"),
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
    WishListProvider wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();

    // reviewCartProvider.getReviewCarData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("wishList"),
      ),
      body: wishListProvider.getWishList.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: wishListProvider.getWishList.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel data = wishListProvider.getWishList[index];
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      isWishList: true,
                      productImage: data.productImage,
                      productName: data.productName,
                      productPrice: data.productPrice.toString(),
                      productId: data.productId,
                      productQuantity: data.productQuantity,
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

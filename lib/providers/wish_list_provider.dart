import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/model/product_model.dart';

class WishListProvider with ChangeNotifier {
  List<ProductModel> wishList = [];

  /// add wishListData method are here..
  void addWishListData(
      {String? wishListId,
      String? wishListName,
      String? wishListImage,
      int? wishListPrice,
      int? wishListQuantity}) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishListCart")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishList": true
    });
  }

  /// get wish ListData method are here..
  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishListCart")
        .get();
    for (var element in value.docs) {
      ProductModel productModel = ProductModel(
        productId: element.get("wishListId"),
        productPrice: element.get("wishListPrice"),
        productName: element.get("wishListName"),
        productImage: element.get("wishListImage"),
        productQuantity: element.get("wishListQuantity"),
      );
      newList.add(productModel);
    }
    wishList = newList;
    notifyListeners();
  }

  /// get wishList Data;
  List<ProductModel> get getWishList {
    return wishList;
  }

  /// delete wishList method are here...
  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishListCart")
        .doc(wishListId)
        .delete();
    notifyListeners();
  }
}

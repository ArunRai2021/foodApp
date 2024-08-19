import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    int? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true,
    });
  }

  void updateReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    int? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdd": true,
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];

  void getReviewCarData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    for (var element in reviewCartValue.docs) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get("cartId"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"));
      newList.add(reviewCartModel);
    }
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCardDataList {
    return reviewCartDataList;
  }

  void reviewCardDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}

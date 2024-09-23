import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:food_app/model/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    User? currentUser,
    String? userName,
    String? userEmail,
    String? userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser?.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userId": currentUser?.uid,
    });
  }

  // get user data
  UserModel? currentData;

  void getUserData() async {
    var value = await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (value.exists) {
      currentData = UserModel(
          userEmail: value.get("userEmail"),
          userImage: value.get("userImage"),
          userName: value.get("userName"),
          userUid: value.get("userId"));
    } else {
      currentData = null;
    }
    notifyListeners();
  }

  // getter
  UserModel? get currentUserData {
    return currentData;
  }
}

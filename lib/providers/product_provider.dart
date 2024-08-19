import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  List<ProductModel> freshFruitList = [];
  List<ProductModel> rootVegiTable = [];
  late ProductModel productModel;
  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    );

    search.add(productModel);
  }

  /// herbsProduct Method are here
  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    for (var element in value.docs) {
      productModels(element);
      newList.add(productModel);
    }
    herbsProductList = newList;
    notifyListeners();
  }

  /// getHerbs ProductList are here
  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  /// fetchFreshFruit Product Method are here..
  fetchFreshFruit() async {
    List<ProductModel> newFruitList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FreshFruits").get();
    for (var element in value.docs) {
      productModels(element);
      newFruitList.add(productModel);
    }
    freshFruitList = newFruitList;
    notifyListeners();
  }

  /// getFreshFruitList are here..
  List<ProductModel> get getFreshFruitList {
    return freshFruitList;
  }

  /// Root vegitables are here
  fetchRootVegitable() async {
    List<ProductModel> vegiList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("RootVegitable").get();
    for (var element in value.docs) {
      productModels(element);
      vegiList.add(productModel);
    }
    rootVegiTable = vegiList;
    notifyListeners();
  }

  /// getRoot Vegitable List are here..
  List<ProductModel> get getrootVegiTable {
    return rootVegiTable;
  }

  /// Search Return
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}

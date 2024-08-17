import 'package:flutter/material.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/widget/search_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;

  const Search({super.key, required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  List<ProductModel> searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName!.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        actions: const [Icon(Icons.menu_rounded)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
              title: Text("Items:"),
            ),
            SizedBox(
              height: 52,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    fillColor: const Color(0xffc2c2c2),
                    filled: true,
                    hintText: "Search for item in the store",
                    hintStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w600),
                    suffixIcon: const Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _searchItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleItem(
                      isBool: false,
                      productImage: _searchItem[index].productImage,
                      // widget.search[index].productImage,
                      productName: _searchItem[index].productName,
                      // widget.search[index].productName,
                      productPrice: _searchItem[index].productPrice.toString(),
                      // widget.search[index].productPrice.toString(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

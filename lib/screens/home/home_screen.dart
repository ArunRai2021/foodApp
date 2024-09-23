import 'package:flutter/material.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/ProductOverView/product_overview.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/home/single_product.dart';
import 'package:food_app/screens/reviewCart/review_cart.dart';
import 'package:food_app/screens/search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  /// this widget is herbs widget we call on after upper container
  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Herbs Seasoning",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Search(
                      search: productProvider.getHerbsProductDataList,
                    );
                  }));
                },
                child: const Text(
                  "View All",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                productProvider.getHerbsProductDataList.map((herbsProductData) {
              return SingleProduct(
                productId: herbsProductData.productId.toString(),
                productImage: herbsProductData.productImage.toString(),
                productName: herbsProductData.productName.toString(),
                productPrice: herbsProductData.productPrice.toString(),
                productUnit: herbsProductData.productUnit,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ProductOverView(
                      productName: herbsProductData.productName.toString(),
                      productImage: herbsProductData.productImage.toString(),
                      productPrice: herbsProductData.productPrice.toString(),
                      productId: herbsProductData.productId.toString(),
                    );
                  }));
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Fresh Fruits",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Search(search: productProvider.getFreshFruitList);
                  }));
                },
                child: const Text(
                  "View All",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(productProvider.getFreshFruitList.length,
                  (index) {
            return SingleProduct(
              productId:
                  productProvider.getFreshFruitList[index].productId.toString(),
              productImage: productProvider
                  .getFreshFruitList[index].productImage
                  .toString(),
              productName: productProvider.getFreshFruitList[index].productName
                  .toString(),
              productPrice: productProvider
                  .getFreshFruitList[index].productPrice
                  .toString(),
              productUnit: productProvider.getFreshFruitList[index].productUnit,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ProductOverView(
                    productName: productProvider
                        .getFreshFruitList[index].productName
                        .toString(),
                    productImage: productProvider
                        .getFreshFruitList[index].productImage
                        .toString(),
                    productPrice: productProvider
                        .getFreshFruitList[index].productPrice
                        .toString(),
                    productId: productProvider
                        .getFreshFruitList[index].productId
                        .toString(),
                  );
                }));
              },
            );
          })),
        )
      ],
    );
  }

  Widget _buildRootProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Root Vegetable",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Search(search: productProvider.getrootVegiTable);
                  }));
                },
                child: const Text(
                  "View All",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(productProvider.getrootVegiTable.length,
                  (index) {
            return SingleProduct(
              productId:
                  productProvider.getrootVegiTable[index].productId.toString(),
              productImage: productProvider.getrootVegiTable[index].productImage
                  .toString(),
              productName: productProvider.getrootVegiTable[index].productName
                  .toString(),
              productPrice: productProvider.getrootVegiTable[index].productPrice
                  .toString(),
              productUnit: productProvider.getrootVegiTable[index].productUnit,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ProductOverView(
                    productName: productProvider
                        .getrootVegiTable[index].productName
                        .toString(),
                    productImage: productProvider
                        .getrootVegiTable[index].productImage
                        .toString(),
                    productPrice: productProvider
                        .getrootVegiTable[index].productPrice
                        .toString(),
                    productId: productProvider.getrootVegiTable[index].productId
                        .toString(),
                  );
                }));
              },
            );
          })),
        )
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFreshFruit();
    productProvider.fetchRootVegitable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider? userProvider = Provider.of(context);
    userProvider?.getUserData();
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xffd4d181),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 17,
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Search(
                    search: productProvider.search,
                  );
                }));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ReviewCart();
                }));
              },
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xffd4d181),
                child: Icon(
                  Icons.shop,
                  size: 17,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
        backgroundColor: const Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            /// upper Image are here..
            Container(
              height: 150,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSel7zJCCRNU-JrttTseABH1L8tWwZCNYT8aw&s"),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 140, bottom: 10),
                              child: Container(
                                height: 50,
                                width: 80,
                                decoration: const BoxDecoration(
                                    color: Color(0xffd1ad17),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50))),
                                child: const Center(
                                  child: Text(
                                    "Vegi",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.green,
                                              blurRadius: 10,
                                              offset: Offset(3, 3))
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "30 % Off",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.green[100],
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "On All vegetable Products",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(child: Container())
                ],
              ),
            ),

            ///herbs Product Container are here..
            _buildHerbsProduct(context),

            ///Fresh Products Row are here
            _buildFreshProduct(context),

            /// Roots Products are here..
            _buildRootProduct(context),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Home",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        actions: const [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d181),
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Herbs Seasoning",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Text(
                    "view All",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleProduct(),
                  singleProduct(),
                  singleProduct(),
                  singleProduct(),
                  singleProduct()
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fresh Fruits",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Text(
                    "view All",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleProduct(),
                  singleProduct(),
                  singleProduct(),
                  singleProduct(),
                  singleProduct()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleProduct() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 240,
      width: 160,
      decoration: BoxDecoration(
          // color: const Color(0xffd9dad9),
          color: Colors.white,
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Image.network(
                "https://atlas-content-cdn.pixelsquid.com/stock-images/fresh-basil-leafs-mr3mzw4-600.jpg",
                height: 150,
                width: 150,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Fresh Basil",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Text("50\$/50 Gram"),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "50 Gram",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.remove,
                            size: 15,
                            color: Color(0xffd0b84c),
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xffd0b84c)),
                          ),
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Color(0xffd0b84c),
                          )
                        ],
                      ),
                    ))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

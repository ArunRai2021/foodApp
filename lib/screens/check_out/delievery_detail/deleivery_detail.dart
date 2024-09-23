import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/check_out/delievery_detail/single_deleivery_item.dart';

class DeleiveryDetail extends StatelessWidget {
  const DeleiveryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Detail"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          onPressed: () {},
          color: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text("Add New Address"),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
              title: Text(
                "Deliver To",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              leading: Icon(
                Icons.location_on_outlined,
                color: Colors.black,
                size: 30,
              )),
          Divider(
            height: 1,
            color: Colors.grey,
            endIndent: 10,
            indent: 10,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                  title: "Arun Rai",
                  address: "Village Tarouka Post - Tarouka District - Azamgarh",
                  number: "+91 123456789",
                  addressType: "Home")
            ],
          )
        ],
      ),
    );
  }
}

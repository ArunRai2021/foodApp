import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/reviewCart/review_cart.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  Widget listTile(
      {required IconData icon, required String title, Function()? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 43,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.red,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSel7zJCCRNU-JrttTseABH1L8tWwZCNYT8aw&s"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Guest",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            )),
            listTile(icon: Icons.home_outlined, title: "Home"),
            listTile(
                icon: Icons.shop_outlined,
                title: "Review Cart",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const ReviewCart();
                  }));
                }),
            listTile(
                icon: Icons.person_outline,
                title: "My Profile",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const MyProfile();
                  }));
                }),
            listTile(
                icon: Icons.notifications_outlined, title: "Notifications"),
            listTile(icon: Icons.star_outline, title: "Rating and Review"),
            listTile(icon: Icons.copy_outlined, title: "Raise a Complain"),
            listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Support",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Call Us :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "9990978493",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Mail Us :",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "arunraihrit@gmail.com",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

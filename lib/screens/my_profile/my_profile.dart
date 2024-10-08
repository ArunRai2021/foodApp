import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 568,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Arun Rai",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text("arunraihrit@gmail.com")
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: scaffoldBackgroundColor,
                                  child: Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery address"),
                    listTile(
                        icon: Icons.person_outline_outlined,
                        title: "Refer A friends"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "terms and Conditions"),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policy"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    listTile(icon: Icons.exit_to_app_outlined, title: "Log Out")
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSel7zJCCRNU-JrttTseABH1L8tWwZCNYT8aw&s"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

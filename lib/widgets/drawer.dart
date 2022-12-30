import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageURL =
        "https://img.freepik.com/free-vector/self-care-illustration-concept_23-2148526939.jpg?size=338&ext=jpg&ga=GA1.1.8392076.1672306649";
    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                // decoration: BoxDecoration(color: Colors.red),
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                  accountEmail: Text("roshverma1234@gmail.com",
                      style: TextStyle(color: Colors.white)),
                  accountName:
                      Text("Roshni Purdhani", style: TextStyle(color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                  ),
                )),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text("Home", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text("Email", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_kellton/aboutus.dart';
import 'package:news_app_kellton/forms/reusablewidgets.dart';
import 'package:news_app_kellton/model/user_model.dart';
import 'package:news_app_kellton/screens/category.dart';
import 'package:news_app_kellton/screens/home_screen.dart';
import 'package:news_app_kellton/screens/login.dart';
import 'package:news_app_kellton/screens/saveditems.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final user = FirebaseAuth.instance.currentUser;
  static UserModel loggedInUser = UserModel();
  // late String loggedInUser;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      //   setState(() {});
      // fetch() async {
      //   final user = FirebaseAuth.instance.currentUser;
      //   if (user != null) {
      //     await FirebaseFirestore.instance
      //         .collection('users')
      //         .doc(user.uid)
      //         .get()
      //         .then((value) => loggedInUser =user.uid);
      //   }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.

        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //       begin: FractionalOffset(0.0, 0.0),
            //       end: FractionalOffset(0.5, 0.0),
            //       colors: [
            //         Colors.greenAccent,
            //         Color.fromARGB(31, 0, 0, 0),
            //         Colors.purple
            //       ]),
            // ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back2.gif'),
                fit: BoxFit.fill,
              ),
            ),
            accountName: const Text(
              "J Dayasagar News App",
              style: TextStyle(
                color: Colors.black,
                backgroundColor: Colors.yellow,
              ),
            ),
            accountEmail: Text("Logged in as ${loggedInUser.email}",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white,
                )),
            currentAccountPicture: logoWidget('assets/images/BlackSpidey.png'),
          ),

          // ListTile(
          //   leading: const Icon(Icons.home),
          //   title: const Text("Home"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => const HomeScreen()));
          //   },
          // ),

          // ListTile(
          //   leading: const Icon(Icons.category),
          //   title: const Text("Categories"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => const CategoryNews()));
          //   },
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: const Icon(Icons.bookmark),
          //   title: const Text("Saved Items"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => const SavedItems()));
          //   },
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // ListTile(
          //   leading: const Icon(Icons.contacts),
          //   title: const Text("About Us"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => const AboutUs()));
          //   },
          // ),
         
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back1.gif'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 65,
                ),
                ActionChip(
                  label: const Text('Home'),
                  avatar: const Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                  backgroundColor: Colors.amberAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen()));
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ActionChip(
                  label: const Text('Categories'),
                  avatar: const Icon(Icons.category),
                  backgroundColor: Colors.lightBlueAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const CategoryNews()));
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ActionChip(
                  label: const Text('Saved'),
                  avatar: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const SavedItems()));
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ActionChip(
                  label: const Text('About Us'),
                  avatar: const Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  backgroundColor: Colors.greenAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const AboutUs()));
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                ActionChip(
                    avatar: const Icon(Icons.logout),
                    label: const Text("Logout"),
                    onPressed: () {
                      logout(context);
                    }),
                const SizedBox(
                  height: 130,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}

import 'package:flutter/material.dart';
import 'package:news_app_kellton/forms/navdrawer.dart';
import 'package:news_app_kellton/screens/category/business.dart';
import 'package:news_app_kellton/screens/category/entertainment.dart';
import 'package:news_app_kellton/screens/category/health.dart';
import 'package:news_app_kellton/screens/category/science.dart';
import 'package:news_app_kellton/screens/category/sports.dart';
import 'package:news_app_kellton/screens/category/technology.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({Key? key}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      drawer: const NavDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back4.gif'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/entertainment.png',
                    height: 120,
                    width: 150,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Entertainment()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/sports.png',
                    height: 120,
                    width: 150,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const Sports()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/technology.png',
                    height: 120,
                    width: 150,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const Technology()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/health.png',
                    height: 120,
                    width: 150,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const Health()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/science.png',
                    height: 120,
                    width: 150,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const Science()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 70),
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/business.png',
                    height: 120,
                    width: 150,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const Business()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailedSaved extends StatelessWidget {
  final String a, b, c, d;
  const DetailedSaved({
    Key? key,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text('Details Page'),
        ),
        // drawer: const NavDrawer(),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  child: a != ""
                      ? Image.network(
                          a,
                          fit: BoxFit.cover,
                        )
                      : const Text("Cant Load image"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    b,
                    style: const TextStyle(fontSize: 30.0),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  d,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  c,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ]),
            )));
  }
}

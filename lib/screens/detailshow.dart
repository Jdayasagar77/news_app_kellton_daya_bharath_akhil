import 'package:flutter/material.dart';
import 'package:news_app_kellton/forms/navdrawer.dart';
import 'package:news_app_kellton/model/newsapimodel.dart';

class DetailNews extends StatelessWidget {
  final NewsApiModel model;

  const DetailNews({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text('Details Page'),
        ),
        drawer: const NavDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                    child: model.imageUrl != ""
                        ? Image.network(
                            model.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : const Text("Cant Load image"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      model.title,
                      style: const TextStyle(fontSize: 30.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    model.description,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    model.content,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ]),
              )),
        ));
  }
}

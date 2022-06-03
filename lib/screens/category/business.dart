//
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_kellton/forms/navdrawer.dart';
import 'package:news_app_kellton/forms/reusablewidgets.dart';
import 'package:news_app_kellton/model/newsapimodel.dart';

Future<List<NewsApiModel>> getBusiness() async {
  Uri uri = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=79440d553f57472c901529c4487d2a94');
  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articalsList = map['articles'];

    List<NewsApiModel> newsList = _articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))
        .toList();

    print(_articalsList);

    return newsList;
  } else {
    print("error");
    return [];
  }
}

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getBusiness().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Business News'),
        ),
        drawer: const NavDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back3.gif'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? const Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: newsList!.length,
                        itemBuilder: (context, index) {
                          return listItems(context, size, newsList![index]);
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

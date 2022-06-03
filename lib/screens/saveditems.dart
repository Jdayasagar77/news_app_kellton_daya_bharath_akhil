import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_kellton/forms/reusablewidgets.dart';
import 'package:news_app_kellton/screens/detailedsaved.dart';

class SavedItems extends StatefulWidget {
  const SavedItems({Key? key}) : super(key: key);

  @override
  State<SavedItems> createState() => _SavedItemsState();
}

class _SavedItemsState extends State<SavedItems> {
  bool isLoading = true;

  List<String> docIDs = [];

  Future getDocID() async {
    User? user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('articles')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              docIDs.add(element.reference.id);
            }));
  }

// Future removeUser(id) async {
//  final Stream<QuerySnapshot> usersData = FirebaseFirestore.instance.collection('articles').snapshots();
// CollectionReference article = FirebaseFirestore.instance.collection('articles');
// debugPrint('Removing User with the $id');
// return article
// .doc(id)
// .delete()
// .then(
// (value) => Get.snackbar('Delete', 'User Deleted with $id'),
// )
// .catchError(
// (onError) =>
// Get.snackbar('Error', 'Error while removing the user\n$onError'),
// );
// }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    CollectionReference article = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('articles');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: FutureBuilder(
          future: getDocID(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: docIDs.length,
              itemBuilder: ((context, index) {
                return FutureBuilder<DocumentSnapshot>(
                    future: article.doc(docIDs[index]).get(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;

                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailedSaved(
                                  a: data['image'],
                                  b: data['title'],
                                  c: data['content'],
                                  d: data['description']),
                            ),
                          ),
                          child: Container(
                            height: 210,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 375,
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: 300,
                                          child: Text(data['title'],
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                overflow: TextOverflow.ellipsis,
                                              ))),
                                      IconButton(
                                          onPressed: () async {
                                            removeArticle(docIDs[index]);
                                          },
                                          icon: const Icon(Icons.remove)),
                                    ]),
                              ],
                            ),
                          ),
                        );
                      }
                      return const Text('Not Loading');
                    }));
              }),
            );
          }),
    );
  }
}




      // Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         vertical: 7, horizontal: 8),
      //                     child: GestureDetector(
      //                       onTap: () => Navigator.of(context).push(
      //                         MaterialPageRoute(
      //                           builder: (_) => const DetailedSaved(),
      //                         ),
      //                       ),
      //                       child: Container(
      //                         height: 210,
      //                         width: 200,
      //                         decoration: BoxDecoration(
      //                           border:
      //                               Border.all(color: Colors.black, width: 3),
      //                         ),
      //                         child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.start,
      //                             children: [
      //                               Image.network(
      //                                 data['image'],
      //                                 // height: 150,
      //                                 // width: 400,
      //                                 fit: BoxFit.fill,
      //                               ),
      //                               Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceEvenly,
      //                                 children: [
      //                                   SizedBox(
      //                                       width: 300,
      //                                       child: Text(data['title'],
      //                                           maxLines: 2,
      //                                           style: const TextStyle(
      //                                             fontSize: 15,
      //                                             overflow:
      //                                                 TextOverflow.ellipsis,
      //                                           ))),
      //                                   IconButton(
      //                                       onPressed: () async {},
      //                                       icon: const Icon(Icons.remove)),
      //                                 ],
      //                               ),
      //                             ]),
      //                       ),
      //                     ),
      //                   );
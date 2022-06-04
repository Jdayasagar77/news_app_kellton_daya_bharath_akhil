import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_kellton/model/newsapimodel.dart';
import 'package:news_app_kellton/screens/detailshow.dart';

CircleAvatar logoWidget(String imageName) {
  return CircleAvatar(
    child: Image.asset(
      imageName,
    ),
    radius: 75,
    backgroundColor: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: const Color.fromARGB(255, 15, 14, 14),
    style: TextStyle(
        color: const Color.fromARGB(255, 168, 66, 66).withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(179, 48, 153, 156),
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 70, 37, 131).withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 150,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(221, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(66, 255, 255, 255);
            }
            return const Color.fromARGB(255, 48, 39, 39);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Widget listItems(BuildContext context, Size size, NewsApiModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
    child: GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DetailNews(
            model: model,
          ),
        ),
      ),
      child: Container(
        height: 210,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          color: Colors.white,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          model.imageUrl != ""
              ? SizedBox(
                  height: 150,
                  width: 375,
                  child: Image.network(
                    model.imageUrl,
                    // height: 150,
                    // width: 400,
                    fit: BoxFit.fill,
                  ),
                )
              : const Text("Cant Load image"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 300,
                  child: Text(model.title,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ))),
              IconButton(
                  onPressed: () async {
                    addArticleDetails(model.imageUrl, model.title,
                        model.content, model.description);
                  },
                  icon: const Icon(Icons.bookmark)),
            ],
          ),
        ]),
      ),
    ),
  );
}

Future addArticleDetails(String imageUrl, title, content, description) async {
  User? user = FirebaseAuth.instance.currentUser;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection("articles")
      .add({
    'image': imageUrl,
    'title': title,
    'content': content,
    'description': description,
  });
}

Future removeArticle(index) async {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('articles')
      .doc(index)
      .delete();
}

Widget typer(String text1, String text2) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.white12, Colors.purple]),
    ),
    child: DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
        TyperAnimatedText(text1,
            textStyle: const TextStyle(color: Colors.black),
            speed: const Duration(milliseconds: 100)),
        TyperAnimatedText(text2,
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 0, 0),
              fontStyle: FontStyle.italic,
            ),
            speed: const Duration(milliseconds: 100)),
      ]),
    ),
  );
}







// bool spinner = false;
// final articleRef = FirebaseDatabase.instance.ref().child('Articles');
// firebase_storage.FirebaseStorage storage =
//     firebase_storage.FirebaseStorage.instance;
// FirebaseAuth auth = FirebaseAuth.instance;


// void dialog(context){
//   showDialog(context: context, builder: (
//     BuildContext context
//   ){
//     return AlertDialog()
//   });
// }
 //   try {
                  //     int date = DateTime.now().millisecondsSinceEpoch;
                  //     firebase_storage.Reference reference = firebase_storage
                  //         .FirebaseStorage.instance
                  //         .ref('gs://signinnews.appspot.com');
                  //     firebase_storage.UploadTask uploadImage =
                  //         reference.putString(model.imageUrl);
                  //     await Future.value(uploadImage);
                  //     var imageUrl = reference.getDownloadURL();
                  //     firebase_storage.UploadTask uploadTitle =
                  //         reference.putString(model.title);
                  //     await Future.value(uploadTitle);
                  //     var titleUrl = reference.getDownloadURL();
                  //     firebase_storage.UploadTask uploadCont =
                  //         reference.putString(model.content);
                  //     await Future.value(uploadCont);
                  //     var contentUrl = reference.getDownloadURL();
                  //     firebase_storage.UploadTask uploadDesc =
                  //         reference.putString(model.description);
                  //     await Future.value(uploadDesc);
                  //     var descUrl = reference.getDownloadURL();
                  //     final User? user = auth.currentUser;

                  //     articleRef
                  //         .child('Article List')
                  //         .child(date.toString())
                  //         .set({
                  //       'pId': date.toString(),
                  //       'pImage': imageUrl.toString(),
                  //       'pTitle': titleUrl.toString(),
                  //       'pCont': contentUrl.toString(),
                  //       'pDesc': descUrl.toString(),
                  //       // 'pTempTitle': model.title.toString(),
                  //     }).then((value) {
                  //       Fluttertoast.showToast(msg: 'Article Published');
                  //     }).onError((error, stackTrace) {
                  //       Fluttertoast.showToast(msg: error.toString());
                  //     });
                  //   } catch (e) {
                  //     spinner = false;
                  //     print(spinner);
                  //   }
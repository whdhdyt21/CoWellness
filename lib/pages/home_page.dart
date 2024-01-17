import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/component/my_textfield.dart';
import 'package:login_api/component/wall_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  final textController = TextEditingController();

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Post").add({
        "UserEmail": currentUser.email,
        "Message": textController.text,
        "TimeStamp": Timestamp.now(),
      });
      setState(() {
        textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('The Wall', style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
              color: Colors.white,
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("User Post")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, Index) {
                          final post = snapshot.data!.docs[Index];
                          return WallPost(
                            message: post['Message'],
                            user: post['UserEmail'],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error:${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        controller: textController,
                        hintext: 'Write something on the wall..',
                        obsecureText: false,
                      ),
                    ),
                    IconButton(
                        onPressed: postMessage, icon: const Icon(Icons.send)),
                  ],
                ),
              ),
              Text("Logged in as:" + currentUser.email!,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/component/text_field_forum.dart';
import 'package:login_api/component/wall_post.dart';

class ForumDiscusion extends StatefulWidget {
  const ForumDiscusion({super.key});

  @override
  State<ForumDiscusion> createState() => _ForumDiscusionState();
}

class _ForumDiscusionState extends State<ForumDiscusion> {
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
        "Likes": [],
        "Dislikes": [],
      });
      setState(() {
        textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('FORUM', style: TextStyle(color: Colors.white)),
            ),
            backgroundColor: const Color.fromARGB(255, 17, 67, 115),
            leading: IconButton(
              onPressed: () {
                // Tambahkan aksi yang sesuai ketika ikon profil diklik
              },
              icon: const Icon(Icons.account_circle),
              color: Colors.white,
            ),
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
                              timestamp: post['TimeStamp'],
                              postId: post.id,
                              likes: List<String>.from(
                                post['Likes'] ?? [],
                              ),
                              dislikes: List<String>.from(
                                post['Dislikes'] ?? [],
                              ),
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
                        child: TextForumField(
                          controller: textController,
                          hintext: 'Write something on the forum..',
                          obsecureText: false,
                        ),
                      ),
                      IconButton(
                          onPressed: postMessage, icon: const Icon(Icons.send)),
                    ],
                  ),
                ),
                Text("Logged in as:${currentUser.email!}",
                    style:
                        const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
    );
  }
}

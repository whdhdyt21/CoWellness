import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/component/dislike_button.dart';
import 'package:login_api/component/like_button.dart';

class WallPost extends StatefulWidget {
  final String user;
  final String message;
  final Timestamp timestamp;
  final String postId;
  final List<String> likes;
  final List<String> dislikes;

  const WallPost(
      {super.key,
      required this.user,
      required this.message,
      required this.timestamp,
      required this.postId,
      required this.likes,
      required this.dislikes});

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  bool isDisliked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
    isDisliked = widget.dislikes.contains(currentUser.email);
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        widget.likes.remove(currentUser.email ?? ''); // Menambahkan null check
      } else {
        widget.likes.add(currentUser.email ?? ''); // Menambahkan null check
        widget.dislikes
            .remove(currentUser.email ?? ''); // Menambahkan null check
      }
      isLiked = !isLiked;
      isDisliked = false;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection("User Post").doc(widget.postId);

    postRef.update({
      "Likes": widget.likes,
      "Dislikes": widget.dislikes,
    });
  }

  void toggleDislike() {
    setState(() {
      if (isDisliked) {
        widget.dislikes
            .remove(currentUser.email ?? ''); // Menambahkan null check
      } else {
        widget.dislikes.add(currentUser.email ?? ''); // Menambahkan null check
        widget.likes.remove(currentUser.email ?? ''); // Menambahkan null check
      }
      isDisliked = !isDisliked;
      isLiked = false;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection("User Post").doc(widget.postId);

    postRef.update({
      "Likes": widget.likes,
      "Dislikes": widget.dislikes,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.grey[200], // Set the background color to grey
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 16),
                const SizedBox(width: 8.0),
                Text(
                  widget.user,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(widget.message),
            const SizedBox(height: 15.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      LikeButton(isLiked: isLiked, onTap: toggleLike),
                      const SizedBox(width: 4.0),
                      Text(widget.likes.length.toString()),
                      const SizedBox(width: 10.0),
                      DislikeButton(
                          isDislike: isDisliked, onTap: toggleDislike),
                      const SizedBox(width: 4.0),
                      Text(widget.dislikes.length.toString()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, size: 12, color: Colors.grey),
                        const SizedBox(width: 4.0),
                        Text(
                          formatDate(widget.timestamp.toDate()),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }
}

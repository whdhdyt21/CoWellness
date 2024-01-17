import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  final String user;
  final String message;
  final Timestamp timestamp;

  const WallPost(
      {super.key, required this.user, required this.message, required this.timestamp});

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
                  user,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(message),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.access_time, size: 12, color: Colors.grey),
                  const SizedBox(width: 4.0),
                  Text(
                    formatDate(timestamp.toDate()),
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
    );
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }
}

import 'package:flutter/material.dart';

class DislikeButton extends StatelessWidget {
  final bool isDislike;
  void Function()? onTap;
  DislikeButton({super.key, required this.isDislike, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isDislike ? Icons.thumb_down : Icons.thumb_down_alt_outlined,
        color: isDislike ? Colors.blue : Colors.grey,
      ),
    );
  }
}

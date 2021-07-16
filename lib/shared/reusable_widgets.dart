import 'package:flutter/material.dart';

class ReusableWidgets {
  static AppBar whiteAppBar(String title) {
    return AppBar(
      leading: const BackButton(color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
  static Widget customLoading() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}

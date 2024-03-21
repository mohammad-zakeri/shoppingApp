import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),

      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),

        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),

      ),

    );

  }

}

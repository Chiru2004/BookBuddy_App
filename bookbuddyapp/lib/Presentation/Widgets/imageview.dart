import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  ImageView({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Book Cover",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
            height: 360,
            width: 220,
            child: Image.network(
              image,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}

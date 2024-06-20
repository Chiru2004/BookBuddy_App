import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text(
          "Book Cover",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: InteractiveViewer(
        child: Center(
          child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                image,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}

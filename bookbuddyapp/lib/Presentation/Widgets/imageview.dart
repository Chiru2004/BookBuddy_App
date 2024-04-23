import 'package:flutter/material.dart';

class ImageView extends StatelessWidget{
   ImageView({super.key,required this.image});
   final String image;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Cover"),
      ),
      body: Center(
        
        child: Image.network(image,fit: BoxFit.fill,),
      ),
    );
  }

}
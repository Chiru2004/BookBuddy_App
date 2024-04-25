import 'package:flutter/material.dart';

class ImageView extends StatelessWidget{
   ImageView({super.key,required this.image});
   final String image;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Book Cover",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        
        child: Container(
          height: 400,
          width: 250,
          child: Image.network(image,fit: BoxFit.fill,)),
      ),
    );
  }

}
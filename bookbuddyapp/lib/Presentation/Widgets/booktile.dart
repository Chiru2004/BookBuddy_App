
import 'package:bookbuddyapp/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookTile extends StatelessWidget {
  final category_data book;

  const BookTile({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle book tap
      },
      child:  Card(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Expanded(
               child: Container(
                height: 194.8,
                width: double.infinity, // Fixed height for the image
                child: Image.network(
                  height: double.infinity,
                  book.volumeInfo!.imageLinks!.smallThumbnail!,
                  fit: BoxFit.cover, // Ensure the image covers the entire container
                ),
                           ),
             ),
            Spacer(),
              Text(
                book.volumeInfo!.title!,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    
  }
}
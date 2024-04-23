
import 'package:bookbuddyapp/Presentation/screens/bookdetails_screen.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailsPage(book: book) ,));
        // Handle book tap
      },
      child:  Container(
  width: 150, // Adjust the width as needed
  child: Card(
    color: Colors.black,
    child: Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 150, // Fixed height for the image container
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              book.volumeInfo!.imageLinks!.thumbnail!,
              fit: BoxFit.cover,
              height: double.infinity,
               // Adjust the fit as per your requirement
            ),
          ),
        ),
       // const SizedBox(height: 20),
       //const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            book.volumeInfo!.title!,
            style: const TextStyle(fontSize: 11, color: Colors.white),
            maxLines: 1
            ,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  ),
),


      );
    
  }
}
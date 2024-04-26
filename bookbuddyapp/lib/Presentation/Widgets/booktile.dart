import 'package:bookbuddyapp/Presentation/screens/bookdetails_screen.dart';
import 'package:bookbuddyapp/Presentation/screens/search_detail.screen.dart';
import 'package:bookbuddyapp/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookTile extends StatelessWidget {
  final dynamic book;

  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: 100,
      // height: 100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchDetailsPage(book: book),
                    ));
                // Handle book tap
              },
              child: Column(
                children: [
                  Container(
                      height: 140,
                      width: 100, // Adjust the width as needed
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          boxShadow:const [
                            BoxShadow(
                                color: Color.fromARGB(255, 53, 53, 53),
                                blurRadius: 3,
                                offset: Offset(3, 3))
                          ],
                          image: DecorationImage(
                              image: NetworkImage(
                                book['volumeInfo']['imageLinks']['thumbnail'],
                              ),
                              fit: BoxFit.cover))),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      book['volumeInfo']['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ), //
          ),
        ],
      ),
    );
  }
}

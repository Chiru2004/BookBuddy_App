import 'package:bookbuddyapp/Presentation/screens/search_detail.screen.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final dynamic book;
  const SearchBox(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SearchDetailsPage(book: book),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            width: 40,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bookbuddyapp/Blocs/booksave/booksave_bloc.dart';
import 'package:bookbuddyapp/Presentation/Widgets/imageview.dart';
import 'package:bookbuddyapp/data/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchDetailsPage extends StatelessWidget {
  const SearchDetailsPage({super.key, required this.book});
  final dynamic book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, // Dark background color
      appBar: AppBar(
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:  Text(
          "Details",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Theme.of(context).colorScheme.background, // Match the background color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Image, Title, and Author
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image of the book
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ImageView(
                          image: book['volumeInfo']['imageLinks']['thumbnail']),
                    ));
                  },
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            book['volumeInfo']['imageLinks']['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                // Title and Author
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        book['volumeInfo']['title'],
                        style:  TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'By \n' + book['volumeInfo']['authors'][0],
                        style:  TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.primary),
                      ),
                      if (book['volumeInfo']['authors'].length > 1)
                        Text(
                          book['volumeInfo']['authors'][1],
                          style:  TextStyle(
                              fontSize: 14, color: Theme.of(context).colorScheme.primary),
                        )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // Section 2: Navigation and Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (book['volumeInfo']['description'] != null)
                  ExpansionTile(
                    title:  Text(
                      'Description of the book',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          book['volumeInfo']['description'],
                          style:  TextStyle(
                              fontSize: 14, color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 4.0),
                // ListView for details
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                  children: [
                    if (book['volumeInfo']['averageRating'] != null)
                      ListTile(
                        title: Text(
                            book['volumeInfo']['averageRating'].toString(),
                            style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                        subtitle: const Text(
                          'Book Rating',
                          style: TextStyle(color: Color.fromARGB(255, 159, 159, 159), fontSize: 12),
                        ),
                      ),

                    if (book['volumeInfo']['language'] != null)
                      ListTile(
                        title: Text(book['volumeInfo']['language'],
                            style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                        subtitle: const Text(
                          'Language',
                          style: TextStyle(color: Color.fromARGB(255, 159, 159, 159), fontSize: 12),
                        ),
                      ),

                    if (book['volumeInfo']['pageCount'] != null)
                      ListTile(
                        title: Text(book['volumeInfo']['pageCount'].toString(),
                            style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                        subtitle: const Text(
                          'Page Count',
                          style: TextStyle(color: Color.fromARGB(255, 159, 159, 159), fontSize: 12),
                        ),
                      ),

                    if (book['volumeInfo']['publishedDate'] != null)
                      ListTile(
                        title: Text(book['volumeInfo']['publishedDate'],
                            style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                        subtitle: const Text(
                          'Published Date',
                          style: TextStyle(color: Color.fromARGB(255, 159, 159, 159), fontSize: 12),
                        ),
                      ),

                    if (book['volumeInfo']['categories'] != null)
                    if (book['volumeInfo']['categories'][0] != null)
                      ListTile(
                        title: Text(book['volumeInfo']['categories'][0],
                            style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                        subtitle: const Text(
                          'Genre',
                          style: TextStyle(color:  Color.fromARGB(255, 159, 159, 159), fontSize: 12),
                        ),
                      ),

                    if (book['volumeInfo']['printType'] != null)
                      ListTile(
                        title: Text(book['volumeInfo']['printType'],
                            style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                        subtitle: const Text(
                          'Print Type',
                          style: TextStyle(color: Color.fromARGB(255, 159, 159, 159), fontSize: 12),
                        ),
                      ),
                    if (book['volumeInfo']['previewLink'] != null)
                      ListTile(
                        title:  Text("Preview link available",
                            style:
                                TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16)),
                        trailing: OutlinedButton(
                          onPressed: () {
                            _launchUrl(book['volumeInfo']['previewLink']);
                          },
                          style:  ButtonStyle(
                              side: MaterialStatePropertyAll(
                                  BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5))),
                          child:  Text(
                            'View Online',
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      )
                    // Add more details as needed
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //  clipBehavior: Clip.,
        color:Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 120, 120, 120))),
              onPressed: () async {
                if (book['volumeInfo']['description'] != null) {
                  BlocProvider.of<BooksaveBloc>(context).add(AddBookEvent(
                      BookShelfBook(
                          book['volumeInfo']['title'],
                          book['volumeInfo']['authors'][0],
                          book['volumeInfo']['description'])));
                } else {
                  BlocProvider.of<BooksaveBloc>(context).add(AddBookEvent(
                      BookShelfBook(
                          book['volumeInfo']['title'],
                          book['volumeInfo']['authors'][0],
                          "No descrpition available")));
                }
                // small changes
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Book added to shelf.")));
              },
              child:  Text(
                'Save to Shelf',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 131, 131, 131))),
              onPressed: () async {
                if (book['volumeInfo']['canonicalVolumeLink'] != null) {
                  String url = book['volumeInfo']['canonicalVolumeLink'];
                  _launchUrl(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text(
                    "No website link available",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  )));
                }
              },
              child:  Text('Search Online',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(final String url) async {
  try {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    print(e);
  }
}

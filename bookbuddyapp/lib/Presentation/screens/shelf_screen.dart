import 'package:bookbuddyapp/Blocs/booksave/booksave_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class ShelfScreen extends StatefulWidget {
  const ShelfScreen({super.key});
  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {
  @override
  void initState() {
    BlocProvider.of<BooksaveBloc>(context).add(IitializeEvent());
    //  add(AddBookEvent(BookShelfBook("Hero", "Chirag", "Tryinggg")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  RichText(
          text:  TextSpan(
          children: [
            TextSpan(
              text: "My Book ",
               style: TextStyle(color:Theme.of(context).colorScheme.secondary, fontSize: 18 ,fontFamily:  GoogleFonts.raleway().fontFamily)
            ),
            TextSpan(
              text: "Shelf",
               style: TextStyle(color:Theme.of(context).colorScheme.primary, fontSize: 28,fontFamily:  GoogleFonts.raleway().fontFamily)
            )
          ]
        )),
        backgroundColor:Theme.of(context).colorScheme.background,
      ),
      body: BlocBuilder<BooksaveBloc, BooksaveState>(
        bloc: BlocProvider.of<BooksaveBloc>(context),
        builder: (context, state) {
          if (state is FetchBooksState) {
            if (state.books.length == 0) {
              return Center(
                child: Container(
                  height: 350,
                  width: 400,
                  child:  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/empty_rack.png'),
                        fit: BoxFit.contain,
                      ),
                      Text("Empty Shelf!       ",style: TextStyle(color:Theme.of(context).colorScheme.primary),)
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      verticalOffset: -250,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 2500),
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 3),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 7, bottom: 3),
                          decoration: BoxDecoration(
                            gradient:  LinearGradient(
                                colors: [
                                 Color.fromARGB(255, 95, 95, 95),
                                 Theme.of(context).colorScheme.background
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight), // Grey background color
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                state.books[index].title,
                                style:   TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color:Theme.of(context).colorScheme.primary, // White text color
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      4.0), // Add some space between title and subtitle
                              Text(
                                state.books[index].author,
                                style:   TextStyle(
                                  fontSize: 12.0,
                                  color:Theme.of(context).colorScheme.primary, // White text color
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      7), // Add some space between subtitle and buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const Spacer(),
                                  ElevatedButton(
                                    style:  ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(
                                            Theme.of(context).colorScheme.background)),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .grey[800], // Grey background color
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Text(
                                                    'Description',
                                                    style: TextStyle(
                                                      fontSize: 26.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: Theme.of(context).colorScheme.primary, // White text color
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              horizontal: 16.0),
                                                      child: Text(
                                                        state
                                                            .books[index].description,
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.grey[
                                                              200], // White text color
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        16.0), // Add some space between description and close button
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the bottom sheet
                                                    },
                                                    child:  Text(
                                                      'Close',
                                                      style: TextStyle(
                                                          color: Theme.of(context).colorScheme.primary),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height:
                                                        16.0), // Add some space below the close button
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      // Add your functionality for the description button
                                    },
                                    child:  Text(
                                      'Description',
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontSize: 11),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      BlocProvider.of<BooksaveBloc>(context)
                                          .add(RemoveBookEvent(state.books[index]));
                                      ScaffoldMessenger.of(context).clearSnackBars();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "Book removed from the shelf")));
                                    },
                                    style:  ButtonStyle(
                                      side: MaterialStatePropertyAll(
                                          BorderSide(width: 2, color:Theme.of(context).colorScheme.primary)),
                                    ),
                                    child:  Text('Remove',
                                        style: TextStyle(
                                            color:Theme.of(context).colorScheme.primary,
                                            fontSize: 11)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is FetchingShelfBooksState) {
            return const Text(
              "Fetchingggg",
              style: TextStyle(color: Colors.white),
            );
          } else
            return const Text("boom");
        },
      ),
    );
  }
}

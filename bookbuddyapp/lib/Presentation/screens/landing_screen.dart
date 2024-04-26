import 'package:bookbuddyapp/Blocs/booksave/booksave_bloc.dart';
import 'package:bookbuddyapp/services/saveservice.dart';
import 'package:flutter/material.dart';
import 'package:bookbuddyapp/Presentation/screens/explore_screen.dart';
import 'package:bookbuddyapp/Presentation/screens/shelf_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBuddyApp extends StatelessWidget {
  const BookBuddyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SaveShelf(),
      child: BlocProvider(
        create: (context) =>
            BooksaveBloc(RepositoryProvider.of<SaveShelf>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.raleway().fontFamily,
            textTheme:
                GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[900], // Dark grey app bar
            ),
          ),
          home: LandingPage(),
        ),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // we set the inital page as the shelf screen
  int _selectedIndex = 0; // Index for bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedIndex), // Displaying selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.grey[900], // Dark grey background for bottom nav bar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) =>
            setState(() => _selectedIndex = index), // Updating selected index
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Shelf',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const ShelfScreen(); // Display ShelfPage when index is 0
      case 1:
        return ExploreScreen(); // Display ExplorePage when index is 1
      default:
        return Container(); // Return empty container for other indices
    }
  }
}

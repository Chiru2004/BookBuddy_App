import 'package:bookbuddyapp/Presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookbuddyapp/Blocs/explore_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookbuddyapp/Presentation/Widgets/category_button.dart';
import 'package:bookbuddyapp/Presentation/Widgets/booktile.dart';


class ExploreScreen extends StatefulWidget {
@override
 _ExploreScreen createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen>{

@override
  void initState() {
    exploreCategories.add(FetchExploreBooks("Thriller"));
    super.initState();
  }
@override
  void dispose() {
   exploreCategories.close();
    super.dispose();
  }
 // we initialise the bloc
     final ExploreBloc exploreCategories = ExploreBloc();

// dependency injection to insert the bloc into the main function
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => exploreCategories,
    child:  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              const Text("Categories",style: TextStyle(color: Colors.white,fontSize: 21),),
              Spacer(),
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(),));
              },
               icon: const Icon(Icons.search,color: Colors.white,))
            ],
          ),
        ),
        const SizedBox(height: 4,),
        Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryButton(category: 'Thriller'),
                  CategoryButton(category: 'Romance'),
                  CategoryButton(category: 'Biography'),
                  CategoryButton(category: 'History'),
                  CategoryButton(category: 'Horror'),
                  CategoryButton(category: 'Self-help'),
                  CategoryButton(category: 'Fantasy'),
                 //  CategoryButton(category: 'Children'),
                  // Add more category buttons as needed
                ],
              ),
            ),
            const SizedBox(height: 7,),
        Expanded(
          child: Scaffold(
            body: BlocBuilder<ExploreBloc,ExploreState>(
            
            //here builder is a pure function that we will use to fetch the data
            // builder will called whenever there is change if state in the app
            builder: (context,state) {
             
             if(state is ExploreLoading)
             {
          return const Center(child: 
          Text("Fetching",style:TextStyle(color: Colors.white)),);
             }
             else
             if(state is ExploreLoaded)
             {
             return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of books in a row
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: state.books.length,
                      itemBuilder: (BuildContext context, int index) {
                        
                         return BookTile(book: state.books[index]);
                      },
                    );

             }
             else
             if( state is ExploreError)
             {
          return const Center(child : Text("Failed to fetch",style: TextStyle(color: Colors.white),));
             }
             else
             {
          return const Center(child: Text('Press the button to load data'));
             }
               }
            ),
          ),
        ),
      ],
    )
  );
}
}

import 'package:bookbuddyapp/Presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookbuddyapp/Blocs/explore_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookbuddyapp/Presentation/Widgets/category_button.dart';
import 'package:bookbuddyapp/Presentation/Widgets/booktile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class ExploreScreen extends StatefulWidget {
@override
 _ExploreScreen createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen>{

@override
  void initState() {
    exploreCategories.add(FetchExploreBooks("Education"));
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
    child:  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explore Books",
          style: TextStyle(color: Colors.white,fontSize: 28),
          
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              children: [
                const Text("Categories",style: TextStyle(color: Colors.white,fontSize: 21),),
                const Spacer(),
                OutlinedButton(
                  style: const ButtonStyle(side: MaterialStatePropertyAll(BorderSide(color: Colors.white,width: 1.5))),
                  onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(),));
                },
   
                 child: const Icon(Icons.search,color: Colors.white,))
              ],
            ),
          ),
          const SizedBox(height: 4,),
          Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryButton(category: 'Education',coloor: Colors.green,),
                     CategoryButton(category: 'Crime',coloor: Colors.yellow,),
                     CategoryButton(category: 'Suspense',coloor: Colors.brown,),
                     CategoryButton(category: 'Health',coloor: Colors.red),
                    CategoryButton(category: 'Drama',coloor: Color.fromARGB(255, 94, 178, 248),),
                    CategoryButton(category: 'Biography',coloor: Colors.orange,),
                    CategoryButton(category: 'History',coloor: Colors.grey,),
                    CategoryButton(category: 'Horror',coloor: Colors.deepPurpleAccent,),
                    CategoryButton(category: 'Self-help',coloor: Colors.pink,),
                    CategoryButton(category: 'Fantasy',coloor: Color.fromARGB(255, 10, 130, 14),),
                     CategoryButton(category: 'Education',coloor: Colors.indigo,),
                    CategoryButton(category: 'Computer Science',coloor: Colors.limeAccent,),
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
            return const Center(
          
          child: SpinKitFoldingCube(
            color: Color.fromARGB(255, 255, 255, 255), // You can customize the color
            size: 50.0, // You can customize the size
          ),
        );
               }
               else
               if(state is ExploreLoaded)
               {
                
               return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of books in a row
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                          
                        ),
                        
                        itemCount: state.books.length,
                        itemBuilder: (BuildContext context, int index) {
                          
                          if(state.books[index]['volumeInfo']['imageLinks'] != null
                       && state.books[index]['volumeInfo']['authors'] != null)
                       {
                          return BookTile(book: state.books[index]);
                       }
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
      ),
    )
  );
}
}

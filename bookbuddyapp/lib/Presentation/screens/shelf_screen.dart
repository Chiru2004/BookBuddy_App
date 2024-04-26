

import 'package:bookbuddyapp/Blocs/booksave/booksave_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ShelfScreen extends StatefulWidget {
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
        title: const Text(
          "My book Shelf",
          style: TextStyle(color: Colors.white,fontSize: 28),
          
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<BooksaveBloc, BooksaveState>(
        bloc: BlocProvider.of<BooksaveBloc>(context),
        builder: (context, state) {
          if(state  is FetchBooksState)
          {
            if(state.books.length == 0)
            {
              return Center(
                child:Container(
                  height: 650,
                  width: 650,
                  child: Image(image: AssetImage('assets/empty_rack.png'),fit: BoxFit.contain,),
                ),
              );
            }
            else{

            
            return ListView.builder(
              itemCount: state.books.length,
               itemBuilder: (context, index) 
               {
                 return Container(
      padding:const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 3),
      margin:const EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 3),
      decoration: BoxDecoration(
        gradient:const LinearGradient(colors: [
          Color.fromARGB(255, 58, 58, 58),
          Color.fromARGB(255, 18, 18, 18)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        ) , // Grey background color
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            state.books[index].title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text color
            ),
          ),
         const SizedBox(height: 4.0), // Add some space between title and subtitle
          Text(
            state.books[index].author,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white, // White text color
            ),
          ),
         const SizedBox(height: 7), // Add some space between subtitle and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            const Spacer(),
              ElevatedButton(
                style:const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 223, 223, 223))),
                onPressed: () {
                  showModalBottomSheet(context: context, 
                  builder: (context) {
                    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800], // Grey background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[200], // White text color
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  state.books[index].description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[200], // White text color
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0), // Add some space between description and close button
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the bottom sheet
              },
              child: const Text('Close',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
             
            ),
          ),
         const SizedBox(height: 16.0), // Add some space below the close button
        ],
      ),
    );

                  },);
                  // Add your functionality for the description button
                },
                child: const Text('Description',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 11),),
                
              ),
              const SizedBox(width: 5,),
              OutlinedButton(

                onPressed: () {
                  BlocProvider.of<BooksaveBloc>(context).add(RemoveBookEvent(state.books[index]));
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Book removed from the shelf")));
                },
                style:const ButtonStyle(side: MaterialStatePropertyAll(BorderSide(width: 2,color: Colors.white)),),
                child: const Text('Remove',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 11)),
                
              ),
            ],
          ),
        ],
      ),
    );

                },
             );
          }
          }
          else if(state is FetchingShelfBooksState)
          { 
             return const Text("Fetchingggg",style: TextStyle(color: Colors.white),);
          }
          else
          return const Text("boom");
        },
      ),
    );
  }
}

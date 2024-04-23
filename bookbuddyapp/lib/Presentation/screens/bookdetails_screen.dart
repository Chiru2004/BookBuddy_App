import 'package:bookbuddyapp/Presentation/Widgets/imageview.dart';
import 'package:bookbuddyapp/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsPage extends StatelessWidget {
 
 BookDetailsPage({super.key, required this.book});
 final category_data book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background color
      appBar: AppBar(
        title: const Text("Details",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black, // Match the background color
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Image, Title, and Author
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image of the book
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageView(image: book.volumeInfo!.imageLinks!.thumbnail!),));
                  },
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(book.volumeInfo!.imageLinks!.thumbnail!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                // Title and Author
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const  SizedBox(height: 20,),
                      Text(
                        book.volumeInfo!.title!,
                        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                     const  SizedBox(height: 8.0),
                      Text(
                        'By \n'+book.volumeInfo!.authors!.first,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            // Section 2: Navigation and Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
               ExpansionTile(
              title: const Text(
                'Description of the book',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    book.volumeInfo!.description!,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ), 
                SizedBox(height: 8.0),
                // ListView for details
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  children: [
                    ListTile(
                      title: Text(book.volumeInfo!.language!, style: TextStyle(color: Colors.white,fontSize:21 )),
                      subtitle: const Text('Language',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                   ListTile(
                      title: Text(book.volumeInfo!.pageCount.toString(), style: TextStyle(color: Colors.white,fontSize:21 )),
                      subtitle: const Text('Page Count',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                    ListTile(
                      title: Text(book.volumeInfo!.publishedDate!, style: TextStyle(color: Colors.white,fontSize:21 )),
                      subtitle: const Text('Published Date',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                    ListTile(
                      title: Text(book.volumeInfo!.categories!.first, style: TextStyle(color: Colors.white,fontSize:21 )),
                      subtitle: const Text('Genre',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                    ListTile(
                      title: Text(book.volumeInfo!.printType!, style: TextStyle(color: Colors.white,fontSize:21 )),
                      subtitle: const Text('Print Type',style: TextStyle(color: Colors.white,fontSize: 14),),
                    ),
                    
                    // Add more details as needed
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),
            // Section 3: Buttons
           
            
          ],
        ),
      ),
      bottomNavigationBar:  
            BottomAppBar(
            //  clipBehavior: Clip.,
              color: Colors.black,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle save to shelf
                  },
                  child: Text('Save to Shelf'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle search online
                  },
                  child: Text('Search Online'),
                ),
              ],
            ),
            ),
    );
  }
}


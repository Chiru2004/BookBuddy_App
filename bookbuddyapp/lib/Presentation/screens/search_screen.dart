import 'package:bookbuddyapp/Presentation/Widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:bookbuddyapp/Blocs/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int failed = 0;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  SearchBloc searchbooks = SearchBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchbooks,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title:  Text(
            'Search for Books',
            style: TextStyle(color:Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                autofocus: true,
                style:  TextStyle(color:Theme.of(context).colorScheme.primary),
                controller: _searchController,
                decoration:  InputDecoration(
                  focusColor: Colors.grey,
                  labelText: 'Enter your book name',
                  labelStyle: TextStyle(color:Theme.of(context).colorScheme.primary),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 7.0),
              OutlinedButton(
                onPressed: () {
                  searchbooks.add(FetchSearchBooks(_searchController.text));
                  //
                },
                style:  ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color:Theme.of(context).colorScheme.primary, width: 1.5))),
                child:  Text(
                  'Search',
                  style: TextStyle(color:Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 7.0),
              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                if (state is SearchInitial) {
                  return  Center(
                    child: Text(
                      "Enter your Query",
                      style: TextStyle(color:Theme.of(context).colorScheme.primary),
                    ),
                  );
                } else if (state is SearchFound) {
                  return Scaffold(
                    body: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: state.searchlist.length,
                      itemBuilder: (context, index) {

                        if (state.searchlist[index]['volumeInfo']['imageLinks'] != null &&
                            state.searchlist[index]['volumeInfo']['authors'] !=null
                            ) {
                          return SearchBox(
                            imageUrl: state.searchlist[index]['volumeInfo']
                                ['imageLinks']['thumbnail'],
                            title: state.searchlist[index]['volumeInfo']
                                ['title'],
                            subtitle: state.searchlist[index]['volumeInfo']
                                ['authors'][0],
                            book: state.searchlist[index],
                          );
                        }
                      },
                    ),
                  );
                } else if (state is SearchSearching) {
                  return  Center(
                    // Use SpinKitFoldingCube for the folding cube loading indicator
                    child: SpinKitFoldingCube(
                      color: Theme.of(context).colorScheme.primary, // You can customize the color
                      size: 50.0, // You can customize the size
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Search Failed!",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  );
                }
              
              }))
              //
            ],
          ),
        ),
      ),
    );
  }
}

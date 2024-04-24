import 'package:bookbuddyapp/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookbuddyapp/data/repositories/categoryrepository.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';
// here we declare all the set of events that we will be
// using to make the app




// Bloc
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()){

final CategoryRepository caterepo = CategoryRepository();
on<ExploreEvent>((ExploreEvent event,Emitter<ExploreState> emit) async{
 if (event is FetchExploreBooks) {
      try {
        emit(ExploreLoading());
        // here include the code to fetch the data through the repositories
        // final response = await http.get(Uri.parse(
        // 'https://www.googleapis.com/books/v1/volumes?q=subject:${event.subject}&key=yourAPIKey'));
        // final data = json.decode(response.body);
        
        final data= await caterepo.getBooksforCategory(event.subject);
     //   print(data);
     
        emit(ExploreLoaded(data));
        if(data.isEmpty)
        {
           emit(ExploreError());
        }
      } catch (_) {
       emit(ExploreError());
      }
    }
}
);
  }
  }





  
  
//  @override
//   Stream<ExploreState> mapEventToState(ExploreEvent event) async* {
//     if (event is FetchExploreBooks) {
//       yield ExploreLoading();
//       try {

//         // //here include the code to fetch the data through the repositories
//         // final response = await http.get(Uri.parse(
//         //     'https://www.googleapis.com/books/v1/volumes?q=subject:${event.subject}&key=yourAPIKey'));
//         // final data = json.decode(response.body);
        
//         final data= await CategoryRepository().getBooksforCategory(event.subject);
        
//         yield ExploreLoaded(data);
//       } catch (_) {
//         yield ExploreError();
//       }
//     }
//   }
// }
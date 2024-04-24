import 'package:bookbuddyapp/data/dataproviders/searchprovider.dart';
import 'package:bookbuddyapp/data/models/search.dart';
import 'package:bookbuddyapp/data/repositories/searchrepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
 SearchBloc():super(SearchInitial())
 {
final SearchRepository searchrepo = SearchRepository();

 on<SearchEvent>( (SearchEvent event,Emitter<SearchState> emit) async {
 if(event is FetchSearchBooks)
 {
  emit(SearchSearching());
  try{
   final searchdata = await searchrepo.getBooksforSearch(event.searchquery);
   emit(SearchFound(totresults: searchdata.length, searchlist: searchdata));
  }
  catch(_)
  {
 emit(SearchFailed());
  }
      }
    } 
  );
 }
}
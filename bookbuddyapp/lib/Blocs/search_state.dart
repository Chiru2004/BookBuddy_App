part of 'search_bloc.dart';
abstract class SearchState extends Equatable{
const SearchState();

@override
List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSearching extends SearchState {}

class SearchFound extends SearchState {

final int totresults;
final List<dynamic> searchlist;

const SearchFound({required this.totresults,required this.searchlist});
}

class SearchFailed extends SearchState {}
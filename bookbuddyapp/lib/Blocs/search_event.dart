
part of 'search_bloc.dart';
 
abstract class SearchEvent extends Equatable{
const SearchEvent();

@override
List<Object?> get props =>[];
}

class FetchSearchBooks extends SearchEvent{
final String searchquery;

const FetchSearchBooks(this.searchquery);

}
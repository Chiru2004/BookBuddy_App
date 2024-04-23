part of 'explore_bloc.dart';

@immutable
abstract class ExploreEvent extends Equatable{
const ExploreEvent();

@override
List<Object?> get props =>[];
}

class FetchExploreBooks extends ExploreEvent {
  final String subject;
 const FetchExploreBooks(this.subject);
  // event to trigger the changes 
}
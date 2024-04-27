part of 'explore_bloc.dart';

// we  define all the states that we want to insert into the app
abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object?> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<dynamic> books;
  const ExploreLoaded(this.books);
}

class ExploreError extends ExploreState {}

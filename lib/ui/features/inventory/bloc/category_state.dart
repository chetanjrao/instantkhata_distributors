import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {

  @override
  List<Object> get props => [];

}

class CategoryInitialState extends CategoryState {}

class CategorySuccessState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {

  final String error;

  CategoryErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "$error";

}
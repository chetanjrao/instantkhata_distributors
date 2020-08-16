import 'package:equatable/equatable.dart';

abstract class AddInventoryState extends Equatable {

  @override
  List<Object> get props => [];

}

class AddInventoryInitialState extends AddInventoryState {}

class AddInventorySuccessState extends AddInventoryState {}

class AddInventoryLoadingState extends AddInventoryState {}

class AddInventoryErrorState extends AddInventoryState {

  final String error;

  AddInventoryErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "$error";

}
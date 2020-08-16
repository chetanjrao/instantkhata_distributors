import 'package:equatable/equatable.dart';
import 'package:instantkhata_distributors/ui/features/retailers/data/models/retailer.dart';

abstract class RetailersState extends Equatable {

  const RetailersState();
  
  @override
  List<Object> get props => [];

}

class RetailersInitialState extends RetailersState {

}

class RetailersLoadingState extends RetailersState {
  
}

class RetailersSuccessState extends RetailersState {
  final List<RetailerModel> retailers;

  const RetailersSuccessState(this.retailers);

  @override
    List<Object> get props => [ retailers ];
  
}

class RetailersErrorState extends RetailersState {
  final String error;

  const RetailersErrorState(this.error);

  @override
  String toString() => "Error loading retailers $error";

}
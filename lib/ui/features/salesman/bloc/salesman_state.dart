import 'package:equatable/equatable.dart';
import 'package:instantkhata_distributors/ui/features/salesman/data/models/salesman.dart';

abstract class SalesmanState extends Equatable {

  const SalesmanState();
  
  @override
  List<Object> get props => [];

}

class SalesmanInitialState extends SalesmanState {

}

class SalesmanLoadingState extends SalesmanState {
  
}

class SalesmanSuccessState extends SalesmanState {
  final List<SalesmanModel> salesman;

  const SalesmanSuccessState(this.salesman);

  @override
    List<Object> get props => [ salesman ];
  
}

class SalesmanErrorState extends SalesmanState {
  final String error;

  const SalesmanErrorState(this.error);

  @override
  String toString() => "Error loading salesman $error";

}
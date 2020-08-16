import 'package:equatable/equatable.dart';

abstract class SalesmanEvent extends Equatable {
  
  SalesmanEvent();
}

class LoadAllSalesman extends SalesmanEvent {

  LoadAllSalesman();

  @override
  List<Object> get props => [];
}
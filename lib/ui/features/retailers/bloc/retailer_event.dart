import 'package:equatable/equatable.dart';

abstract class RetailersEvent extends Equatable {
  
  RetailersEvent();
}

class LoadAllRetailers extends RetailersEvent {

  LoadAllRetailers();

  @override
  List<Object> get props => [];
}
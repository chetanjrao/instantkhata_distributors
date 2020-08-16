import 'package:equatable/equatable.dart';

abstract class TransactionsEvent extends Equatable {
  
  TransactionsEvent();
}

class LoadAllTransactions extends TransactionsEvent {

  LoadAllTransactions();

  @override
  List<Object> get props => [];
}
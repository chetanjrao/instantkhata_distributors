import 'package:equatable/equatable.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/models/invoices.dart';

abstract class InvoiceState extends Equatable {

  @override
  List<Object> get props => [];

}

class InvoiceInitialState extends InvoiceState {}

class InvoiceLoadingState extends InvoiceState {}

class InvoiceSuccessState extends InvoiceState {

  final List<InvoiceModel> invoices;

  InvoiceSuccessState(this.invoices);

  @override
  List<Object> get props => [ invoices ];

}

class InvoiceErrorState extends InvoiceState {

  final String error;

  InvoiceErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "$error";

}
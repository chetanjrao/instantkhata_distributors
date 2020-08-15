import 'package:equatable/equatable.dart';

abstract class InvoiceEvent extends Equatable {}

class LoadInvoices extends InvoiceEvent {

  @override
  List<Object> get props => [];

}
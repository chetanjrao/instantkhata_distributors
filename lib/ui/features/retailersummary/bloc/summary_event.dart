import 'package:equatable/equatable.dart';

abstract class SummaryEvent extends Equatable {
  
  SummaryEvent();
}

class LoadSummary extends SummaryEvent {

  final int retailer;

  LoadSummary(this.retailer);

  @override
  List<Object> get props => [ retailer ];
}
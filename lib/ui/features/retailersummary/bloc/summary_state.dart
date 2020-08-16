import 'package:equatable/equatable.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/data/models/summary.dart';

abstract class SummaryState extends Equatable {

  const SummaryState();
  
  @override
  List<Object> get props => [];

}

class SummaryInitialState extends SummaryState {

}

class SummaryLoadingState extends SummaryState {
  
}

class SummarySuccessState extends SummaryState {
  final SummaryModel summary;

  const SummarySuccessState(this.summary);

  @override
    List<Object> get props => [ summary ];
  
}

class SummaryErrorState extends SummaryState {
  final String error;

  const SummaryErrorState(this.error);

  @override
  String toString() => "Error loading summary $error";

}
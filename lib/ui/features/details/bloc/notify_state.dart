import 'package:equatable/equatable.dart';

abstract class NotifyState extends Equatable {

  @override
  List<Object> get props => [];

}

class NotifyInitialState extends NotifyState {}

class NotifyLoadingState extends NotifyState {}

class NotifySuccessState extends NotifyState {}

class NotifyErrorState extends NotifyState {

  final String error;

  NotifyErrorState(this.error);

  @override
  String toString() => "Error notifying invoice info $error";

}
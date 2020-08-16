import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent();
}

class FetchStatistics extends StatisticsEvent {
  final int salesman;
  
  const FetchStatistics({
    @required this.salesman
  });

  @override
  List<Object> get props => [salesman];
}

class FetchRecentTransactions extends StatisticsEvent {

  final int salesman;
  
  const FetchRecentTransactions({
    @required this.salesman
  });

  @override
  List<Object> get props => [salesman];
}
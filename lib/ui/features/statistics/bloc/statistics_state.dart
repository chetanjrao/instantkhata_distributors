import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instantkhata_distributors/ui/features/statistics/data/models/statistics_models.dart';

abstract class StatisticsState extends Equatable {

  const StatisticsState();

  @override
  List<Object> get props => [];

}

class StatisticsInitial extends StatisticsState {}

class StatisticsLoading extends StatisticsState {}

class StatisticsSuccess extends StatisticsState {
  final Statistics statistics;
  final List<RecentTransactions> transactions;
  final List<SingleInvoice> invoices;

  const StatisticsSuccess({
    @required this.statistics,
    @required this.transactions,
    @required this.invoices
  });

  @override
  List<Object> get props => [statistics, transactions, invoices];

}

class StatisticsError extends StatisticsState {
  final String error;

  const StatisticsError({@required this.error});

  @override
  String toString() => "Error in statistics loading: $error";

}
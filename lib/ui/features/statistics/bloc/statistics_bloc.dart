import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instantkhata_distributors/ui/features/statistics/bloc/statistics_events.dart';
import 'package:instantkhata_distributors/ui/features/statistics/bloc/statistics_state.dart';
import 'package:instantkhata_distributors/ui/features/statistics/data/models/statistics_models.dart';
import 'package:instantkhata_distributors/ui/features/statistics/data/respository/statistics_repository.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticsRepository dashboardRepository;

  StatisticsBloc({  @required this.dashboardRepository }) : assert(dashboardRepository != null);

  @override
  Stream<StatisticsState> mapEventToState(StatisticsEvent event) async* {
    if(event is FetchStatistics){
      yield StatisticsLoading();
      try {
        final Statistics _statistics = await dashboardRepository.getStatisticsData(event.salesman);
        final List<RecentTransactions> _transactions = await dashboardRepository.getRecentTransactions(event.salesman);
        final List<SingleInvoice> invoices = await dashboardRepository.getInvoices(event.salesman);
        yield StatisticsSuccess(
          statistics: _statistics,
          transactions: _transactions,
          invoices: invoices
        );
      } catch(error){
        yield StatisticsError(error: error.toString());
      }
    }
    
  }

  @override
  StatisticsState get initialState => StatisticsInitial();

}
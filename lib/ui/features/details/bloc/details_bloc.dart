import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instantkhata_distributors/ui/features/details/bloc/details_event.dart';
import 'package:instantkhata_distributors/ui/features/details/bloc/details_state.dart';
import 'package:instantkhata_distributors/ui/features/details/data/models/details_model.dart';
import 'package:instantkhata_distributors/ui/features/details/data/repository/details_repository.dart';

class InvoiceDetailsBloc extends Bloc<InvoiceInfoEvent, InvoiceInfoState> {
  final InvoiceInfoRepository invoiceInfoRepository;

  InvoiceDetailsBloc({ @required this.invoiceInfoRepository}) : assert(invoiceInfoRepository != null);

  
  @override
  Stream<InvoiceInfoState> mapEventToState(InvoiceInfoEvent event) async* {
    if(event is LoadInvoiceInfo){
      yield InvoiceInfoLoadingState();
      try{
        InvoiceDetail invoiceInfo = await invoiceInfoRepository.getInvoiceInfo(event.invoiceID);
        bool isNotified = await this.invoiceInfoRepository.getNotificationsInfo(event.invoiceID);
        yield InvoiceInfoSuccessState(
          isNotified,
          invoiceInfo: invoiceInfo
        );
      }catch(error){
        yield InvoiceInfoErrorState(
          error: error.toString()
        );
      }
    }

    if(event is LoadInfoInitial){
      yield InvoiceInfoInitialState();
    }
  }

  @override
  InvoiceInfoState get initialState => InvoiceInfoInitialState();

}
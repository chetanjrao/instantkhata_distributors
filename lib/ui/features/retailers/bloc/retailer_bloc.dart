import 'package:bloc/bloc.dart';
import 'package:instantkhata_distributors/ui/features/retailers/bloc/retailer_event.dart';
import 'package:instantkhata_distributors/ui/features/retailers/bloc/retailer_state.dart';
import 'package:instantkhata_distributors/ui/features/retailers/data/models/retailer.dart';
import 'package:instantkhata_distributors/ui/features/retailers/data/repository/retailer.dart';

class RetailersBloc extends Bloc<RetailersEvent, RetailersState> {

  final RetailerRepository retailerRepository;

  RetailersBloc(this.retailerRepository);

  @override
  RetailersState get initialState => RetailersInitialState();
  

  @override
  Stream<RetailersState> mapEventToState(RetailersEvent event) async* {
    if(event is LoadAllRetailers){
      yield RetailersLoadingState();
      try{
        List<RetailerModel> transactions = await retailerRepository.getRetailers();
        yield RetailersSuccessState(transactions);
      }catch(error){
        yield RetailersErrorState(
          error.toString()
        );
      }
    }
  }

}
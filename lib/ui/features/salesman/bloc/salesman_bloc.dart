import 'package:bloc/bloc.dart';
import 'package:instantkhata_distributors/ui/features/salesman/bloc/salesman_event.dart';
import 'package:instantkhata_distributors/ui/features/salesman/bloc/salesman_state.dart';
import 'package:instantkhata_distributors/ui/features/salesman/data/models/salesman.dart';
import 'package:instantkhata_distributors/ui/features/salesman/data/repository/salesman.dart';

class SalesmanBloc extends Bloc<SalesmanEvent, SalesmanState> {

  final SalesmanRepository retailerRepository;

  SalesmanBloc(this.retailerRepository);

  @override
  SalesmanState get initialState => SalesmanInitialState();
  

  @override
  Stream<SalesmanState> mapEventToState(SalesmanEvent event) async* {
    if(event is LoadAllSalesman){
      yield SalesmanLoadingState();
      try{
        List<SalesmanModel> salesman = await retailerRepository.getSalesman();
        yield SalesmanSuccessState(salesman);
      }catch(error){
        yield SalesmanErrorState(
          error.toString()
        );
      }
    }
  }

}
import 'package:bloc/bloc.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/bloc/summary_event.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/bloc/summary_state.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/data/models/summary.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/data/repository/summary.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {

  final SummaryRepository summaryRepository;

  SummaryBloc(this.summaryRepository);

  @override
  SummaryState get initialState => SummaryInitialState();
  

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if(event is LoadSummary){
      yield SummaryLoadingState();
      try{
        SummaryModel summary = await summaryRepository.getSummary(event.retailer);
        yield SummarySuccessState(summary);
      }catch(error){
        yield SummaryErrorState(
          error.toString()
        );
      }
    }
  }

}
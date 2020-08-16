import 'package:bloc/bloc.dart';
import 'package:instantkhata_distributors/ui/features/details/bloc/notify_event.dart';
import 'package:instantkhata_distributors/ui/features/details/bloc/notify_state.dart';
import 'package:instantkhata_distributors/ui/features/details/data/repository/notify_repostory.dart';

class NotifyBloc extends Bloc<NotifyEvent, NotifyState> {

  NotifyRepository notifyRepository = new NotifyRepository();

  @override
  NotifyState get initialState => NotifyInitialState();

  @override
  Stream<NotifyState> mapEventToState(NotifyEvent event) async* {
    if(event is SendNotification){
      yield NotifyLoadingState();
      try {
        Map<String, dynamic> noitification = await this.notifyRepository.sendNotification(event.invoice);
        yield NotifySuccessState();
      }catch(error){
        yield NotifyErrorState(error.toString());
      }
    }
  }
  
  

}
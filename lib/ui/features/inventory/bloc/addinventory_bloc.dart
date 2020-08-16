import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/addinventory_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/addinventory_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/repository/inventory.dart';

class AddInventoryBloc extends Bloc<AddInventoryEvent, AddInventoryState> {

  InventoryRepository inventoryRepository = new InventoryRepository();


  @override
  AddInventoryState get initialState => AddInventoryInitialState();

  @override
  Stream<AddInventoryState> mapEventToState(AddInventoryEvent event) async* {
    if(event is AddNewInventoryEvent){
      yield AddInventoryLoadingState();
      try {
        await this.inventoryRepository.addNewInventory(event.name, event.mrp, event.hsn, event.basePrice, event.type, event.quantity);
        yield AddInventorySuccessState();
      } catch(error){
        yield AddInventoryErrorState(error.toString());
      }
    }
  }

  

}
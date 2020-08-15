import 'package:bloc/bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/models/inventory.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/repository/inventory.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {

  final InventoryRepository inventoryRepository;

  InventoryBloc(this.inventoryRepository): assert(inventoryRepository != null);

  @override
  InventoryState get initialState => InventoryInitialState();

  @override
  Stream<InventoryState> mapEventToState(InventoryEvent event) async* {
    if(event is LoadInventory){
      yield InventoryLoadingState();
      try {
        List<InventoryModel> inventory = await this.inventoryRepository.getInventory();
        List<CategoryModel> categories = await this.inventoryRepository.getCategories();
        yield InventorySuccessState(inventory, categories);
      } catch(error){
        yield InventoryErrorState(error.toString());
      }

    }
  }

  

}
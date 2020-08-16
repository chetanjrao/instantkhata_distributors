import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/category_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/category_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/repository/inventory.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  InventoryRepository inventoryRepository = new InventoryRepository();


  @override
  CategoryState get initialState => CategoryInitialState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if(event is AddCategoryEvent){
      yield CategoryLoadingState();
      try {
        await this.inventoryRepository.addCategory(event.name);
        yield CategorySuccessState();
      } catch(error){
        yield CategoryErrorState(error.toString());
      }
    }
  }

  

}
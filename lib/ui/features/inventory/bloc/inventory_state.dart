import 'package:equatable/equatable.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/models/inventory.dart';

abstract class InventoryState extends Equatable {

  @override
  List<Object> get props => [];

}

class InventoryInitialState extends InventoryState {}

class InventoryLoadingState extends InventoryState {}

class InventorySuccessState extends InventoryState {

  final List<InventoryModel> inventory;
  final List<CategoryModel> categories;

  InventorySuccessState(this.inventory, this.categories);

  @override
  List<Object> get props => [inventory, categories];

}

class InventoryErrorState extends InventoryState {

  final String error;

  InventoryErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "$error";

}
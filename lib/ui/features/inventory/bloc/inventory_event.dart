import 'package:equatable/equatable.dart';

abstract class InventoryEvent extends Equatable {}

class LoadInventory extends InventoryEvent{

  @override
  List<Object> get props => [];

}

import 'package:equatable/equatable.dart';

abstract class AddInventoryEvent extends Equatable {
  
}

class AddNewInventoryEvent extends AddInventoryEvent {

  final String name;
  final double mrp;
  final String hsn;
  final double basePrice;
  final int type;
  final int quantity;

  AddNewInventoryEvent(this.name, this.mrp, this.hsn, this.basePrice, this.type, this.quantity);

  @override
  List<Object> get props => [ name, mrp, hsn, basePrice, type, quantity ];

}
import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  
}

class AddCategoryEvent extends CategoryEvent {

  final String name;

  AddCategoryEvent(this.name);

  @override
  List<Object> get props => [ name ];

}
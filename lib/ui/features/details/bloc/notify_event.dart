import 'package:equatable/equatable.dart';

abstract class NotifyEvent extends Equatable {}

class SendNotification extends NotifyEvent {

  final String invoice;

  SendNotification(this.invoice);

  @override
  List<Object> get props => [ invoice ];

}
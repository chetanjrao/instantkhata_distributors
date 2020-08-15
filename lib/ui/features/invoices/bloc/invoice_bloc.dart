import 'package:bloc/bloc.dart';
import 'package:instantkhata_distributors/ui/features/invoices/bloc/invoice_event.dart';
import 'package:instantkhata_distributors/ui/features/invoices/bloc/invoice_state.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/models/invoices.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/repository/invoices.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {

  final InvoiceRepository invoiceRepository;

  InvoiceBloc(this.invoiceRepository): assert(invoiceRepository != null);


  @override
  InvoiceState get initialState => InvoiceInitialState();

  @override
  Stream<InvoiceState> mapEventToState(InvoiceEvent event) async* {
    if(event is LoadInvoices){
      yield InvoiceLoadingState();
      try{
        List<InvoiceModel> invoices = await this.invoiceRepository.getInvoices();
        yield InvoiceSuccessState(invoices);
      } catch(error){
        yield InvoiceErrorState(
          error.toString()
        );
      }
      
    }
  }

} 
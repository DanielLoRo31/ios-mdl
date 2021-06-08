import 'package:cc_flutter_mobile/data/repositories/transaction_repository.dart';
import 'package:cc_flutter_mobile/bloc/transaction/make/transaction/make_transaction_event.dart';
import 'package:cc_flutter_mobile/bloc/transaction/make/transaction/make_transaction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../submit_transaction.dart';

class MakeTransactionBloc extends Bloc<MakeTransactionEvent, MakeTransactionState> {
  final TransactionRepository transactionRepository;

  MakeTransactionBloc({this.transactionRepository}) : super(MakeTransactionState());

  @override
  Stream<MakeTransactionState> mapEventToState(MakeTransactionEvent event) async* {
    // Username updated
    if (event is QuantityChanged) {
      yield state.copyWith(quantity: event.quantity);

      // Password updated
    } else if (event is TransactionTypeIDChanged) {
      yield state.copyWith(transactionType: event.transactionType);

      // Form submitted
    } else if (event is DestinationCodeChanged) {
      yield state.copyWith(destinationCode: event.code);

      // Form submitted
    } else if (event is ConceptChanged) {
      yield state.copyWith(concept: event.concept);

      // Form submitted
    } else if (event is OriginCodeChanged) {
      yield state.copyWith(originCode: event.code);

      // Form submitted
    } else if (event is TransactionSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await transactionRepository.makeTransaction();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
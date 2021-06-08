import 'package:cc_flutter_mobile/bloc/transaction/make/submit_transaction.dart';

class MakeTransactionState {
  final double quantity;
  final int transactionType;
  final String destinationCode;
  final String concept;
  final String originCode;
  final FormStatus formStatus;

  MakeTransactionState({
    this.quantity = 0.0,
    this.transactionType = 0,
    this.destinationCode = '',
    this.concept = '',
    this.originCode = '',
    this.formStatus = const InitialFormStatus(),
  });

  MakeTransactionState copyWith({
    double quantity,
    int transactionType,
    String destinationCode,
    String concept,
    String originCode,
    FormStatus formStatus,
  }) {
    return MakeTransactionState(
      quantity: quantity ?? this.quantity,
      transactionType: transactionType ?? this.quantity,
      destinationCode: destinationCode ?? this.destinationCode,
      concept: concept ?? this.concept,
      originCode: originCode ?? this.originCode,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
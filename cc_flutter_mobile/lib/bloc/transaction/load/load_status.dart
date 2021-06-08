import 'package:cc_flutter_mobile/data/model/transaction.dart';

abstract class LoadStatus {
  const LoadStatus();
}

class InitialStatus extends LoadStatus {
  const InitialStatus();
}

class LoadingStatus extends LoadStatus {}

class LoadedStatus extends LoadStatus {
  final List<TransactionUser> transactions;

  LoadedStatus({this.transactions});
}

class ErrorLoad extends LoadStatus {
  final Exception exception;

  ErrorLoad(this.exception);
}
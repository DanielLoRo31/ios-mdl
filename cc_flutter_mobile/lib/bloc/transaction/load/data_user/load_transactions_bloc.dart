import 'package:bloc/bloc.dart';
import 'package:cc_flutter_mobile/bloc/transaction/load/data_user/load_transactions_event.dart';
import 'package:cc_flutter_mobile/bloc/transaction/load/data_user/load_transactions_state.dart';
import 'package:cc_flutter_mobile/bloc/transaction/load/load_status.dart';
import 'package:cc_flutter_mobile/data/model/transaction.dart';
import 'package:cc_flutter_mobile/data/repositories/transaction_repository.dart';

class LoadTransactionsBloc extends Bloc<LoadTransactionsEvent, LoadTransactionsState> {
  final TransactionRepository transactionRepository;

  LoadTransactionsBloc({this.transactionRepository}) : super(LoadTransactionsState());

  @override
  Stream<LoadTransactionsState> mapEventToState(LoadTransactionsEvent event) async* {
    if (event is FetchTransactionsUser) {
      try {
        final List<TransactionUser> _transactions = (await transactionRepository.findUserTransactions('hardcoded code mdf'));
        print(_transactions);
        yield state.copyWith(loadStatus: LoadedStatus(transactions: _transactions));
        // yield
      } catch (e) {
        print(e);
        yield state.copyWith(loadStatus: ErrorLoad(e));
      }
    }
  }
}
import 'package:cc_flutter_mobile/bloc/transaction/load/load_transactionuser_blocs.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/data/model/transaction.dart';
import 'package:cc_flutter_mobile/presentation/screens/list/widgets/list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_toggle_buttons.dart';

class ListViewTransactions extends StatefulWidget {
  @override
  _ListViewTransactionsState createState() => _ListViewTransactionsState();
}

class _ListViewTransactionsState extends State<ListViewTransactions> {
  Widget _buildList(List<TransactionUser> transactions) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return ListCard(
          date: 'hardcoded',
          transactionStatus: 1,
          from: transactions[i].id.toString(),
          quantity: 10.0,
          transactionType: 1,
          concept: '12345',
        );
      },
      itemCount: transactions.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Container(
      height: height - 520,
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(bottom: 25),
            color: Palette.lightBlack,
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    'Filters',
                    style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 3 * space,
                  ),
                  CustomToggleButtons(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: space,
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: Theme(
                data: ThemeData(
                  accentColor: Palette.lightGreen,
                ),
                child: BlocBuilder<LoadTransactionsBloc, LoadTransactionsState>(
                    builder: (context, state) {
                  print('start');
                  final status = state.loadStatus;
                  context
                      .read<LoadTransactionsBloc>()
                      .add(FetchTransactionsUser());
                  if (status is LoadingStatus) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (status is LoadedStatus) {
                    return _buildList(status.transactions);
                  }
                  if (status is ErrorLoad) {
                    return Center(
                      child: Text('Error :('),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

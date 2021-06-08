import 'package:cc_flutter_mobile/bloc/transaction/make/make_transaction_blocs.dart';
import 'package:cc_flutter_mobile/data/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/screens/transaction/widgets/transaction_form_card.dart';
import 'package:cc_flutter_mobile/presentation/screens/transaction/widgets/transaction_status_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/title_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/options_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.blackBg,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MakeTransactionBloc(
              transactionRepository: context.read<TransactionRepository>(),
            ),
          ),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TitleCard(
                content: 'Send money to anyone\nyou want',
                title: 'Make a transaction *-*',
                styleType: 'Surprise',
                width: 50,
                fSize1: 18,
                height: 50,
                fSize2: 16,
              ),
              SizedBox(
                height: space,
              ),
              TransactionStatusCard(),
              SizedBox(
                height: space,
              ),
              TransactionFormCard(),
              SizedBox(
                height: 6 * space,
              ),
              OptionsCard(
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cc_flutter_mobile/bloc/transaction/load/load_transactionuser_blocs.dart';
import 'package:cc_flutter_mobile/bloc/user/load/data/load_user_bloc.dart';
import 'package:cc_flutter_mobile/data/repositories/transaction_repository.dart';
import 'package:cc_flutter_mobile/presentation/screens/list/widgets/list_view.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/status_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/title_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/options_card.dart';
import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// My packages
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
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
          BlocProvider(create: (context) => LoadTransactionsBloc(
              transactionRepository: context.read<TransactionRepository>())),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 320,
                automaticallyImplyLeading: false,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TitleCard(
                        content: 'Check your all transactions',
                        title: 'Transactions list',
                        styleType: 'Surprise',
                        width: 50,
                        fSize1: 18,
                        height: 50,
                        fSize2: 16,
                      ),
                      SizedBox(
                        height: space,
                      ),
                      StatusCard(),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 2 * space,
                    ),
                    Center(
                      child: Icon(
                        Icons.swap_vert,
                        color: Palette.darkGreen,
                      ),
                    ),
                    SizedBox(
                      height: 2 * space,
                    ),
                    ListViewTransactions(),
                    SizedBox(
                      height: space,
                    ),
                    OptionsCard(
                      onTap: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

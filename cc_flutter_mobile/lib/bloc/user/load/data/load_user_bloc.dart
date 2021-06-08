import 'package:cc_flutter_mobile/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cc_flutter_mobile/bloc/user/load/data/load_user_state.dart';
import 'package:cc_flutter_mobile/bloc/user/load/data/load_user_event.dart';
import 'package:cc_flutter_mobile/bloc/user/load/load_status.dart';

class LoadUserBloc extends Bloc<LoadUserEvent, LoadUserState> {
  final UserRepository userRepository;

  LoadUserBloc({this.userRepository}) : super(LoadUserState());

  @override
  Stream<LoadUserState> mapEventToState(LoadUserEvent event) async* {
    if (event is FetchUser) {
      try {
        final _user = (await userRepository.findAccountByEmail('hardcoded code mdf'));
        print(_user);
        yield state.copyWith(loadStatus: LoadedStatus(user: _user));
        // yield
      } catch (e) {
        print(e);
        yield state.copyWith(loadStatus: ErrorLoad(e));
      }
    }
  }
}
import 'package:cc_flutter_mobile/data/model/user.dart';

abstract class LoadStatus {
  const LoadStatus();
}

class InitialStatus extends LoadStatus {
  const InitialStatus();
}

class LoadingStatus extends LoadStatus {}

class LoadedStatus extends LoadStatus {
  final UserData user;

  LoadedStatus({this.user});
}

class ErrorLoad extends LoadStatus {
  final Exception exception;

  ErrorLoad(this.exception);
}
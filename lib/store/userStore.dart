import 'package:rxdart/rxdart.dart';

enum UserType { regular, guest }

class UserStore {
  final BehaviorSubject<UserType?> _userType = BehaviorSubject.seeded(null);
  final BehaviorSubject<String?> _authToken = BehaviorSubject.seeded(null);

  ValueStream<UserType?> get userTpye$ => _userType.stream;
  ValueStream<String?> get authToken$ => _authToken.stream;

  UserType? get userTpye => _userType.valueOrNull;
  String? get authToken => _authToken.valueOrNull;

  setUserType(UserType state) {
    _userType.sink.add(state);
  }

  setUserToken(String state) {
    _authToken.sink.add(state);
    _userType.sink.add(UserType.regular);
  }

  logout() {
    _userType.sink.add(null);
    _authToken.sink.add(null);
  }

  dispose() {
    _userType.close();
    _authToken.close();
  }
}

final UserStore userStore = UserStore();

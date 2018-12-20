import 'package:meta/meta.dart';

class NonNull<T> {
  T _it;
  final bool _harsh;

  NonNull({
    @required T it,
    bool harsh = false,
  })  : _it = it,
        _harsh = harsh;

  void setIt(T it) {
    if (it == null) {
      try {
        throw Exception('NonNull value cannot be set to null!');
      } catch (e, s) {
        if (_harsh) {
          rethrow;
        } else {
          print('NonNull value cannot be set to null!');
          print(s);
        }
      }
    } else {
      _it = it;
    }
  }

  T getIt() {
    return _it;
  }
}

class Nullable<T> {
  T _it;

  Nullable({T it}) : _it = it;

  void setIt(T it) {
    _it = it;
  }

  void getIt({@required void Function(T) itsNotNull, void Function() itsNull}) {
    if (_it != null) {
      itsNotNull(_it);
    } else {
      if (itsNull != null) itsNull();
    }
  }
}

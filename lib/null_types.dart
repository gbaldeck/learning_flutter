import 'package:meta/meta.dart';

class NonNull<T> {
  T _it;

  NonNull({@required T it}) : _it = it;

  void setIt(T it, bool isItNull, [T ifItsNull]) {
    if (!isItNull)
      _it = it;
    else if (ifItsNull != null) _it = ifItsNull;
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

  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  }) {
    if (_it != null)
      itsNotNull(_it);
    else if (itsNull != null) itsNull();
  }
}

class NullFallback<T> {
  T _it;
  T _fallback;

  NullFallback({T it, @required T fallback})
      : _it = it,
        _fallback = fallback;

  void setIt(T it) {
    _it = it;
  }

  T getIt([T fallback]) {
    if (_it != null) {
      return _it;
    } else {
      if (fallback != null)
        return fallback;
      else
        return _fallback;
    }
  }

  bool get isNull => _it == null;
}

import 'package:meta/meta.dart';

class NonNull<T> {
  T _it;
  T _fallback;

  NonNull({@required T it, @required T fallback})
      : _it = it,
        _fallback = fallback;

  void setIt(T it, [T fallback]) {
    if (it != null) {
      _it = it;
    } else {
      if (fallback != null)
        _it = fallback;
      else
        _it = _fallback;
    }
  }

  T getIt() {
    return _it;
  }
}

class Nullable<T> {
  T _it;
  T _fallback;

  Nullable({T it, @required T fallback})
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
}

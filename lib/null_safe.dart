import 'package:meta/meta.dart';

class NullSafe<T> {
  T _it;
  T _fallback;

  NullSafe({T it, @required T fallback})
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

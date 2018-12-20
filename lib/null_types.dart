import 'package:meta/meta.dart';

class NonNull<T> {
  T _it;

  NonNull({@required T it}) : _it = it;

  void setIt(T it, bool nullCheck, [void Function(void Function(T)) itsNull]) {
    if (!nullCheck) {
      _it = it;
    } else {
      if (itsNull != null) itsNull(_internalSetIt);
    }
  }

  T getIt() {
    return _it;
  }

  void _internalSetIt(T it){
    _it = it;
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

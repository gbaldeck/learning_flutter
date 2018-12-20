class NonNull<T> {
  T _it;

  NonNull(T it) : _it = it;

  void setIt(T it, bool nullCheck, [void Function() itsNull]) {
    if (!nullCheck) {
      _it = it;
    } else {
      if (itsNull != null) itsNull();
    }
  }

  T getIt() {
    return _it;
  }
}

class Nullable<T> {
  T _it;

  Nullable([T it]) : _it = it;

  void setIt(T it) {
    _it = it;
  }

  void getIt(void Function(T) itsNotNull, [void Function() itsNull]) {
    if (_it != null) {
      itsNotNull(_it);
    } else {
      if (itsNull != null) itsNull();
    }
  }
}

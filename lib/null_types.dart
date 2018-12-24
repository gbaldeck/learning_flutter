import 'package:flutter/material.dart';
//import 'package:meta/meta.dart'; //for regular dart without flutter

class MutableNonNull<T> extends NonNull<T> {
  @override
  T _it;
  @override
  final bool _emptyStringIsNull;

  MutableNonNull({@required T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull {
    if (_it == null || (_emptyStringIsNull && _it is String && _it == ""))
      throw Exception("'it' can't be null!");
  }

  MutableNonNull.safe(
      {@required T it, @required T ifItsNull, bool emptyStringIsNull = false})
      : _it = it ?? ifItsNull,
        _emptyStringIsNull = emptyStringIsNull {
    if (ifItsNull == null ||
        (_emptyStringIsNull && ifItsNull is String && ifItsNull == ""))
      throw Exception(
          "'ifItsNull' cannot be null! 'ifItsNull' is meant as a fallback and should never be capable of being null.");
  }

  void setIt(T it, {T ifItsNull}) {
    if (it != null && !(_emptyStringIsNull && it is String && it == "")) {
      _it = it;
    } else if (ifItsNull != null &&
        !(_emptyStringIsNull && ifItsNull is String && ifItsNull == "")) {
      _it = ifItsNull;
    } else {
      try {
        throw Exception();
      } catch (e, s) {
        debugPrint("WARNING: 'it' was not set!\n$s");
//        print("WARNING: 'it' was not set!\n$s"); //for regular dart without flutter
      }
    }
  }
}

class NonNull<T> {
  final T _it;
  final bool _emptyStringIsNull;

  const NonNull({@required T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull;

  T getIt() {
    return _it;
  }

  NonNull.safe(
      {@required T it, @required T ifItsNull, bool emptyStringIsNull = false})
      : _it = it ?? ifItsNull,
        _emptyStringIsNull = emptyStringIsNull {
    if (ifItsNull == null ||
        (_emptyStringIsNull && ifItsNull is String && ifItsNull == ""))
      throw Exception(
          "'ifItsNull' cannot be null! 'ifItsNull' is meant as a fallback and should never be capable of being null.");
  }

  MutableNullable<T> mutableNullable({bool emptyStringIsNull}) {
    return MutableNullable(
      it: _it,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }

  Nullable<T> nullable({bool emptyStringIsNull}) {
    return Nullable(
      it: _it,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }
}

class MutableNullable<T> extends Nullable<T> {
  @override
  T _it;
  @override
  final bool _emptyStringIsNull;

  MutableNullable({T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull;

  void setIt(T it) {
    _it = it;
  }

  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  }) {
    if (_it != null && !(_emptyStringIsNull && _it is String && _it == ""))
      itsNotNull(_it);
    else if (itsNull != null) itsNull();
  }
}

class Nullable<T> {
  final T _it;
  final bool _emptyStringIsNull;

  const Nullable({T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull;

  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  }) {
    if (_it != null && !(_emptyStringIsNull && _it is String && _it == ""))
      itsNotNull(_it);
    else if (itsNull != null) itsNull();
  }

  MutableNonNull<T> mutableNonNull(
      {@required T ifItsNull, bool emptyStringIsNull}) {
    return MutableNonNull.safe(
      it: _it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }

  NonNull<T> nonNull(
      {@required T ifItsNull, bool emptyStringIsNull}) {
    return NonNull.safe(
      it: _it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }
}

import 'package:flutter/material.dart';
//import 'package:meta/meta.dart'; //for regular dart without flutter

abstract class NonNullBase<T>{
  const NonNullBase();
  T getIt();
  Nullable<T> nullable({bool emptyStringIsNull, bool itsFinal = false});
}

class NonNull<T> extends NonNullBase<T> {
  T _it;
  final bool _emptyStringIsNull;
  final bool _itsFinal;

  NonNull(
      {@required T it, bool emptyStringIsNull = false, bool itsFinal = false})
      : _it = it,
        _itsFinal = itsFinal,
        _emptyStringIsNull = emptyStringIsNull {
    if (_it == null || (_emptyStringIsNull && _it is String && _it == ""))
      throw Exception("'it' can't be null!");
  }

  NonNull.safe(
      {@required T it,
      @required T ifItsNull,
      bool emptyStringIsNull = false,
      bool itsFinal = false})
      : _it = it ?? ifItsNull,
        _itsFinal = itsFinal,
        _emptyStringIsNull = emptyStringIsNull {
    if (ifItsNull == null ||
        (_emptyStringIsNull && ifItsNull is String && ifItsNull == ""))
      throw Exception(
          "'ifItsNull' cannot be null! 'ifItsNull' is meant as a fallback and should never be capable of being null.");
  }

  void setIt(T it, {T ifItsNull}) {
    if (!_itsFinal) {
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
    } else {
      throw Exception(
          "The NonNull value is set to final and cannot be changed!");
    }
  }

  T getIt() {
    return _it;
  }

  Nullable<T> nullable({bool emptyStringIsNull, bool itsFinal = false}) {
    return Nullable(
      it: _it,
      itsFinal: itsFinal,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }
}

class NonNullImmutable<T> extends NonNullBase<T> {
  final T _it;
  final bool _emptyStringIsNull;

  const NonNullImmutable(
      {@required T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull;

  T getIt() {
    return _it;
  }

  Nullable<T> nullable({bool emptyStringIsNull, bool itsFinal = false}) {
    return Nullable(
      it: _it,
      itsFinal: itsFinal,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }
}

abstract class NullableBase<T>{
  const NullableBase();
  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  });
  NonNull<T> nonNull(
      {@required T ifItsNull, bool emptyStringIsNull, bool itsFinal});
}

class Nullable<T> extends NullableBase<T> {
  T _it;
  final bool _itsFinal;
  final bool _emptyStringIsNull;

  Nullable({T it, bool emptyStringIsNull = false, bool itsFinal = false})
      : _it = it,
        _itsFinal = itsFinal,
        _emptyStringIsNull = emptyStringIsNull;

  void setIt(T it) {
    if (!_itsFinal) {
      _it = it;
    } else {
      throw Exception(
          "The Nullable value is set to final and cannot be changed!");
    }
  }

  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  }) {
    if (_it != null && !(_emptyStringIsNull && _it is String && _it == ""))
      itsNotNull(_it);
    else if (itsNull != null) itsNull();
  }

  NonNull<T> nonNull(
      {@required T ifItsNull, bool emptyStringIsNull, bool itsFinal}) {
    return NonNull.safe(
      it: _it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
      itsFinal: itsFinal ?? _itsFinal,
    );
  }
}

class NullableConst<T> extends NullableBase<T> {
  final T _it;
  final bool _emptyStringIsNull;

  const NullableConst({T it, bool emptyStringIsNull = false})
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

  NonNull<T> nonNull(
      {@required T ifItsNull, bool emptyStringIsNull, bool itsFinal = false}) {
    return NonNull.safe(
      it: _it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
      itsFinal: itsFinal,
    );
  }
}
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart'; //for regular dart without flutter

NonNull<T> nonNullOf<T>(
        {@required T it, T ifItsNull, bool emptyStringIsNull = false}) =>
    _MutableNonNullImpl(
      it: it,
      emptyStringIsNull: emptyStringIsNull,
    );

MutableNonNull<T> mutableNonNullOf<T>(
        {@required T it, bool emptyStringIsNull = false}) =>
    _MutableNonNullImpl(
      it: it,
      emptyStringIsNull: emptyStringIsNull,
    );

NonNull<T> safeNonNullOf<T>(
        {@required T it,
        @required T ifItsNull,
        bool emptyStringIsNull = false}) =>
    _MutableNonNullImpl.safe(
      it: it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull,
    );

MutableNonNull<T> safeMutableNonNullOf<T>(
        {@required T it,
        @required T ifItsNull,
        bool emptyStringIsNull = false}) =>
    _MutableNonNullImpl.safe(
      it: it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull,
    );

Nullable<T> nullableOf<T>({T it, bool emptyStringIsNull = false}) =>
    _MutableNullableImpl(
      it: it,
      emptyStringIsNull: emptyStringIsNull,
    );

MutableNullable<T> mutableNullableOf<T>(
        {T it, bool emptyStringIsNull = false}) =>
    _MutableNullableImpl(
      it: it,
      emptyStringIsNull: emptyStringIsNull,
    );

/////////////////////////////
///////NonNull interface////
/////////////////////////////

abstract class NonNull<T> {
  T getIt();

  MutableNullable<T> copyAsMutableNullable({bool emptyStringIsNull});

  Nullable<T> copyAsNullable({bool emptyStringIsNull});

  NonNull<T> copyAsNonNull({bool emptyStringIsNull});

  MutableNonNull<T> copyAsMutableNonNull({bool emptyStringIsNull});
}

///////////////////////////////////
///////MutableNonNull interface////
///////////////////////////////////

abstract class MutableNonNull<T> extends NonNull<T> {
  void setIt(T it, {T ifItsNull});
}

///////////////////////////////////////////
////////_MutableNonNullImpl class//////////
///////////////////////////////////////////

class _MutableNonNullImpl<T> extends MutableNonNull<T> {
  T _it;
  final bool _emptyStringIsNull;

  _MutableNonNullImpl({@required T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull {
    if (_it == null || (_emptyStringIsNull && _it is String && _it == ""))
      throw Exception("'it' can't be null!");
  }

  _MutableNonNullImpl.safe(
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

  T getIt() {
    return _it;
  }

  MutableNullable<T> copyAsMutableNullable({bool emptyStringIsNull}) {
    return _MutableNullableImpl(
      it: _it,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }

  Nullable<T> copyAsNullable({bool emptyStringIsNull}) {
    return copyAsMutableNullable(emptyStringIsNull: emptyStringIsNull);
  }

  NonNull<T> copyAsNonNull({bool emptyStringIsNull}) {
    return copyAsMutableNonNull(emptyStringIsNull: emptyStringIsNull);
  }

  MutableNonNull<T> copyAsMutableNonNull({bool emptyStringIsNull}) {
    return _MutableNonNullImpl(
      it: _it,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }
}

/////////////////////////////
///////Nullable interface////
/////////////////////////////

abstract class Nullable<T> {
  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  });

  MutableNonNull<T> copyAsMutableNonNull(
      {@required T ifItsNull, bool emptyStringIsNull});

  NonNull<T> copyAsNonNull({@required T ifItsNull, bool emptyStringIsNull});

  Nullable<T> copyAsNullable({bool emptyStringIsNull});

  MutableNullable<T> copyAsMutableNullable({bool emptyStringIsNull});
}

///////////////////////////////////////
////////MutableNullable interface//////////
///////////////////////////////////////

abstract class MutableNullable<T> extends Nullable<T> {
  void setIt(T it);
}

///////////////////////////////////////
////////MutableNullable class//////////
///////////////////////////////////////

class _MutableNullableImpl<T> extends MutableNullable<T> {
  T _it;
  final bool _emptyStringIsNull;

  _MutableNullableImpl({T it, bool emptyStringIsNull = false})
      : _it = it,
        _emptyStringIsNull = emptyStringIsNull;

  void setIt(T it) {
    _it = it;
  }

  @override
  void getIt({
    @required void Function(T) itsNotNull,
    void Function() itsNull,
  }) {
    if (_it != null && !(_emptyStringIsNull && _it is String && _it == ""))
      itsNotNull(_it);
    else if (itsNull != null) itsNull();
  }

  @override
  MutableNonNull<T> copyAsMutableNonNull(
      {@required T ifItsNull, bool emptyStringIsNull}) {
    return _MutableNonNullImpl.safe(
      it: _it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }

  @override
  NonNull<T> copyAsNonNull({@required T ifItsNull, bool emptyStringIsNull}) {
    return _MutableNonNullImpl.safe(
      it: _it,
      ifItsNull: ifItsNull,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }

  @override
  Nullable<T> copyAsNullable({bool emptyStringIsNull}) {
    return copyAsMutableNullable(emptyStringIsNull: emptyStringIsNull);
  }

  @override
  MutableNullable<T> copyAsMutableNullable({bool emptyStringIsNull}) {
    return _MutableNullableImpl(
      it: _it,
      emptyStringIsNull: emptyStringIsNull ?? _emptyStringIsNull,
    );
  }
}

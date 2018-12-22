import 'package:flutter/material.dart';

class NonNullable<T> {
  T _it;
  Nullable<T> _nullable;

  NonNullable({@required T it}) : _it = it {
    if (_it == null) throw Exception("'it' can't be null!");
  }

  NonNullable.unsafe({@required T it, @required T ifItsNull})
      : _it = it == null ? ifItsNull : it {
    if (_it == null) throw Exception("Either 'it' or 'ifItsNull' can be null... not both!");
  }

  void setIt(T it, [T ifItsNull]) {
    if (it != null) {
      _it = it;
    }else if (ifItsNull != null){
      _it = ifItsNull;
    }else {
      try{
        throw Exception();
      }catch(e, s){
        debugPrint("WARNING: 'it' was not set!\n$s");
      }
    }
  }

  T getIt() {
    return _it;
  }

  Nullable<T> nullable() {
    if(_nullable == null)
      _nullable = Nullable(
        it: _it,
      );

    return _nullable;
  }
}

class Nullable<T> {
  T _it;
  NonNullable<T> _nonNullable;

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

  NonNullable<T> nonNullable(T ifItsNull) {
    if(_nonNullable == null)
      _nonNullable = NonNullable.unsafe(
        it: _it,
        ifItsNull: ifItsNull,
      );

    return _nonNullable;
  }
}

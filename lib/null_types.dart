import 'package:flutter/material.dart';
//import 'package:meta/meta.dart'; //for regular dart without flutter

class NonNull<T> {
  T _it;
  Nullable<T> _nullable;

  NonNull({@required T it}) : _it = it {
    if (_it == null) throw Exception("'it' can't be null!");
  }

  NonNull.unsafe({@required T it, @required T ifItsNull})
      : _it = it ?? ifItsNull {
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
//        print("WARNING: 'it' was not set!\n$s"); //for regular dart without flutter
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
  NonNull<T> _nonNull;

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

  NonNull<T> nonNull(T ifItsNull) {
    if(_nonNull == null)
      _nonNull = NonNull.unsafe(
        it: _it,
        ifItsNull: ifItsNull,
      );

    return _nonNull;
  }
}

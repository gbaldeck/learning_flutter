import 'package:flutter/material.dart';

class NonNull<T> {
  T _value;
  T Function(T) _evaluator;

  NonNull({T value, @required T Function(T) evaluator})
      : _value = value,
        _evaluator = evaluator;

  T call([T value]){
    if(value != null)
      _value = value;

    return _value;
  }
}

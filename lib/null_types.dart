import 'package:meta/meta.dart';

class NonNull<T> {
  T _value;
  final bool _harsh;

  NonNull({
    @required T value,
    bool harsh = false,
  })  : _value = value,
        _harsh = harsh;

  void setIt(T value) {
    if (value == null) {
      try {
        throw Exception('NonNull value cannot be set to null!');
      } catch (e, s) {
        if (_harsh) {
          rethrow;
        } else {
          print('NonNull value cannot be set to null!');
          print(s);
        }
      }
    } else {
      _value = value;
    }
  }

  T getIt() {
    return _value;
  }
}

class Nullable<T> {
  T _value;

  Nullable({T value}) : _value = value;

  void setIt(T value) {
    _value = value;
  }

  void getIt({@required void Function(T) isNotNull, void Function() isNull}) {
    if (_value != null) {
      isNotNull(_value);
    } else {
      if (isNull != null) isNull();
    }
  }
}

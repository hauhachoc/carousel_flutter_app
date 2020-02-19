import 'package:flutter/widgets.dart';

Type _typeOf<T>() => T;

abstract class BaseBloc<T> extends ChangeNotifier {
  BuildContext mContext;
  T status;
  void init(){    
  }
  void setStatus(T value) {
    status = value;
    notifyListeners();
  }

  @override
  void dispose() {}
}

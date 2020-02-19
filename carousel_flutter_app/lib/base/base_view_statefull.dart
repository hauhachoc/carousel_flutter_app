import 'package:carousel_flutter_app/blocs/base_bloc.dart';
import 'package:carousel_flutter_app/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';


class BaseView<T extends BaseBloc> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final BuildContext context;
  bool modelNotNull = false;
  T model;

  BaseView({this.builder, this.onModelReady, Key key, this.model, this.context})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseBloc> extends State<BaseView<T>> {
  @override
  void initState() {
    widget.modelNotNull = widget.model != null;
    if (!widget.modelNotNull) widget.model = locator<T>();

    widget.model.mContext = widget.context;

    if (widget.onModelReady != null) {
      widget.onModelReady(widget.model);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(BaseView<T> oldWidget) {
    widget.modelNotNull = widget.model != null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
//default value : width : 1080px , height:1920px , allowFontScaling:false
//    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
//    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
//If you want to set the font size is scaled according to the system's "font size" assist option
    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height)
      ..init(context);

    if (widget.modelNotNull)
      return ChangeNotifierProvider<T>.value(
        value: widget.model,
        child: Consumer<T>(builder: widget.builder),
      );
    return ChangeNotifierProvider<T>(
        builder: (context) => widget.model,
        child: Consumer<T>(builder: widget.builder));
  }
}

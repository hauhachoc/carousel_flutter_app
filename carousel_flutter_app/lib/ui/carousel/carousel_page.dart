import 'dart:io';

import 'package:carousel_flutter_app/base/base_view_statefull.dart';
import 'package:carousel_flutter_app/blocs/carousel/carousel_bloc.dart';
import 'package:carousel_flutter_app/localization/Localization.dart';
import 'package:carousel_flutter_app/models/user.dart';
import 'package:carousel_flutter_app/models/user_res.dart';
import 'package:carousel_flutter_app/utils/colors.dart';
import 'package:carousel_flutter_app/utils/style_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  PageController _controller;
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    _controller = PageController()..addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initReady(CarouselBloc bloc) {
    bloc.init();
    bloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CarouselBloc>(
      context: context,
      onModelReady: initReady,
      builder: (context, bloc, child) => GestureDetector(
//        onHorizontalDragEnd: (DragEndDetails details) => _swipeToLeft(details, bloc),
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                _background(),
                _carouselCard(bloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _swipeToLeft(DragEndDetails details, CarouselBloc bloc) {
    if (details.primaryVelocity == 0)
      return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1)
      bloc.getUser();
    else
      print('dragged from right');
  }

  void scrollListener() {
//    print(_controller.offset);
//    double _currentOffset = _controller.offset;
//    double _width = MediaQuery.of(context).size.width;
//    if (_currentOffset > _controller.page * _width) {
//      setState(() {
//      });
//    }
  }

  void onPageChanged(int index) {}

  Widget _background() {
    return Column(
      children: <Widget>[
        Container(
          height: 160.0,
          color: Colors.black,
        ),
        Expanded(
          child: Container(
            color: HexColor(userTop),
          ),
        )
      ],
    );
  }

  Widget _carouselCard(CarouselBloc bloc) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(left: 12, top: 24, right: 12, bottom: 400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  color: HexColor(userTop),
                ),
                Container(
                  height: .5,
                  color: Colors.black26,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            StreamBuilder<UserResponse>(
              stream: bloc.subject.stream,
              builder: (context, AsyncSnapshot<UserResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return _buildErrorWidget(snapshot.data.error);
                  }
                  return _buildPage(snapshot.data, bloc);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading data from API...",
            style: Theme.of(context).textTheme.subtitle),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error",
            style: Theme.of(context).textTheme.subtitle),
      ],
    ));
  }

  Widget _buildPage(UserResponse data, CarouselBloc bloc) {
    return PageView.builder(
      itemBuilder: (context, position) {
        return _buildUserWidget(data);
      },
      scrollDirection: Axis.horizontal,
      onPageChanged: (pos) {
        bloc.getUser();
      },
    );
  }

  Widget _buildUserWidget(UserResponse data) {
    User user = data.results[0];

    return PageView(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  //Avatar
                  Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: .5),
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(user
                                  .picture.large ==
                                  null
                                  ? "https://vcdn-giaitri.vnecdn.net/2018/12/04/nhiet-ba-1543906981_680x0.jpg"
                                  : user.picture.large)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //Infomation
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      Localization.of(context).myAddressIs,
                                      style:
                                          StyleUtil.subhead(cl: Colors.black38),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      user.location.street.number.toString() +
                                          " " +
                                          user.location.street.name,
                                      style: StyleUtil.title(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  //Action buttons
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.people),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.perm_contact_calendar),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.map),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.local_phone),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.lock_outline),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  OverlayEntry _createOverlayEntry(User user) {

    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5.0,
          width: size.width,
          child: Material(
            elevation: 4.0,
            child:
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: .5),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(user
                            .picture.large ==
                            null
                            ? "https://vcdn-giaitri.vnecdn.net/2018/12/04/nhiet-ba-1543906981_680x0.jpg"
                            : user.picture.large)),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

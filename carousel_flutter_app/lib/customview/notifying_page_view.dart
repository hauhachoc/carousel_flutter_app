import 'package:carousel_flutter_app/localization/Localization.dart';
import 'package:carousel_flutter_app/models/user.dart';
import 'package:carousel_flutter_app/models/user_res.dart';
import 'package:carousel_flutter_app/utils/style_util.dart';
import 'package:flutter/material.dart';

class NotifyingPageView extends StatefulWidget {
  final ValueNotifier<double> notifier;
  final UserResponse userResponse;

  const NotifyingPageView({Key key, this.notifier, this.userResponse}) : super(key: key);

  @override
  _NotifyingPageViewState createState() => _NotifyingPageViewState();
}

class _NotifyingPageViewState extends State<NotifyingPageView> {
  int _previousPage;
  PageController _pageController;
  static  User _user;

  void _onScroll() {
    // Consider the page changed when the end of the scroll is reached
    // Using onPageChanged callback from PageView causes the page to change when
    // the half of the next card hits the center of the viewport, which is not
    // what I want

    if (_pageController.page.toInt() == _pageController.page) {
      _previousPage = _pageController.page.toInt();
    }
    widget.notifier?.value = _pageController.page - _previousPage;
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    )..addListener(_onScroll);

    _previousPage = _pageController.initialPage;
    _user = widget.userResponse.results[0];
    super.initState();
  }

  List<Widget> _pages = List.generate(
    3,
        (index) {
      return
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
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
                          backgroundImage: NetworkImage(_user.picture.large == null
                              ? "https://vcdn-giaitri.vnecdn.net/2018/12/04/nhiet-ba-1543906981_680x0.jpg"
                              : _user.picture.large)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'My address is',
                                  style: StyleUtil.subhead(cl: Colors.black38),
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
                                  _user.location.street.number.toString() +
                                      " " +
                                      _user.location.street.name,
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
                height: 8,
              ),
            ],
          ),
        );
    },
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: _pages,
      controller: _pageController,
    );
  }
}
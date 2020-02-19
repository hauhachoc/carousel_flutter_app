import 'dart:async';
import 'dart:io';

import 'package:carousel_flutter_app/blocs/base_bloc.dart';
import 'package:carousel_flutter_app/models/user_res.dart';
import 'package:carousel_flutter_app/reposity/user_repository.dart';
import 'package:carousel_flutter_app/utils/file_util.dart';
import 'package:rxdart/rxdart.dart';

class CarouselBloc extends BaseBloc{

//  UserInfoBloc() {
//    _updateAvatarStreamController.stream.listen(_updateAvatar);
//  }

  @override
  void init() {
    super.init();
//    if (_image == null) {
//      setImage("avatar.jpg", "https://vcdn-giaitri.vnecdn.net/2018/12/04/nhiet-ba-1543906981_680x0.jpg");
//      _updateAvatar(_image);
//    }
  }

  @override
  void dispose() {
    super.dispose();
//    _updateAvatarStreamController.close();
    _subject.close();
  }

//  setImage(String fileName, String url) async{
//    _image = await  downloadFileToStorage(fileName, url);
//  }
//
//  _updateAvatar(File file)
//  {
//    _itemAvatar..add(this._image = file);
//  }
//
//  File _image;
//  File get image => _image;
//
//  Stream<File> get itemAvatar => _itemAvatar.stream;
//  final _itemAvatar = BehaviorSubject<File>();
//
//  Sink<File> get updateAvatar => _updateAvatarStreamController.sink;
//  final _updateAvatarStreamController = StreamController<File>();

  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject =
  BehaviorSubject<UserResponse>();

  getUser() async {
    UserResponse response = await _repository.getUser();
    _subject.sink.add(response);
  }
  BehaviorSubject<UserResponse> get subject => _subject;
}
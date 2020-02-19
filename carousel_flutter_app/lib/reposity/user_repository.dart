import 'package:carousel_flutter_app/models/user_res.dart';
import 'package:carousel_flutter_app/reposity/user_api_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }
}
import 'package:carousel_flutter_app/blocs/carousel/carousel_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerFactory<CarouselBloc>(() => new CarouselBloc());
}
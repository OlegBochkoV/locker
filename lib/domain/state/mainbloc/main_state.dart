import 'package:locker/data/models/locker.dart';

class MainBlocState {}

class InitState extends MainBlocState {}

class LoadingLockersState extends MainBlocState {}

class LoadLockerState extends MainBlocState {
  final List<Locker> locker;

  LoadLockerState({required this.locker});
}

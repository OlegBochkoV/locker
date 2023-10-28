import 'package:locker/presentation/bottom_navbar.dart';

class NavBarState {}

class InitState extends NavBarState {}

class ChangePageState extends NavBarState {
  final Pages page;
  ChangePageState({required this.page});
}

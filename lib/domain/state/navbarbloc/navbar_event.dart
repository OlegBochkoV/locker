import 'package:locker/presentation/bottom_navbar.dart';

class NavBarEvent {}

class ChangePageEvent extends NavBarEvent {
  final Pages page;
  ChangePageEvent({required this.page});
}

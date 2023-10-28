import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/domain/state/mainbloc/main_bloc.dart';
import 'package:locker/domain/state/mainbloc/main_event.dart';
import 'package:locker/domain/state/navbarbloc/navbar_bloc.dart';
import 'package:locker/domain/state/navbarbloc/navbar_event.dart';
import 'package:locker/domain/state/navbarbloc/navbar_state.dart';
import 'package:locker/presentation/bottom_navbar.dart';
import 'package:locker/presentation/pages/friends.dart';
import 'package:locker/presentation/pages/lockers.dart';
import 'package:locker/presentation/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pages page = Pages.lockers;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(GetLockersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      buildWhen: (previous, current) {
        if (current is ChangePageState) {
          page = current.page;
          pageController.jumpToPage(page.index);
          return true;
        }
        return false;
      },
      builder: (context, snapshot) {
        return Scaffold(
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              LockersPage(),
              FriendsPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: CustomNavigationBar(
            page: page,
            onTap: (p) {
              BlocProvider.of<NavBarBloc>(context)
                  .add(ChangePageEvent(page: p));
            },
          ),
        );
      },
    );
  }
}

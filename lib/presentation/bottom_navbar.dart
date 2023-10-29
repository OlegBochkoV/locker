import 'package:flutter/material.dart';
import 'package:locker/data/constants/assets.dart';
import 'package:locker/data/constants/translations.dart';
import 'package:locker/presentation/widgets/item_nav_bar.dart';

enum Pages { lockers, friend, profile }

class CustomNavigationBar extends StatelessWidget {
  final Pages page;
  final Function(Pages) onTap;
  const CustomNavigationBar({
    super.key,
    required this.page,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 0,
            color: const Color(0xFF000000).withOpacity(0.06),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: ItemNavBar(
                icon: AssetsSvg.locker,
                title: Translations.locker,
                select: page == Pages.lockers,
                page: Pages.lockers,
                onTap: onTap,
              ),
            ),
            Expanded(
              child: ItemNavBar(
                icon: AssetsSvg.friend,
                title: Translations.friend,
                select: page == Pages.friend,
                page: Pages.friend,
                onTap: onTap,
              ),
            ),
            Expanded(
              child: ItemNavBar(
                icon: AssetsSvg.profile,
                title: Translations.profile,
                select: page == Pages.profile,
                page: Pages.profile,
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

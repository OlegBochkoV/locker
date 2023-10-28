import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locker/data/constants/colors.dart';
import 'package:locker/presentation/bottom_navbar.dart';

class ItemNavBar extends StatelessWidget {
  final String icon;
  final String title;
  final bool select;
  final Pages page;
  final Function(Pages) onTap;

  const ItemNavBar({
    super.key,
    required this.icon,
    required this.title,
    required this.select,
    required this.page,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(page),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            color: select ? CustomColors.action : CustomColors.darkGrey,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: select ? FontWeight.w700 : FontWeight.w500,
              color: select ? CustomColors.action : CustomColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}

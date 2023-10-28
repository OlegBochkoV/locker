import 'package:flutter/material.dart';
import 'package:locker/data/constants/colors.dart';

class CustomSwitcher extends StatelessWidget {
  final bool lock;
  const CustomSwitcher({
    super.key,
    required this.lock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: lock ? CustomColors.action : CustomColors.lightGreen,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        alignment: lock ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

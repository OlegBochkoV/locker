import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locker/data/constants/assets.dart';
import 'package:locker/data/constants/colors.dart';
import 'package:locker/data/constants/translations.dart';
import 'package:locker/data/models/locker.dart';
import 'package:locker/presentation/widgets/switcher.dart';

class ItemLocker extends StatelessWidget {
  final Locker locker;
  const ItemLocker({
    super.key,
    required this.locker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 17,
      ),
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 25,
        right: 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomColors.addGreen,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: (locker.isLock ?? true)
                  ? CustomColors.green
                  : CustomColors.orange,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                (locker.isLock ?? true)
                    ? SvgPicture.asset(AssetsSvg.lock)
                    : SvgPicture.asset(AssetsSvg.unlock),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locker.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                Text(
                  '${Translations.id}: ${locker.id.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: (locker.isLock ?? true)
                        ? CustomColors.green
                        : CustomColors.orange,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Text(
                    (locker.isLock ?? true)
                        ? Translations.lock.toUpperCase()
                        : Translations.unlock.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomSwitcher(lock: locker.isLock ?? true),
        ],
      ),
    );
  }
}

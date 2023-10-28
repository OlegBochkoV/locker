import 'package:flutter/material.dart';
import 'package:locker/data/constants/translations.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator.adaptive(),
        const SizedBox(height: 10),
        Text(Translations.loading),
      ],
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SpaceAlignment extends StatelessWidget {
  late double verticalSpace;
  late double horizontalSpace;
  SpaceAlignment({super.key, this.verticalSpace = 0, this.horizontalSpace = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSpace,
      width: horizontalSpace,
    );
  }
}

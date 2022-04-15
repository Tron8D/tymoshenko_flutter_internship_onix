import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsButton extends StatelessWidget {
  final AnimationController animationController;
  const SettingsButton({required this.animationController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        animationController
            .forward()
            .then((value) => Navigator.pushNamed(context, '/settings'))
            .then((value) => animationController.reverse());
      },
      icon: SvgPicture.asset(
        'assets/icons/settings.svg',
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}

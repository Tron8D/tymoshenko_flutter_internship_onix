import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pushNamed(context, '/settings'),
      icon: SvgPicture.asset(
        'assets/icons/settings.svg',
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}

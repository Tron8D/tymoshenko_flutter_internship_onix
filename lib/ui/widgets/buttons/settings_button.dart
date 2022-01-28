import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Future<dynamic> result = Navigator.pushNamed(context, '/settings',
            arguments: userSettings.dark);
        result.then((value) {
          if (value != null) {
            return userSettings.dark = value;
          }
        });
      },
      icon: SvgPicture.asset(
        'assets/icons/settings.svg',
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}

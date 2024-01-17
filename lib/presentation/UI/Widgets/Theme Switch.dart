import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool light0 = true;

  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          EvaIcons.sun,
          color: Colors.white,
        );
      }
      return const Icon(
        EvaIcons.moon,
        color: Colors.white,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      trackColor: MaterialStateProperty.resolveWith((Set states) {
        return Colors.white;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((Set states) {
        return Colors.black; // Use the default color.
      }),
      hoverColor: Colors.black,
      thumbColor: MaterialStateProperty.resolveWith((Set states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.black.withOpacity(.48);
        }
        return Colors.black;
      }),
      // trackColor: ,
      thumbIcon: thumbIcon,
      value: light1,
      onChanged: (bool value) {
        setState(() {
          light1 = value;
        });
      },
    );
  }
}

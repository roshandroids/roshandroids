import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class ProfileButtons extends StatefulWidget {
  const ProfileButtons({super.key});

  @override
  State<ProfileButtons> createState() => _ProfileButtonsState();
}

class _ProfileButtonsState extends State<ProfileButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomButton(title: 'Download CV'),
        SizedBox(width: 20),
      ],
    );
  }
}

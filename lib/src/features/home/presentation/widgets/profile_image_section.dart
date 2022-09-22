import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class ProfileImageSection extends StatefulWidget {
  const ProfileImageSection({super.key});

  @override
  State<ProfileImageSection> createState() => _ProfileImageSectionState();
}

class _ProfileImageSectionState extends State<ProfileImageSection> {
  late AssetImage _image;
  @override
  void initState() {
    _image = const AssetImage('assets/images/roshan.png');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(_image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Theme.of(context).dividerColor.withOpacity(.05),
            spreadRadius: 10,
          )
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: DottedBorder(
        color: Theme.of(context).dividerColor,
        radius: const Radius.circular(20),
        padding: const EdgeInsets.all(5),
        borderType: BorderType.Circle,
        strokeWidth: 1.5,
        child: Motion.elevated(
          glare: false,
          shadow: false,
          elevation: 150,
          child: const CircleAvatar(
            radius: 200,
            backgroundImage: AssetImage(Assets.profileImage),
          ),
        ),
      ),
    ).showCursorOnHover;
  }
}

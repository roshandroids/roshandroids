import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
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
      ),
      padding: const EdgeInsets.all(20),
      child: Motion.elevated(
        elevation: 0,
        shadow: false,
        glare: false,
        child: const CircleAvatar(
          radius: 170,
          backgroundImage: AssetImage('assets/images/roshan.png'),
        ),
      ),
    ).showCursorOnHover;
  }
}

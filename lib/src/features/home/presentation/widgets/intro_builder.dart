import 'package:flutter/material.dart';

class IntroBuilder extends StatelessWidget {
  const IntroBuilder({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

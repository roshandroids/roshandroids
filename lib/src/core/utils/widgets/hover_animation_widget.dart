// ignore_for_file: avoid_setters_without_getters

import 'package:flutter/material.dart';

class HoverAnimationWidget extends StatefulWidget {
  const HoverAnimationWidget({
    super.key,
    required this.child,
    this.enableGlow,
  });
  final Widget child;
  final bool? enableGlow;
  @override
  State<HoverAnimationWidget> createState() => _HoverAnimationWidgetState();
}

class _HoverAnimationWidgetState extends State<HoverAnimationWidget> {
  final nonHoverTransform = Matrix4.identity()..translate(0);
  final hoverTransform = Matrix4.identity()..translate(0, -5);
  late bool _hovering;
  @override
  void initState() {
    _hovering = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: _hovering && (widget.enableGlow ?? true)
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).hoverColor,
                    blurRadius: 10,
                  ),
                ],
              )
            : null,
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

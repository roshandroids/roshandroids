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
      child: Transform.translate(
        offset: Offset(0, _hovering ? 3 : 0),
        child: DecoratedBox(
          decoration: _hovering && (widget.enableGlow ?? true)
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).hoverColor,
                      blurRadius: 1,
                    ),
                  ],
                )
              : const BoxDecoration(),
          child: widget.child,
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

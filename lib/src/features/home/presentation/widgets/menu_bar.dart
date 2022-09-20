import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';
import 'package:roshandroids/src/features/home/presentation/animation/entrance_fader.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 3),
            blurRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          EntranceFader(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '< ',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        'Roshan',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontFamily: 'Agustina',
                            ),
                      ),
                      Flexible(
                        child: Text(
                          ' />',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          MenuItem(
            title: 'About me'.hardcoded,
          ),
          MenuItem(
            title: 'Resume'.hardcoded,
          ),
          MenuItem(
            title: 'Blog'.hardcoded,
          ),
          MenuItem(
            title: 'Contact'.hardcoded,
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
            ),
          ),
        ),
      ),
    );
  }
}

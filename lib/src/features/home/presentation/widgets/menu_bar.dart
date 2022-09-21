import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:roshandroids/src/core/core.dart';
import 'package:roshandroids/src/features/home/presentation/animation/entrance_fader.dart';

class MenuBar extends ConsumerWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.read(themeController).isDarkTheme;
    return Container(
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
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 16, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '< '.hardcoded,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Roshan'.hardcoded,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontFamily: 'Agustina',
                          ),
                    ),
                    Flexible(
                      child: Text(
                        ' />'.hardcoded,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              ),
            ).showCursorOnHover.moveUpOnHover(),
          ),
          const Spacer(),
          ResponsiveVisibility(
            hiddenWhen: const [Condition<bool>.smallerThan(name: TABLET)],
            child: Row(
              children: [
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
          ),
          EntranceFader(
            child: ResponsiveVisibility(
              visible: false,
              visibleWhen: const [Condition<bool>.smallerThan(name: TABLET)],
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/svg/menu.svg',
                  color: Theme.of(context).iconTheme.color,
                ),
              ).showCursorOnHover.moveUpOnHover(),
            ),
          ),
          EntranceFader(
            child: ResponsiveVisibility(
              hiddenWhen: const [Condition<bool>.smallerThan(name: TABLET)],
              child: DayNightSwitcherIcon(
                isDarkModeEnabled: currentThemeMode,
                onStateChanged: (isDarkModeEnabled) {
                  ref.read(themeController.notifier).updateCurrentThemeMode(
                        isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
                      );
                },
              ).showCursorOnHover.moveUpOnHover(),
            ),
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
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ).showCursorOnHover.moveUpOnHover(),
    );
  }
}

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:roshandroids/src/core/core.dart';
// import 'package:roshandroids/src/core/core.dart';

class MenuBarSection extends ConsumerWidget {
  const MenuBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.read(themeController).isDarkTheme;
    return EntranceFader(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor.withOpacity(.03),
              offset: const Offset(0, 1),
              blurRadius: 20,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => context.go(AppRoutes.homeRoute.path),
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
              ).showCursorOnHover,
            ),
            const Spacer(),
            ResponsiveVisibility(
              hiddenWhen: const [Condition<bool>.smallerThan(name: TABLET)],
              child: Row(
                children: [
                  MenuBarItem(
                    title: 'Portfolio'.hardcoded,
                    appRouteModel: AppRoutes.portfolioRoute,
                  ),
                  MenuBarItem(
                    title: 'Blogs'.hardcoded,
                    appRouteModel: AppRoutes.blogsRoute,
                  ),
                  MenuBarItem(
                    title: 'Resume'.hardcoded,
                    appRouteModel: AppRoutes.resumeRoute,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ResponsiveVisibility(
              visible: false,
              visibleWhen: const [Condition<bool>.smallerThan(name: TABLET)],
              child: GestureDetector(
                child: SvgPicture.asset(
                  Assets.hamMenu,
                  color: Theme.of(context).iconTheme.color,
                ),
              ).showCursorOnHover.moveUpOnHover(),
            ),
            ResponsiveVisibility(
              hiddenWhen: const [Condition<bool>.smallerThan(name: TABLET)],
              child: DayNightSwitcherIcon(
                isDarkModeEnabled: currentThemeMode,
                onStateChanged: (isDarkModeEnabled) {
                  ref.read(themeController.notifier).updateCurrentThemeMode(
                        isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
                      );
                },
              ).showCursorOnHover,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

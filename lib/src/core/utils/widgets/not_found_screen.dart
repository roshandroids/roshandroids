import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:roshandroids/src/core/core.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentThemeMode = ref.watch(themeController).isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          DayNightSwitcherIcon(
            isDarkModeEnabled: currentThemeMode,
            onStateChanged: (isDarkModeEnabled) {
              ref.read(themeController.notifier).updateCurrentThemeMode(
                    isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
                  );
            },
          ).showCursorOnHover,
          const SizedBox(width: 20),
        ],
      ),
      body: EntranceFader(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(.4),
                    ),
                    child: Image.asset(
                      Assets.notFountImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  '404 - Page not found!'.hardcoded,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  title: 'Go back',
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  onPressed: () {
                    context.goNamed(AppRoutes.homeRoute.routeName);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

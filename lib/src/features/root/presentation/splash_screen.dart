import 'package:roshandroids/src/core/core.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeController).isDarkTheme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: EntranceFader(
            duration: const Duration(milliseconds: 300),
            delay: const Duration(milliseconds: 100),
            child: Image.asset(
              isDarkTheme ? Assets.splashDarkImage : Assets.splashLightImage,
            ),
          ),
        ),
      ),
    );
  }
}

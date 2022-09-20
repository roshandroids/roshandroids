import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/app_icon_dark.png')],
        ),
      ),
    );
  }
}
//  DropdownButtonFormField<ThemeMode>(
//               items: const [
//                 DropdownMenuItem(
//                   value: ThemeMode.light,
//                   child: Text('Light'),
//                 ),
//                 DropdownMenuItem(
//                   value: ThemeMode.dark,
//                   child: Text('Dark'),
//                 ),
//                 DropdownMenuItem(
//                   value: ThemeMode.system,
//                   child: Text('System'),
//                 )
//               ],
//               onChanged: (value) {
//                 ref
//                     .read(themeController.notifier)
//                     .updateCurrentThemeMode(value);
//               },
//             ),
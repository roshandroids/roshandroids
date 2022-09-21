import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion/motion.dart';
import 'package:roshandroids/src/features/home/presentation/animation/entrance_fader.dart';
import 'package:roshandroids/src/features/home/presentation/widgets/menu_bar.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomeScreen> {
  late final MotionController _motionController;
  @override
  void initState() {
    _motionController = MotionController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: PreferredSize(
        preferredSize: Size(size.width, 66),
        child: const EntranceFader(
          child: MenuBar(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Motion.elevated(
              elevation: 0,
              shadow: false,
              glare: false,
              controller: _motionController,
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/roshan.png'),
              ),
            )
          ],
        ),
      ),

    );
  }
}

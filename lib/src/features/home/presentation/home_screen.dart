import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion/motion.dart';
import 'package:roshandroids/src/core/core.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EntranceFader(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width / 10,
                      top: size.height / 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Motion.elevated(
                      elevation: 0,
                      shadow: false,
                      glare: false,
                      controller: _motionController,
                      child: const CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage('assets/images/roshan.png'),
                      ),
                    ),
                  ).moveUpOnHover(enableGlow: false),
                  SizedBox(width: size.width / 30),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flutter Developer'.hardcoded,
                        curve: Curves.ease,
                        textStyle: Theme.of(context).textTheme.headline4,
                        speed: const Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        'Frontend Developer'.hardcoded,
                        curve: Curves.ease,
                        textStyle: Theme.of(context).textTheme.headline4,
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

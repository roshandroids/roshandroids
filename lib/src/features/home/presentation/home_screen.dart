import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion/motion.dart';
import 'package:roshandroids/src/core/core.dart';
import 'package:roshandroids/src/features/home/home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomeScreen> {
  late final MotionController _motionController;
  late AssetImage profileImage;

  @override
  void initState() {
    profileImage = const AssetImage('assets/images/roshan.png');
    _motionController = MotionController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(profileImage, context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 66),
        child: const MenuBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              runAlignment: WrapAlignment.center,
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                EntranceFader(
                  child: Container(
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
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage: profileImage,
                      ),
                    ),
                  ).showCursorOnHover,
                ),
                const SizedBox(width: 20),
                EntranceFader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      Text(
                        'Roshan Shrestha',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

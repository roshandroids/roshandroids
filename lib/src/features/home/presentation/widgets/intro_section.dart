import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:roshandroids/src/core/core.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).dividerColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      radius: const Radius.circular(20),
      borderType: BorderType.RRect,
      strokeWidth: 1.5,
      child: SizedBox(
        width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 3,
        child: Column(
          crossAxisAlignment:
              ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EntranceFader(
              child: Image.asset(
                'assets/gif/wave_hand.gif',
                height: 50,
                width: 50,
              ),
            ),
            RichText(
              textAlign: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? TextAlign.center
                  : TextAlign.justify,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Roshan '.hardcoded,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  TextSpan(
                    text: 'Shrestha'.hardcoded,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow_rounded,
                  color: Theme.of(context).errorColor,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flutter Developer'.hardcoded,
                      curve: Curves.ease,
                      textStyle: Theme.of(context).textTheme.headline4,
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      'Frontend Developer'.hardcoded,
                      curve: Curves.ease,
                      textStyle: Theme.of(context).textTheme.headline4,
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'A tech enthuiastic highly motivated guy learning technologies evolving around the world.'
                  .hardcoded,
              textAlign: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                  ? TextAlign.justify
                  : TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                '👇🏻 Get connected 👇🏻',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ).moveUpOnHover(enableGlow: false),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: socialLinks
                  .map(
                    (e) => SocialIconWidget<CustomIconModel>(
                      customIconModel: e,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

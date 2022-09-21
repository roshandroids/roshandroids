import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:roshandroids/src/core/core.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 3,
      child: Column(
        crossAxisAlignment: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello! '.hardcoded,
                style: Theme.of(context).textTheme.headline4,
              ),
              EntranceFader(
                child: Image.asset(
                  'assets/gif/wave_hand.gif',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
          Text(
            'Its me! '.toUpperCase().hardcoded,
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            children: [
              FittedBox(
                child: Text(
                  'Roshan'.hardcoded,
                  textAlign:
                      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                          ? TextAlign.center
                          : TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontWeight: FontWeight.w100),
                ),
              ),
              const SizedBox(width: 10),
              FittedBox(
                child: Text(
                  'Shrestha'.hardcoded,
                  textAlign:
                      ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                          ? TextAlign.center
                          : TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
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
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

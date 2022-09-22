import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DottedBorder(
        color: Theme.of(context).dividerColor,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        radius: const Radius.circular(20),
        borderType: BorderType.RRect,
        strokeWidth: 1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me 🤔',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Hello There ! I'm Roshan Shrestha, a fun loving guy from NEPAL 🇳🇵. I have been working as a full-time mobile app developer for about 3 years now. Talking about educational background, I have completed by Bachelor's degree in Computer Science and Software Engineering from University of Bedfordshire. I have been developing amazing with appleaing UI and robust performing apps for Android, iOS, Web and Desktop (Both MacOS and Windows with Flutter so far. Working with different tools and language in my pogramming journey has been fun along with great support from communities like GitHub, Stackoverflow, Reddit. I'm still in learning phase trying to learn as much as possible about recent technologies.",
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              '< 💻 Languages 💻 />',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).moveUpOnHover(enableGlow: false),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: programmingLanguages
                    .map(
                      (e) => FittedBox(
                        child: SocialIconWidget<CustomIconModel>(
                          customIconModel: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '< 💻 Tools 💻 />',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).moveUpOnHover(enableGlow: false),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: designTools
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

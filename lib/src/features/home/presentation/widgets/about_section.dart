import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).dividerColor,
      radius: const Radius.circular(20),
      borderType: BorderType.RRect,
      strokeWidth: 1.5,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).dividerColor.withOpacity(.03),
        ),
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
              "Hello There ! It's me Roshan Shrestha, a fun loving guy from NEPAL 🇳🇵. I have been working as a full-time mobile app developer for about 3 years now. Talking about educational background, I have completed by Bachelor's degree in Computer Science and Software Engineering from University of Bedfordshire. I have been developing amazing apps with appleaing UI and robust performance for platforms such as Android, iOS, Web and Desktop (Both MacOS and Windows) with Flutter so far. Working with different tools and language in my career has been fun and motivating. Having great support from communities like GitHub, Stackoverflow, Reddit kept me learning new things to broaden my skill and knowledge. As of now I am still in learning phase trying to learn as much as possible about recent technologies. Whenever I have spare time from busy schedule I like to contribute to different forums and communities by helping new emerging developers."
                  .hardcoded,
              softWrap: true,
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            // const SkillSection(),
          ],
        ),
      ),
    );
  }
}

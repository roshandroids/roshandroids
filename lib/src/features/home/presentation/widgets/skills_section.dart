import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: DottedBorder(
        color: Theme.of(context).dividerColor,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        radius: const Radius.circular(20),
        borderType: BorderType.RRect,
        strokeWidth: 1.5,
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '💻 < ',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: 'Languages',
                    style: Theme.of(context).textTheme.headline5?.copyWith(),
                  ),
                  TextSpan(
                    text: ' /> 💻',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: programmingLanguages
                    .map(
                      (e) => FittedBox(
                        child: CustomIconWidget(
                          customIconModel: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '⚙️ ',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: 'Tools',
                    style: Theme.of(context).textTheme.headline5?.copyWith(),
                  ),
                  TextSpan(
                    text: ' ⚒️',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: designTools
                    .map(
                      (e) => FittedBox(
                        child: CustomIconWidget(
                          customIconModel: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

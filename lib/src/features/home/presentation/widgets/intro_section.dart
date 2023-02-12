import 'package:roshandroids/src/core/core.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveWrapper = ResponsiveWrapper.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: responsiveWrapper.isLargerThan(TABLET) ? 10 : 30,
      ),
      width: responsiveWrapper.isSmallerThan(DESKTOP)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).dividerColor.withOpacity(.03),
      ),
      child: Column(
        crossAxisAlignment: responsiveWrapper.isSmallerThan(DESKTOP)
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
            textAlign: responsiveWrapper.isSmallerThan(DESKTOP)
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
                CustomIcons.play_arrow,
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
            'A tech enthuiastic highly motivated guy learning technologies evolving around the world. I have developed amazing apps with appealing UI and robust performance for platforms such as Android, iOS, Web and Desktop (Both MacOS and Windows) with Flutter so far.'
                .hardcoded,
            textAlign: responsiveWrapper.isLargerThan(TABLET)
                ? TextAlign.justify
                : TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ).selectable,
          const SizedBox(height: 20),
          Center(
            child: Text(
              '👇🏻 Get connected 👇🏻'.hardcoded,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).moveUpOnHover(enableGlow: false),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: IconList()
                .socialLinks
                .map(
                  (e) => CustomIconWidget(
                    customIconModel: e,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 15),
          Center(
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.parse('https://roshansth.com.np/#/');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: Column(
                children: [
                  Text(
                    'Checkout my another website'.hardcoded,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'https://roshansth.com.np/'.hardcoded,
                    style: Theme.of(context).textTheme.button?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ).showCursorOnHover.moveUpOnHover(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

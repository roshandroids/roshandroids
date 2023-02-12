import 'package:roshandroids/src/core/core.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveWrapper = ResponsiveWrapper.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: 3,
        ),
        EntranceFader(
          child: Text(
            '© All Right Reservered by Roshan Shrestha'.hardcoded,
          ),
        ),
        Spacer(
          flex: responsiveWrapper.isLargerThan(TABLET) ? 2 : 3,
        ),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition<bool>.largerThan(name: TABLET)],
          child: EntranceFader(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '< '.hardcoded,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Roshan'.hardcoded,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontFamily: 'Agustina',
                      ),
                ),
                Flexible(
                  child: Text(
                    ' />'.hardcoded,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

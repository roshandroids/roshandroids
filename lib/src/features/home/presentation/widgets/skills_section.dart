import 'package:roshandroids/src/core/core.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).dividerColor.withOpacity(.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools and Languages'.hardcoded,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SkillSectionItem(
            items: IconList().designTools,
            text0: '🎨 ',
            text1: 'Design Tools',
            text2: ' 🧑‍🎨',
          ),
          SkillSectionItem(
            items: IconList().developmentTools,
            text0: '⚙️  ',
            text1: 'Development Tools',
            text2: ' ⚒️',
          ),
          SkillSectionItem(
            items: IconList().programmingLanguages,
            text0: '< ',
            text1: 'Language',
            text2: ' />',
          )
        ],
      ),
    );
  }
}

class SkillSectionItem extends StatelessWidget {
  const SkillSectionItem({
    super.key,
    required this.text0,
    required this.text1,
    required this.text2,
    required this.items,
  });
  final String text0;
  final String text1;
  final String text2;
  final List<CustomIconModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            children: [
              TextSpan(
                text: text0.hardcoded,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: text1.hardcoded,
              ),
              TextSpan(
                text: text2.hardcoded,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: items
              .map(
                (e) => FittedBox(
                  child: CustomIconWidget(
                    customIconModel: e,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

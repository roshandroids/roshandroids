import 'package:flutter/material.dart';
import 'package:roshandroids/src/core/core.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

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
            'Services'.hardcoded,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          ...IconList().services.asMap().entries.map(
                (e) => ServiceContentWidget(
                  customIconModel: e.value.copyWith(size: 50),
                ),
              ),

          // const SkillSection(),
        ],
      ),
    );
  }
}

class ServiceContentWidget extends StatelessWidget {
  const ServiceContentWidget({
    super.key,
    required this.customIconModel,
  });
  final CustomIconModel customIconModel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconWidget(
              customIconModel: customIconModel,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${customIconModel.other?['title'] ?? ''}'.hardcoded,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '${customIconModel.other?['description'] ?? ''}'.hardcoded,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

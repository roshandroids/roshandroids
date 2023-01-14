import 'package:roshandroids/src/core/core.dart';

class MenuBarItem extends StatelessWidget {
  const MenuBarItem({
    super.key,
    required this.title,
    required this.appRouteModel,
  });

  final String title;

  final AppRouteModel appRouteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(appRouteModel.path),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Text(
          title.hardcoded,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    ).showCursorOnHover.moveUpOnHover();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roshandroids/src/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.customIconModel,
  });
  final CustomIconModel customIconModel;

  @override
  Widget build(BuildContext context) {
    const splashColor = Colors.transparent;
    return InkWell(
      splashColor: splashColor,
      splashFactory: NoSplash.splashFactory,
      focusColor: splashColor,
      hoverColor: splashColor,
      highlightColor: splashColor,
      onTap: () async {
        await showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  alignment: Alignment.center,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 5,
                  icon: IconWidget(
                    customIconModel: customIconModel.copyWith(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(
                    'Reach me out @ ${customIconModel.name}'.hardcoded,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  content: Text('${customIconModel.link}')
                      .showCursorOnHover
                      .moveUpOnHover()
                      .moveUpOnHover(),
                  actions: [
                    const ActionWidget(
                      title: 'Close',
                    ),
                    ActionWidget(
                      title: 'Continue',
                      onTap: () async {
                        final uri = Uri.parse('${customIconModel.link}');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return const SizedBox.shrink();
          },
        );
      },
      onHover: (value) {},
      child: IconWidget(customIconModel: customIconModel),
    ).showCursorOnHover.moveUpOnHover(enableGlow: false);
  }
}

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(title.hardcoded),
      ).showCursorOnHover.moveUpOnHover(enableGlow: false),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.customIconModel,
  });

  final CustomIconModel customIconModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: customIconModel.enableBackgroundColor
            ? Theme.of(context).dividerColor.withOpacity(.08)
            : null,
        boxShadow: customIconModel.enableShadow
            ? [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Theme.of(context).dividerColor.withOpacity(.03),
                ),
              ]
            : null,
      ),
      child: customIconModel.iconData != null
          ? Icon(
              customIconModel.iconData,
              size: customIconModel.size,
              color: customIconModel.color,
            )
          : customIconModel.svgPath != null
              ? SvgPicture.asset(
                  customIconModel.svgPath!,
                  height: customIconModel.size,
                  width: customIconModel.size,
                  color: customIconModel.color,
                )
              : customIconModel.imagePath != null
                  ? Image.asset(
                      customIconModel.imagePath!,
                      height: customIconModel.size,
                      width: customIconModel.size,
                      color: customIconModel.color,
                      fit: BoxFit.contain,
                    )
                  : const SizedBox(),
    );
  }
}

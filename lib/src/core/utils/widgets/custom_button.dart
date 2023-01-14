import 'package:roshandroids/src/core/core.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.borderColor,
    this.backgroundColor,
    this.borderWidth = 2,
    this.elevation = 4,
    this.textStyle,
    this.borderradius = 25,
    this.isLoading = false,
    this.splashColor = Colors.transparent,
    this.onPressed,
    this.padding = EdgeInsets.zero,
  });
  final String title;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderWidth;
  final double elevation;
  final TextStyle? textStyle;
  final double borderradius;
  final bool isLoading;
  final Color splashColor;
  final VoidCallback? onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      splashFactory: NoSplash.splashFactory,
      focusColor: splashColor,
      hoverColor: splashColor,
      highlightColor: splashColor,
      onTap: onPressed,
      child: Card(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: borderWidth,
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(borderradius),
        ),
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            padding: padding,
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    title.hardcoded,
                    style: textStyle ?? Theme.of(context).textTheme.button,
                  ),
          ),
        ),
      ).showCursorOnHover.moveUpOnHover(enableGlow: false),
    );
  }
}

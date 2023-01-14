import 'package:roshandroids/src/core/core.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      extendBodyBehindAppBar: true,
      persistentFooterButtons: const [
        FooterSection(),
      ],
      appBar: PreferredSize(
        preferredSize: Size(size.width, 66),
        child: const MenuBarSection(),
      ),
      body: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:roshandroids/src/core/core.dart';
import 'package:roshandroids/src/features/home/home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomeScreen> {
  late ScrollController _scrollController;
  late bool _showScrollButton;
  late bool _showFooter;

  @override
  void initState() {
    _showFooter = true;
    _showScrollButton = false;
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 200) {
            _showScrollButton = true;
            _showFooter = false;
          } else {
            _showScrollButton = false;
            _showFooter = true;
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      persistentFooterAlignment: AlignmentDirectional.center,
      extendBodyBehindAppBar: true,
      persistentFooterButtons: _showFooter
          ? [
              const FooterSection(),
            ]
          : null,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 66),
        child: const MenuBarSection(),
      ),
      body: EntranceFader(
        delay: const Duration(milliseconds: 350),
        child: ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            ResponsiveRowColumn(
              columnMainAxisAlignment: MainAxisAlignment.center,
              columnSpacing: 20,
              rowSpacing: 20,
              rowPadding: EdgeInsets.only(
                left: size.width / 4,
                top: 50,
                bottom: 30,
                right: 30,
              ),
              columnPadding: const EdgeInsets.all(30),
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: const [
                ResponsiveRowColumnItem(
                  child: ProfileImageSection(),
                ),
                ResponsiveRowColumnItem(
                  child: IntroSection(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ResponsiveRowColumn(
              columnMainAxisAlignment: MainAxisAlignment.center,
              columnSpacing: 20,
              rowSpacing: 20,
              rowPadding: const EdgeInsets.all(
                30,
              ),
              columnPadding: const EdgeInsets.all(30),
              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: buildSection(
                    context,
                    const AboutSection(),
                  ),
                ),
                const ResponsiveRowColumnItem(
                  child: SkillSection(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _showScrollButton
          ? EntranceFader(
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                onPressed: _scrollToTop,
                highlightElevation: 3,
                child: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 30,
                ),
              ),
            ).showCursorOnHover
          : null,
    );
  }

  Widget buildSection(BuildContext context, Widget child) {
    if (ResponsiveWrapper.of(context).isLargerThan(TABLET)) {
      return Expanded(
        child: child,
      );
    }
    return child;
  }
}

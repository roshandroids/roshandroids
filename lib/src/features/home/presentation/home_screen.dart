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

  @override
  void initState() {
    _showScrollButton = false;
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 200) {
            _showScrollButton = true;
          } else {
            _showScrollButton = false;
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
    final responsiveWrapper = ResponsiveWrapper.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              rowPadding: const EdgeInsets.all(
                20,
              ),
              columnPadding: const EdgeInsets.all(30),
              layout: responsiveWrapper.isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    width: size.width / 4.5,
                  ),
                ),
                const ResponsiveRowColumnItem(
                  child: ProfileImageSection(),
                ),
                const ResponsiveRowColumnItem(
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
              layout: responsiveWrapper.isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveRowColumnItem(
                  child: _buildExpandedWidget(
                    context,
                    const ServiceSection(),
                  ),
                ),
                const ResponsiveRowColumnItem(
                  child: SkillSection(),
                  // _buildExpandedWidget(context, const SkillSection()),
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
                  CustomIcons.keyboard_arrow_up,
                  size: 30,
                ),
              ),
            ).showCursorOnHover
          : null,
    );
  }

  Widget _buildExpandedWidget(BuildContext context, Widget child) {
    if (ResponsiveWrapper.of(context).isDesktop) {
      return Expanded(child: child);
    } else {
      return child;
    }
  }
}

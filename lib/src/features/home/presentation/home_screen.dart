import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
  bool _showBackToTopButton = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
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
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final socialLinks = [
      SocialLinkModel(
        icon: MaterialCommunityIcons.github,
        link: '',
      ),
      SocialLinkModel(icon: MaterialCommunityIcons.linkedin, link: ''),
      SocialLinkModel(icon: MaterialCommunityIcons.twitter, link: ''),
      SocialLinkModel(
        icon: MaterialCommunityIcons.facebook,
        link: '',
      ),
      SocialLinkModel(
        icon: MaterialCommunityIcons.facebook_messenger,
        link: '',
      ),
      SocialLinkModel(icon: FontAwesome.instagram, link: ''),
      SocialLinkModel(icon: MaterialCommunityIcons.gmail, link: ''),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 66),
        child: const MenuBar(),
      ),
      body: EntranceFader(
        delay: const Duration(milliseconds: 350),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                children: [
                  const ResponsiveRowColumnItem(
                    child: ProfileImageWidget(),
                  ),
                  ResponsiveRowColumnItem(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const DescriptionWidget(),
                        const SizedBox(height: 10),
                        const CustomButton(title: 'Download CV'),
                        const SizedBox(height: 20),
                        Text(
                          '👇🏻 Find me on 👇🏻',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: socialLinks
                              .map(
                                (e) => SocialIconWidget<SocialLinkModel>(
                                  socialLinkModel: e,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _showBackToTopButton
          ? EntranceFader(
              delay: const Duration(milliseconds: 400),
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                child: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 30,
                ),
              ),
            ).showCursorOnHover
          : null,
    );
  }
}

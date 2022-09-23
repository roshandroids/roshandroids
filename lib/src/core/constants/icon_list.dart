import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:roshandroids/src/core/core.dart';

class IconList {
  /// Programming Languages
  final programmingLanguages = [
    CustomIconModel(
      name: 'Flutter',
      svgPath: Assets.flutter,
    ),
    CustomIconModel(
      name: 'Dart',
      svgPath: Assets.dart,
    ),
    CustomIconModel(
      name: 'HTML',
      svgPath: Assets.html,
    ),
    CustomIconModel(
      name: 'CSS',
      svgPath: Assets.css,
    ),
    CustomIconModel(
      name: 'JAVA',
      svgPath: Assets.java,
    ),
    CustomIconModel(
      name: 'JavaScript',
      svgPath: Assets.javascript,
    ),
    CustomIconModel(
      name: 'Python',
      svgPath: Assets.python,
    ),
    CustomIconModel(
      name: 'Git',
      svgPath: Assets.git,
    ),
  ];

  /// Design Tools
  final designTools = [
    CustomIconModel(
      name: 'Figma',
      svgPath: Assets.figma,
    ),
    CustomIconModel(
      name: 'Photoshop',
      svgPath: Assets.photoshop,
    ),
    CustomIconModel(
      name: 'Adobe XD',
      svgPath: Assets.xd,
    ),
  ];

  /// Development tools
  final developmentTools = [
    CustomIconModel(
      name: 'Visual Studio Code',
      svgPath: Assets.vscode,
    ),
    CustomIconModel(
      name: 'Xcode',
      svgPath: Assets.xcode,
    ),
    CustomIconModel(
      name: 'Android Studio',
      svgPath: Assets.androidstudio,
    ),
    CustomIconModel(
      name: 'Postman API',
      svgPath: Assets.postman,
    ),
  ];

  /// Social Links
  final socialLinks = [
    CustomIconModel(
      name: 'Github',
      iconData: MaterialCommunityIcons.github,
      link: 'https://github.com/roshandroids',
    ),
    CustomIconModel(
      name: 'Linked In',
      iconData: MaterialCommunityIcons.linkedin,
      link: 'https://www.linkedin.com/in/roshandroids/',
    ),
    CustomIconModel(
      name: 'Discord',
      iconData: MaterialCommunityIcons.discord,
      link: 'Add me @ Rowshan#5942',
    ),
    CustomIconModel(
      name: 'Twitter',
      iconData: MaterialCommunityIcons.twitter,
      link: 'https://twitter.com/roshansth56',
    ),
    CustomIconModel(
      name: 'Facebook',
      iconData: MaterialCommunityIcons.facebook,
      link: 'https://www.facebook.com/roshandroids/',
    ),
    CustomIconModel(
      name: 'Instagram',
      iconData: FontAwesome.instagram,
      link: 'https://www.instagram.com/roshandroids/',
    ),
    CustomIconModel(
      name: 'Gmail',
      iconData: MaterialCommunityIcons.gmail,
      link: 'Shrestharoshan776@gmail.com',
    ),
  ];

  /// Services
  final services = [
    CustomIconModel(
      name: 'Web App Development',
      imagePath: Assets.web,
      other: {
        'title': 'Web Design & Development',
        'description':
            'Design, develop and deploy your web apps with appealing UI and robust performance.',
      },
    ),
    CustomIconModel(
      name: 'Android App Development',
      imagePath: Assets.android,
      other: {
        'title': 'Android App Design & Development',
        'description':
            'Get your mobile app ready for android devices and deploy to Play-Store.',
      },
    ),
    CustomIconModel(
      name: 'iOS App Development',
      imagePath: Assets.iOS,
      other: {
        'title': 'iOS App Design & Development',
        'description':
            'Design and develop your app for iOS platform and deploy to App-Store.',
      },
    ),
    CustomIconModel(
      name: 'Desktop App Development',
      imagePath: Assets.mac,
      other: {
        'title': 'Desktop App Design & Development',
        'description':
            'Want some desktop based software? Put your requirements on table and get it done.',
      },
    ),
  ];
}

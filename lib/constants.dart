import 'package:flutter/material.dart';
import 'package:portfolio/widgets/work.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'models/model.dart';
import 'provider/general_provider.dart';
import 'widgets/widgets.dart';

// Colors

const MaterialColor themeColor = Colors.teal;

const Color scaffoldColor = Color.fromRGBO(10, 25, 47, 1);

const Color linkTextColor = Color.fromRGBO(100, 255, 218, 1);

const Color textColor = Color.fromRGBO(136, 146, 176, 1);

const Color hintTextColor = Color.fromRGBO(136, 146, 176, 0.4);

const Color headingTextColor = Color.fromRGBO(204, 214, 246, 1);

const Color quotedTextColor = Color.fromRGBO(136, 146, 176, 1);

const Color highlightedButtonColor = Color.fromRGBO(100, 255, 218, 0.1);

const Color headerColor = Color.fromRGBO(10, 25, 47, 0.85);

const Color dividerColor = Color.fromRGBO(168, 178, 209, 1);

const Color experienceTextColor = Color.fromRGBO(168, 178, 209, 1);

// Animation
const Duration linkTextHighlightDuration = Duration(milliseconds: 300);

const Duration buttonHighlightDuration = Duration(milliseconds: 200);

// const Duration loadingScreenDuration = Duration(seconds: 8);
const Duration loadingScreenDuration = Duration(seconds: 1);

const Duration headerDuration = Duration(milliseconds: 200);

const Duration headerLinkDuration = Duration(milliseconds: 200);

const Duration headerLogoDuration = Duration(milliseconds: 300);

const Duration scrollInViewDuration = Duration(seconds: 1);

const Duration imagePostioningDuration = Duration(milliseconds: 300);

// Animation Delay Duration
const Duration headerAnimationDelayDuration = Duration(milliseconds: 100);

const Duration sidePaneAnimationDelayDuration = Duration(milliseconds: 500);

const Duration contentAnimationDelayDuration = Duration(milliseconds: 1000);

// Sizing
const double defaultPadding = 20.00;

const double defaultBorderRadius = 5.00;

const double defaultSizing = 20.00;

// Screen Breakpoints
const double extraLargeScreenMin = 1201.00;

const double desktopScreenMin = 1025.00;

const double smallDesktopScreenMin = 769.00;

const double tabletScreenMin = 481.00;

const double mobileScreenMax = 480.00;

// Application Constant
List<LinkModel> links = [
  LinkModel(
    text: 'About',
    onTap: (context) {
      (Provider.of<GeneralProvider>(
        context,
        listen: false,
      ).itemScrollController as ItemScrollController)
          .scrollTo(
        index: 1,
        duration: scrollInViewDuration,
      );
    },
    textKey: '01.',
  ),
  LinkModel(
    text: 'Experience',
    onTap: (context) {
      (Provider.of<GeneralProvider>(
        context,
        listen: false,
      ).itemScrollController as ItemScrollController)
          .scrollTo(
        index: 2,
        duration: scrollInViewDuration,
      );
    },
    textKey: '02.',
  ),
  LinkModel(
    text: 'Work',
    onTap: (context) {
      (Provider.of<GeneralProvider>(
        context,
        listen: false,
      ).itemScrollController as ItemScrollController)
          .scrollTo(
        index: 3,
        duration: scrollInViewDuration,
      );
    },
    textKey: '03.',
  ),
  LinkModel(
    text: 'Contact',
    onTap: (context) {
      (Provider.of<GeneralProvider>(
        context,
        listen: false,
      ).itemScrollController as ItemScrollController)
          .scrollTo(
        index: 4,
        duration: scrollInViewDuration,
      );
    },
    textKey: '04.',
  )
];

List<SocialIconLinkModel> socialLinks = [
  SocialIconLinkModel(
    svgPath: 'assets/svg/github.svg',
    onClickUrl: 'https://github.com/CharwekarAkshay',
  ),
  SocialIconLinkModel(
    svgPath: 'assets/svg/instagram.svg',
    onClickUrl: 'https://www.instagram.com/akshaycharwekar/',
  ),
  SocialIconLinkModel(
    svgPath: 'assets/svg/leetcode.svg',
    onClickUrl: 'https://leetcode.com/AkshayCharwekar/',
  ),
  SocialIconLinkModel(
    svgPath: 'assets/svg/linkedin.svg',
    onClickUrl: 'https://www.linkedin.com/in/akshay-charwekar-67b698183/',
  ),
];

const List<Widget> contentList = [
  General(),
  About(),
  Experience(),
  Work(),
];

List<SkillProgressModel> skillSetList = [
  SkillProgressModel(skill: 'Angular', skillPercentage: 90.0),
  SkillProgressModel(skill: 'Flutter', skillPercentage: 89.0),
  SkillProgressModel(skill: 'Javascript', skillPercentage: 89.0),
  SkillProgressModel(skill: 'Spring (Java)', skillPercentage: 89.0),
  SkillProgressModel(skill: 'CSS', skillPercentage: 89.0),
];

const String userFirstName = 'Akshay';

const String userLastName = 'Charwekar';

const String userEmail = 'charwekar12@gmail.com';

const information = {
  'quotedText': 'I build things for the web.',
  'aboutMe':
      'I’m a software engineer specializing in building full stack application.\nCurrently I am Software Engineer @Finastra.',
  'aboutMeDetailed':
      'Hello! My name is Akshay and I enjoy creating that live on internet.I started my  journey as developer in 2019. I started as Angular developer. \n \nToday I am working as full stack developer @Finastra. My main focus is to develop application which scales.Currently I am working on Angular as front-end and Java as backe-end technology.\n \nIn my free time I liked to make my hands dirty and explore new things in the technological market. I always put step forward to new technology currently I am learning flutter.',
};

List<ExperienceModel> workExp = [
  ExperienceModel(
    designation: 'Associate Software Engineer',
    startDate: 'Feb 2021',
    endDate: 'Present',
    companyName: 'Finastra',
    companyLink: 'https://www.finastra.com/',
    workExperience: [
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
    ],
  ),
  ExperienceModel(
    designation: 'Software Engineer',
    startDate: 'July 2019',
    endDate: 'Feb 2021',
    companyName: 'Persistent Systems',
    companyLink: 'https://www.persistent.com/',
    workExperience: [
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
    ],
  ),
  ExperienceModel(
    designation: 'Intern',
    startDate: 'Jan 2019',
    endDate: 'July 2021',
    companyName: 'Persistent Systems',
    companyLink: 'https://www.persistent.com/',
    workExperience: [
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
      'Working on so and so thing',
    ],
  ),
];

List<GitProjectModel> gitProjectList = [
  GitProjectModel(
    name: 'Time Machine',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 1',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 2',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 3',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 1',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 2',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 3',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 1',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 2',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  ),
  GitProjectModel(
    name: 'Time Machine - 3',
    description:
        'This is time machine project. Used to go back in time. And never comeback beacause this world is not good.',
    gitLink: 'https://github.com/CharwekarAkshay',
    technologies: ['Dart', 'Angular', 'Flutter', 'React'],
  )
];

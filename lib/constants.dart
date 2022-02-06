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

const Color cardColor = Color.fromRGBO(17, 34, 64, 1);

// Animation
const Duration linkTextHighlightDuration = Duration(milliseconds: 300);

const Duration buttonHighlightDuration = Duration(milliseconds: 200);

const Duration loadingScreenDuration = Duration(seconds: 5);

const Duration headerDuration = Duration(milliseconds: 200);

const Duration headerLinkDuration = Duration(milliseconds: 200);

const Duration headerLogoDuration = Duration(milliseconds: 300);

const Duration scrollInViewDuration = Duration(seconds: 1);

const Duration imagePostioningDuration = Duration(milliseconds: 300);

const Duration gridShowItemInterval = Duration(milliseconds: 200);

const Duration gridShowItemDuration = Duration(milliseconds: 500);

const Duration projectCardAnimationDuration = Duration(milliseconds: 500);

const Duration contentLoadingDuration = Duration(seconds: 1);

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

const defaultNoOfProjectDisplay = 4;

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
  Contact(),
];

List<SkillProgressModel> skillSetList = [
  SkillProgressModel(skill: 'Angular', skillPercentage: 90.0),
  SkillProgressModel(skill: 'Flutter', skillPercentage: 80.0),
  SkillProgressModel(skill: 'Javascript', skillPercentage: 80.0),
  SkillProgressModel(skill: 'Spring (Java)', skillPercentage: 60.0),
  SkillProgressModel(skill: 'CSS', skillPercentage: 75.0),
];

const String userFirstName = 'Akshay';

const String userLastName = 'Charwekar';

const String userEmail = 'charwekar12@gmail.com';

const information = {
  'quotedText': 'I build things for the web.',
  'aboutMe':
      'I’m a software engineer specializing in building full stack application. Currently I am working as Software Engineer @Finastra.',
  'aboutMeDetailed':
      'Hello! My name is Akshay and I enjoy creating that live on internet. I started my carrer as developer in 2019 as Frontend engineer. \n \nToday I am working as Full stack developer @Finastra. My main focus is to develop applications that scales.\n \nIn my free time I liked to explore new things in the technological market. I always put step forward to learn new technology, currently I am learning flutter.',
};

const contactMessage =
    'Always looking for any new opportunities, my inbox is always open. Feel free to connect with me and sahre ideas. It can be a beginning of something great!';

List<ExperienceModel> workExp = [
  ExperienceModel(
    designation: 'Associate Software Engineer',
    startDate: 'Feb 2021',
    endDate: 'Present',
    companyName: 'Finastra',
    companyLink: 'https://www.finastra.com/',
    workExperience: [
      'Developed next gen UX portal for handling and managing corporate banking loans. Providing solution to multiple banks.',
      'Worked as full stack developer in project. Created API\'s  using Spring boot and frontend completly built on Angular. Following angular\'s standard practice created generic application which can be molded according to needs.',
      'Created different types of dasborad like silver, gold & plattinum for providing user enhanced experience and providing useful information at fingertip. Further used can customize each dashboards accoarding to there needs.'
    ],
  ),
  ExperienceModel(
    designation: 'Software Engineer',
    startDate: 'October 2020',
    endDate: 'Feb 2021',
    companyName: 'Persistent Systems',
    companyLink: 'https://www.persistent.com/',
    clientName: 'Robo Advisory Firm',
    workExperience: [
      'Intent is to provide client robust application through which client can add and invest money to achive their goals. Design architecture to integrate  trading platform which will increase clients revenue. Also creating fresh  platform for expreience user to directly invest in stocks.',
      'Worked as backend developer.',
      'Closely worked with architects and designed distributed system.',
      'Created robust and secure API for providing security to financial transactions',
      'Handled asyncronus flow of application and managing multiple transactions.',
    ],
    hasMultipleDesignation: true,
    otherWorkExperience: [
      ExperienceModel(
        designation: 'Software Engineer',
        startDate: 'June 2019',
        endDate: 'Sept 2020',
        companyName: 'Persistent Systems',
        companyLink: 'https://www.persistent.com/',
        hasMultipleDesignation: true,
        clientName: 'Insurance Company',
        showDesignation: false,
        workExperience: [
          'The solution intends to provide the client with application which will provide end user a reliable solution for purchasing bonds. The bond products are a key revenue driver for Company. A primary objective is to significantly improve the mobile experience. Helps gain attention drasticaly incresing mobile user to purchase bonds on their finger tip.'
              'Worked as UI developer.',
          'Worked on under multiple teams.',
          'Handled stage server deployment and other devops work.',
          'Customer communication and team support.',
        ],
      ),
      ExperienceModel(
        designation: 'Intern',
        startDate: 'Jan 2019',
        endDate: 'June 2019',
        companyName: 'Persistent Systems',
        companyLink: 'https://www.persistent.com/',
        hasMultipleDesignation: true,
        workExperience: [
          'Got training on Angular and Node.js.',
          'Learned build robust and reusable component.',
          'Learned basic skills how industry works.',
          'Hands on experience on banking application.',
        ],
      ),
    ],
  ),
];

List<GitProjectModel> gitProjectList = [
  GitProjectModel(
    name: 'Portfolio',
    description: 'My portfolio project build with the helo of flutter ',
    gitLink: 'https://github.com/CharwekarAkshay/portfolio',
    technologies: ['Dart', 'Flutter'],
  ),
  GitProjectModel(
    name: 'Spring Angular',
    description:
        'Starter project for full stack application build with Angular and Java Spring boot. With basic configuration for quick start on practice project.',
    gitLink: 'https://github.com/CharwekarAkshay/spring-angular',
    technologies: ['Angular', 'Java'],
  ),
  GitProjectModel(
    name: 'UI Components',
    description: 'Basics responsive models which can be resued any where.',
    gitLink: 'https://github.com/CharwekarAkshay/UIComponents',
    technologies: ['HTML', 'CSS', 'SCSS', 'JavaScript'],
  ),
  GitProjectModel(
    name: 'Node.js Starter',
    description:
        'Node.js project build for faster API development. Integrated winston logger. with help of express created simple API suits. ',
    gitLink: 'https://github.com/CharwekarAkshay/node-js-starter',
    technologies: ['Node.js', 'Express', 'JavaScript'],
  ),
  GitProjectModel(
    name: 'Java JWT',
    description:
        'Java application api which provide jwt based authentication. Application create JWT based on Self Signed certificates.',
    gitLink:
        'https://github.com/CharwekarAkshay/reddit-clone/tree/jwt-based-authentication',
    technologies: ['Java', 'Spring', 'JWT'],
  ),
  GitProjectModel(
    name: 'Netflix Clone',
    description:
        'Tried cloning netflix application. Build with the help of react and hosted on firebase.',
    gitLink: 'https://github.com/CharwekarAkshay/netflix-clone',
    technologies: ['React', 'JavaScript', 'Firebase'],
  ),
  GitProjectModel(
    name: 'Facebook Clone',
    description: 'Tried creating facebook clone with the help of flutter.',
    gitLink: 'https://github.com/CharwekarAkshay/facebook_clone',
    technologies: ['Dart', 'Flutter'],
  ),
];

// Files constants
const String prfoilePictureFileName = 'profile_picture.jpg';
const String resumeFileName = 'Resume.pdf';
const String resumeDownloadedName = 'Akshay\'s_Resume.pdf';

const String designerName = 'Britanny Chiang';
const String designerWebsiteUrl = 'https://brittanychiang.com/';

const String developerName = 'Akshay Charwekar';
const String developerWebsireUrl = 'https://charwekarakshay.github.io/';

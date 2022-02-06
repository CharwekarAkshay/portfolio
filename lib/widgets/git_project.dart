import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/model.dart';

class GitProject extends StatefulWidget {
  final GitProjectModel gitProject;
  final Animation<double> animation;

  const GitProject({
    Key? key,
    required this.gitProject,
    required this.animation,
  }) : super(key: key);

  @override
  State<GitProject> createState() => _GitProjectState();
}

class _GitProjectState extends State<GitProject> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: projectCardAnimationDuration,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
    if (value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _handleClick(url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(widget.animation),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -10 * _animationController.value),
            child: child,
          );
        },
        child: InkWell(
          onTap: () => _handleClick(widget.gitProject.gitLink),
          onHover: _handleHover,
          child: Card(
            elevation: _isHovered ? 23 : 1,
            shadowColor: themeColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.folder_open_outlined,
                        color: themeColor,
                        size: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2,
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/github.svg',
                          color: _isHovered ? linkTextColor : textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultSizing),
                  AutoSizeText(
                    widget.gitProject.name,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: _isHovered ? linkTextColor : headingTextColor,
                        ),
                  ),
                  const SizedBox(height: defaultSizing / 2),
                  AutoSizeText(
                    widget.gitProject.description,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: defaultSizing / 2),
                  const Spacer(),
                  Technology(technologies: widget.gitProject.technologies)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Technology extends StatelessWidget {
  final List<String> technologies;
  const Technology({Key? key, required this.technologies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: technologies
          .map(
            (technology) => Container(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 8,
                horizontal: defaultPadding / 4,
              ),
              child: AutoSizeText(
                technology,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 13,
                    ),
              ),
            ),
          )
          .toList(),
    );
  }
}

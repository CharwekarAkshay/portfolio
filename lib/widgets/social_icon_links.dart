import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/social_icon_link_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconLink extends StatefulWidget {
  final SocialIconLinkModel link;

  const SocialIconLink({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  _SocialIconLinkState createState() => _SocialIconLinkState();
}

class _SocialIconLinkState extends State<SocialIconLink> {
  bool _isHovered = false;

  void _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchInBrowser(widget.link.onClickUrl);
      },
      onHover: _handleHover,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: SvgPicture.asset(
          widget.link.svgPath,
          color: _isHovered ? linkTextColor : textColor,
        ),
      ),
    );
  }
}

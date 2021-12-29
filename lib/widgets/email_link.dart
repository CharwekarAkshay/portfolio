import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'widgets.dart';

class EmailLink extends StatefulWidget {
  const EmailLink({Key? key}) : super(key: key);

  @override
  _EmailLinkState createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  bool _isHovered = false;

  void _handleHover(value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map(
            (e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
    }

    _sendMail(data) {
      var emailLaunchUri = Uri(
        scheme: 'mailto',
        path: userEmail,
        query: encodeQueryParameters(<String, String>{
          'subject': data['subject'],
          'body': data['body'],
        }),
      );
      launch(emailLaunchUri.toString());
    }

    _openEmailDialog() async {
      var data = await showDialog(
        context: context,
        builder: (context) => EmailDialog(),
      );
      if (data != null) {
        _sendMail(data);
      }
    }

    return InkWell(
      onTap: _openEmailDialog,
      onHover: _handleHover,
      child: RotatedBox(
        quarterTurns: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            userEmail,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: _isHovered ? linkTextColor : textColor,
                ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets.dart';

class ExperienceDetail extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetail({
    Key? key,
    required this.experience,
  }) : super(key: key);

  onCompanyNameClick() async {
    var url = experience.companyLink;
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
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: size.width > smallDesktopScreenMin
                ? Axis.horizontal
                : Axis.vertical,
            crossAxisAlignment: size.width > smallDesktopScreenMin
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              AutoSizeText(experience.designation),
              size.width > smallDesktopScreenMin
                  ? const SizedBox(width: defaultSizing / 2)
                  : const SizedBox(height: defaultSizing / 2),
              AnimatedLink(
                text: '@${experience.companyName}',
                onTap: onCompanyNameClick,
                disableHoverEffect: true,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                    ),
              )
            ],
          ),
          const SizedBox(height: defaultSizing / 4),
          AutoSizeText(
            '${experience.startDate} - ${experience.endDate}',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: experienceTextColor, fontSize: 13),
          ),
          const SizedBox(height: defaultSizing),
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: experience.hasMultipleDesignation
                    ? double.infinity
                    : size.height * 0.5,
                maxHeight: experience.hasMultipleDesignation
                    ? double.infinity
                    : size.height * 0.5),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding / 4),
                child: ExpeirenceDetailPoint(
                  text: experience.workExperience[index],
                ),
              ),
              itemCount: experience.workExperience.length,
            ),
          )
        ],
      ),
    );
  }
}

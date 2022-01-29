import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/widgets.dart';
import '../models/model.dart';

import '../constants.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({Key? key}) : super(key: key);

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  int _selectedIndex = 0;

  _handleOnTap(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  List<Widget> _getOtherWorkExperience() {
    if (workExp[_selectedIndex].hasMultipleDesignation) {
      return workExp[_selectedIndex]
          .otherWorkExperience
          .map(
            (ExperienceModel exp) => ExperienceDetail(
              experience: exp,
            ),
          )
          .toList();
    } else {
      return List.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: workExp.length,
      initialIndex: _selectedIndex,
      child: Column(
        children: [
          TabBar(
            onTap: _handleOnTap,
            tabs: workExp
                .map(
                  (ExperienceModel experience) => Tab(
                    child: AutoSizeText(experience.companyName),
                  ),
                )
                .toList(),
          ),
          ExperienceDetail(
            experience: workExp[_selectedIndex],
          ),
          ..._getOtherWorkExperience()
        ],
      ),
    );
  }
}

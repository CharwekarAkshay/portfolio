import 'package:flutter/material.dart';

import '../constants.dart';

class WorkGridList extends StatelessWidget {
  final crossAxiCount = 3;
  const WorkGridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildProjectList() {
      List<Widget> finalList = [];
      for (var i = 0; i < gitProjectList.length; i++) {
         
      }
      return finalList;
    }

    return Container(
      child: Column(
        children: _buildProjectList(),
      ),
    );
  }
}

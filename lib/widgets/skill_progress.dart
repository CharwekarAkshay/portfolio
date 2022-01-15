import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../models/model.dart';

class SkillProgress extends StatelessWidget {
  final SkillProgressModel skillSet;

  const SkillProgress({
    Key? key,
    required this.skillSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${skillSet.skill} :'),
          const SizedBox(height: defaultSizing / 8),
          Row(
            children: [
              Expanded(
                child: _buildProgressBar(context, skillSet),
              ),
              const SizedBox(width: defaultSizing),
              Text(
                '${skillSet.skillPercentage.toString()} %',
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ],
      ),
    );
  }

  /// Returns the progress bar.
  Widget _buildProgressBar(BuildContext context, SkillProgressModel skillSet) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 30,
          child: SfLinearGauge(
            orientation: LinearGaugeOrientation.horizontal,
            minimum: 0.0,
            maximum: 100.0,
            showTicks: false,
            showLabels: false,
            animateAxis: true,
            axisTrackStyle: const LinearAxisTrackStyle(
              thickness: 10,
              edgeStyle: LinearEdgeStyle.bothCurve,
              borderWidth: 1,
            ),
            barPointers: <LinearBarPointer>[
              LinearBarPointer(
                value: skillSet.skillPercentage,
                thickness: 10,
                edgeStyle: LinearEdgeStyle.bothCurve,
                color: themeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

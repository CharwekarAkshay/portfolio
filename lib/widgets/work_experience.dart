import 'package:flutter/material.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text("Hello"),
                ),
                Tab(
                  icon: Icon(
                    Icons.directions_transit,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.directions_bike,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

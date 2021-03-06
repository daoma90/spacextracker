import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:spacextracker/constants.dart';
import 'package:spacextracker/providers/launch_provider.dart';
import 'package:spacextracker/widgets/custom_divider.dart';

class PreviousLaunchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pastLaunch = Provider.of<LaunchProvider>(context).pastLaunches[0];
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        right: 20,
        bottom: 10,
        left: 20,
      ),
      width: double.infinity,
      child: Hero(
        tag: 'card${pastLaunch.id}',
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: 50.h),
              margin: EdgeInsets.only(top: 50, right: 10, bottom: 10, left: 10),
              decoration: BoxDecoration(
                color: cardBackground,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [cardShadow],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.of(context).pushNamed('/details', arguments: pastLaunch);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              pastLaunch.launchNumber.toString(),
                              style: TextStyle(color: colorGrey),
                            ),
                            pastLaunch.success != null
                                ? Text(
                                    pastLaunch.success ? 'Success' : 'Failed',
                                    style: TextStyle(color: pastLaunch.success ? colorGreen : colorRed),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Previous launch',
                          style: TextStyle(color: colorGrey, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        Text(
                          pastLaunch.name,
                          style: TextStyle(color: colorWhite, fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          pastLaunch.rocket,
                          style: TextStyle(color: colorGrey, fontSize: 20),
                        ),
                        CustomDivider(),
                        Text(
                          pastLaunch.dateReadable,
                          style: TextStyle(color: colorGrey, fontSize: 15),
                        ),
                        Text(
                          '${pastLaunch.timeReadable} GMT',
                          style: TextStyle(color: colorGrey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              child: FadeInImage.memoryNetwork(
                height: 120,
                width: 120,
                image: pastLaunch.patch != null
                    ? pastLaunch.patch
                    : 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Circle-icons-rocket.svg/1200px-Circle-icons-rocket.svg.png',
                placeholder: kTransparentImage,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spacextracker/widgets/custom_divider.dart';

import '../constants.dart';

class DetailsTextSection extends StatelessWidget {
  final String title;
  final String text;
  final Map<String, String> list;

  DetailsTextSection({@required this.title, this.text, this.list});

  Widget renderDetails() {
    return text != null
        ? Text(
            text,
            style: TextStyle(
              color: colorWhite.withOpacity(0.6),
            ),
          )
        : Text(
            'N/A',
            style: TextStyle(
              color: colorWhite.withOpacity(0.6),
            ),
          );
  }

  Widget renderPayload() {
    return list != null && list['payloadName'] != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                list['payloadName'],
                style: TextStyle(
                  color: colorWhite.withOpacity(0.6),
                ),
              ),
              Text(
                list['payloadType'],
                style: TextStyle(
                  color: colorWhite.withOpacity(0.6),
                ),
              ),
            ],
          )
        : Text(
            'N/A',
            style: TextStyle(
              color: colorWhite.withOpacity(0.6),
            ),
          );
  }

  Widget renderTarget() {
    return list != null && list['payloadOrbit'] != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                list['payloadOrbit'],
                style: TextStyle(
                  color: colorWhite.withOpacity(0.6),
                ),
              ),
              Text(
                list['payloadRegime'],
                style: TextStyle(
                  color: colorWhite.withOpacity(0.6),
                ),
              ),
            ],
          )
        : Text(
            'N/A',
            style: TextStyle(
              color: colorWhite.withOpacity(0.6),
            ),
          );
  }

  Widget renderLaunchpad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          list['launchpadName'],
          style: TextStyle(
            color: colorWhite.withOpacity(0.6),
          ),
        ),
        Text(
          list['launchpadFullName'],
          style: TextStyle(
            color: colorWhite.withOpacity(0.6),
          ),
        ),
        Text(
          list['launchpadRegion'],
          style: TextStyle(
            color: colorWhite.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  // This widget will render a detail section (seen in the launch detail screen).
  // Renders above widgets depending on what data is passed to this widget. Payload / Target / Launchpad / Details
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 500),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: colorWhite, fontSize: 15),
          ),
          CustomDivider(),
          title == 'Payload'
              ? renderPayload()
              : title == "Target"
                  ? renderTarget()
                  : title == 'Launchpad'
                      ? renderLaunchpad()
                      : renderDetails()
        ],
      ),
    );
  }
}

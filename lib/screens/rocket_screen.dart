import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spacextracker/constants.dart';
import 'package:spacextracker/providers/launch_provider.dart';
import 'package:spacextracker/widgets/video_background.dart';

class RocketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rocketId =
        ModalRoute.of(context).settings.arguments as String; // A property is sent when navigating to this screen.
    final rocket = Provider.of<LaunchProvider>(context).getRocket(rocketId); // Getting rocket data from provider
    double width = MediaQuery.of(context).size.width; // Getting screen width
    double height = MediaQuery.of(context).size.height; // Getting screen height
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait; // Checking orientation

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            // This screen plays a video as background.
            child: VideoBackground(rocket.rocketName),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: isPortrait ? 5.h : 20.h),
                width: 50.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      rocket.rocketName.toUpperCase(),
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: 6.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: rocketScreenText,
                          ),
                          Text(
                            '${rocket.height.toString()} m',
                            style: rocketScreenText,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: colorWhite,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'DIAMETER',
                            style: rocketScreenText,
                          ),
                          Text(
                            '${rocket.diameter.toString()} m',
                            style: rocketScreenText,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: colorWhite,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'MASS',
                            style: rocketScreenText,
                          ),
                          Text('${NumberFormat.decimalPattern().format(rocket.mass)} kg', style: rocketScreenText),
                        ],
                      ),
                    ),
                    Divider(
                      color: colorWhite,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('ENGINE', style: rocketScreenText),
                          Text('${rocket.engine.toUpperCase()}', style: rocketScreenText),
                        ],
                      ),
                    ),
                    Divider(
                      color: colorWhite,
                    ),
                    for (var item in rocket.payloadWeights)
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 0.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('PAYLOAD TO ${item['id'].toString().toUpperCase()}', style: rocketScreenText),
                                Text('${NumberFormat.decimalPattern().format(item['kg'])} kg', style: rocketScreenText),
                              ],
                            ),
                          ),
                          Divider(
                            color: colorWhite,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

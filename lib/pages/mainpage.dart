// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fimage/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timelines/timelines.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final List<Text> textToTimeLines = [
      Text(
        'Secondary School in Busko-Zdrój',
        style: AppStyle.smallText,
      ),
      Text(
        'University of Economics in Katowice',
        style: AppStyle.smallText,
      ),
      Text(
        'Internship at Tobacco Trading as a programmer',
        style: AppStyle.smallText,
      ),
    ];
    final heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'H',
                    style: AppStyle.ornamentText,
                  ),
                  Text(
                    'ubert',
                    style: AppStyle.mainText,
                  ),
                  Text(
                    ' O',
                    style: AppStyle.ornamentText,
                  ),
                  Text(
                    'bora',
                    style: AppStyle.mainText,
                  )
                ],
              ),
            ),
            DividerLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: AppStyle.smallText,
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: heightOfScreen / 20,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(
                                'Student of information technology'),
                            RotateAnimatedText(
                                'University of economics in Katowice'),
                            RotateAnimatedText(
                                'Programming of mobile applications'),
                          ],
                          repeatForever: true,
                        ),
                      )),
                ),
              ],
            ),
            DividerLine(),
            Heading(headingText: 'Skills'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularIndicator(percent: '75%', language: 'Java'),
                CircularIndicator(percent: '65%', language: 'C#'),
                CircularIndicator(percent: '50%', language: 'Python'),
              ],
            ),
            DividerLine(),
            Heading(headingText: 'Languages'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinearIndicator(percent: 0.8, language: 'English'),
                    LinearIndicator(percent: 0.5, language: 'Russian'),
                    LinearIndicator(percent: 0.3, language: 'German'),
                  ]),
            ),
            DividerLine(),
            Heading(headingText: 'Qualities'),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Quality(
                        urlToImage: 'lib/images/cooperative.png',
                        textUnderImage: 'Cooperative'),
                    Quality(
                        urlToImage: 'lib/images/creative.png',
                        textUnderImage: 'Creative'),
                    Quality(
                        urlToImage: 'lib/images/punctual.png',
                        textUnderImage: 'Punctual'),
                  ]),
            ),
            DividerLine(),
            Heading(headingText: 'Experience & Education'),
            SizedBox(
                height: 200,
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData(
                      color: AppStyle.whiteColor,
                      connectorTheme:
                          ConnectorThemeData(color: AppStyle.secondColor)),
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.alternating,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: textToTimeLines[index],
                    ),
                    itemCount: 3,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            DividerLine(),
            Heading(headingText: 'Contact'),
            ListTile(
              text: '503-839-818',
              icon: Icon(Icons.smartphone, color: AppStyle.whiteColor),
            ),
            ListTile(
                text: 'hubert.obora@edu.uekat.pl',
                icon: Icon(Icons.email, color: AppStyle.whiteColor)),
            ListTile(
                text: 'Katowice',
                icon: Icon(
                  Icons.home,
                  color: AppStyle.whiteColor,
                )),
            DividerLine()
          ],
        )),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  String headingText;
  Heading({Key? key, required this.headingText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        headingText,
        style: AppStyle.mainText,
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10,
      thickness: 2,
      indent: 15,
      endIndent: 15,
      color: Colors.white,
    );
  }
}

class CircularIndicator extends StatelessWidget {
  String percent;
  String language;
  CircularIndicator({Key? key, required this.percent, required this.language})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CircularPercentIndicator(
        radius: 50.0,
        lineWidth: 13.0,
        animation: true,
        percent: 0.7,
        backgroundColor: AppStyle.whiteColor,
        center: Text(
          percent,
          style: AppStyle.mainText,
        ),
        footer: Text(
          language,
          style: AppStyle.mainText,
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: AppStyle.secondColor,
      ),
    );
  }
}

class LinearIndicator extends StatelessWidget {
  double percent;
  String language;
  LinearIndicator({Key? key, required this.percent, required this.language})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          animation: true,
          backgroundColor: AppStyle.whiteColor,
          width: 120.0,
          lineHeight: 10.0,
          percent: percent,
          progressColor: AppStyle.secondColor,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            language,
            style: AppStyle.smallText,
          ),
        )
      ],
    );
  }
}

class Quality extends StatelessWidget {
  String urlToImage;
  String textUnderImage;
  Quality({Key? key, required this.urlToImage, required this.textUnderImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(urlToImage)),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            textUnderImage,
            style: AppStyle.smallText,
          ),
        )
      ],
    );
  }
}

class ListTile extends StatelessWidget {
  String text;
  Icon icon;
  ListTile({Key? key, required this.text, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: AppStyle.smallText,
          ),
        ),
      ],
    );
  }
}

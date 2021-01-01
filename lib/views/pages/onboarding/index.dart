import 'package:flutter/material.dart';
import 'package:flutter_firebase_cubit_starter_kit/util/constants.dart';
import 'package:flutter_firebase_cubit_starter_kit/util/size_config.dart';
import 'package:flutter_firebase_cubit_starter_kit/views/pages/auth/login.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

final _currentPageNotifier = ValueNotifier<int>(0);
final _pageController = PageController();

final List<String> _titlesList = [
  'Flutter',
  'Firebase',
];

final List<String> _subtitlesList = [
  'Cross platform mobile app development',
  'Built in backend service',
];

final List<String> _imageList = [
  'assets/av1.png',
  'assets/av2.png',
];
final List<Widget> _pages = [];

List<Widget> populatePages(BuildContext context) {
  _pages.clear();
  _titlesList.asMap().forEach((index, value) => _pages.add(getPage(
      _imageList.elementAt(index),
      value,
      _subtitlesList.elementAt(index),
      context)));
  _pages.add(getLastPage(context));
  return _pages;
}

Widget _buildCircleIndicator() {
  return CirclePageIndicator(
    selectedDotColor: Colors.grey,
    dotColor: Colors.black,
    selectedSize: 8,
    size: 6.5,
    itemCount: _pages.length,
    currentPageNotifier: _currentPageNotifier,
  );
}

Widget getPage(
    String image, String title, String subTitle, BuildContext context) {
  SizeConfig().init(context);
  return Container(
    child: Center(
      child: Container(
        // color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 40,
                  child: Image.asset(image),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal * 5,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget getLastPage(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    child: Center(
      child: Container(
        // color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cubit',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockSizeHorizontal * 5.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 40,
                  child: Image.asset('assets/av3.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'State management architecture for flutter',
                    style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal * 5,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Future<bool> setFinishedOnBoarding() async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // return prefs.setBool(Constants.FINISHED_ON_BOARDING, true);
  return true;
}

class WalkThrough extends StatefulWidget {
  static const routeName = '/walkthrough_screen';

  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical * 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'HelveticaNeue',
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.blockSizeHorizontal * 3),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 75,
                  width: double.infinity,
                  child: PageView(
                    controller: _pageController,
                    children: populatePages(context),
                    onPageChanged: (int index) {
                      _currentPageNotifier.value = index;
                      if (index == _titlesList.length) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                  ),
                ),
                //getLastPage(context),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildCircleIndicator(),
                  ),
                )
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            isLast
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  )
                : _pageController.jumpToPage(_currentPageNotifier.value + 1);
          },
          child: Icon(Icons.arrow_forward),
        ));
  }
}

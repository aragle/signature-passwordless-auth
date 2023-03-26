import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:signature/controllers/variables.dart' as globals;
import 'package:signature/views/login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(
                    width: 0.0,
                    color: background,
                  ),
                ),
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 45.0,
                          vertical: 90.0,
                        ),
                        child: Image.asset('assets/images/onboarding/1.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 45.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'One method\nfor\nmultiple websites',
                            textScaleFactor: 1.3,
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            style: pageTitleStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 45.0, vertical: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign in to your favorite websites with just one account.',
                            style: pageInfoStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              border: Border.all(
                width: 0.0,
                color: background,
              ),
            ),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45.0,
                      vertical: 90.0,
                    ),
                    child: Image.asset('assets/images/onboarding/2.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Authentication\nwith\nBiometrics',
                        textScaleFactor: 1.3,
                        style: pageTitleStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login to your account with just a fingerprint or face scan.',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              border: Border.all(
                width: 0.0,
                color: background,
              ),
            ),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45.0,
                      vertical: 90.0,
                    ),
                    child: Image.asset('assets/images/onboarding/3.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Safe, Secure\nand\nPrivate',
                        textScaleFactor: 1.3,
                        style: pageTitleStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your data is encrypted and stored locally on your device.',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          globals.isFirstTime = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Start',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.grey[900],
          child: Onboarding(
            pages: onboardingPagesList,
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: background,
                  border: Border.all(
                    width: 0.0,
                    color: background,
                  ),
                ),
                child: ColoredBox(
                  color: background,
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_diamond,
                              ),
                            ),
                          ),
                        ),
                        index == pagesLength - 1
                            ? _signupButton
                            : _skipButton(setIndex: setIndex)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'CustomSignInDialog.dart';
import 'SignInForm.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  RiveAnimationController _btnController = OneShotAnimation("active");
  bool isDialogShown = false;
  @override
  void initState() {
    // TODO: implement initState
    _btnController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 100,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 20,
              ),
              child: const SizedBox(),
            ),
          ),
          const Positioned(
            child: RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 310,
                    child: Column(
                      children: const [
                        Text(
                          "Learn Design & Code",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 64,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Flutter project and integrating Rive into it. Then, we will use Rive's powerful design tools to create beautiful background animations using shapes and blur.")
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      _btnController.isActive = true;

                      Future.delayed(Duration(milliseconds: 800), () {
                        setState(() {
                          isDialogShown = true;
                        });
                        CustomSignInDialog(context, onClosed: (_) {
                          setState(() {
                            isDialogShown = false;
                          });
                        });
                      });
                    },
                    child: SizedBox(
                      height: 64,
                      width: 260,
                      child: Stack(
                        children: [
                          RiveAnimation.asset(
                            "assets/RiveAssets/button.riv",
                            controllers: [_btnController],
                          ),
                          Positioned.fill(
                              top: 8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(CupertinoIcons.arrow_right),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Start the course",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                        "By the end of this series, you will have a solid understanding of how to Rive and Flutter together to create stunning, animated apps that are both visually appealing and functional."),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}

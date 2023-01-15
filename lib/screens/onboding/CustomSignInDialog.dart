import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SignInForm.dart';

Future<Object?> CustomSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    transitionDuration: Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween =
          Tween<Offset>(begin: Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Then finally learn how to create custom model transitions on Sign in view. Once the button animation is complete it goes up a little and the Sign in dialog slide from the top",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SignInForm(),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        "Sign In with Google, Apple or Email",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 60,
                              width: 60,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 60,
                              width: 60,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 60,
                              width: 60,
                            ))
                      ],
                    )
                  ],
                ),
                const Positioned(
                  bottom: -36,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  ).then(onClosed);
}

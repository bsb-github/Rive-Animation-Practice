import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset("assets/icons/email.svg"),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset("assets/icons/email.svg"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
          child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff77d8e),
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ))),
              icon: const Icon(
                CupertinoIcons.arrow_right,
                color: Color(0xfffe0037),
              ),
              label: const Text("Sign In")),
        )
      ],
    ));
  }
}

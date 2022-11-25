import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_app_ui/gen/assets.gen.dart';
import 'package:flutter_hotel_app_ui/gen/colors.gen.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/screens/dashboard.dart';
import 'package:flutter_hotel_app_ui/presenter/ui/widgets/app_button.dart';
import 'package:flutter_hotel_app_ui/utilities/app_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              child: Center(
                  child: Assets.image.signIn
                      .image(fit: BoxFit.cover, width: size.width))),
          Container(
              height: size.height / 3,
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppButton(
                    buttonText: 'Create Account',
                    onPressed: () => navigateToHome(context),
                  ),
                  const SizedBox(height: 24),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        AppTextSpan.medium('Already have account? ',
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                        AppTextSpan.medium(
                          'Sign in',
                          textDecoration: TextDecoration.underline,
                          color: ColorName.blue,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => navigateToHome(context),
                          letterSpacing: 0.5,
                          fontSize: 16,
                        ),
                      ]))
                ],
              ))
        ],
      ),
    );
  }

  void navigateToHome(BuildContext context) =>
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard()));
}

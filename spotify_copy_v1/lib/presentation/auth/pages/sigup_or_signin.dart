import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_copy_v1/common/helpers/is_dark_mode.dart';
import 'package:spotify_copy_v1/common/widgets/appbar/app_bar.dart';
import 'package:spotify_copy_v1/common/widgets/button/basic_app_button.dart';
import 'package:spotify_copy_v1/core/configs/assets/app_images.dart';
import 'package:spotify_copy_v1/core/configs/assets/app_vectors.dart';
import 'package:spotify_copy_v1/presentation/auth/pages/signin.dart';
import 'package:spotify_copy_v1/presentation/auth/pages/signup.dart';

import '../../../core/configs/theme/app_colors.dart';

class SigupOrSigninPage extends StatelessWidget {
  const SigupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBg),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 55),
                  const Text(
                    "Enjoy listening to music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 21),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignupPage()));
                            },
                            title: "Register"),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SigninPage()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: context.isDarkmode
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

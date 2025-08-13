import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_copy_v1/common/widgets/button/basic_app_button.dart';
import 'package:spotify_copy_v1/core/configs/assets/app_vectors.dart';
import 'package:spotify_copy_v1/presentation/choose_mode/pages/choose_mode.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.introBg), fit: BoxFit.fill)),
        ),
        Container(
          color: Colors.black.withAlpha(15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo)),
              const Spacer(),
              const Text(
                "Enjoy listening to music",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) =>
                                const ChooseModePage()));
                  },
                  title: "Get Started")
            ],
          ),
        ),
      ],
    ));
  }
}

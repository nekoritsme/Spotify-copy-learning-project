import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_copy_v1/common/widgets/appbar/app_bar.dart';
import 'package:spotify_copy_v1/common/widgets/button/basic_app_button.dart';
import 'package:spotify_copy_v1/data/models/auth/signin_user_req.dart';
import 'package:spotify_copy_v1/domain/usecases/auth/signin.dart';
import 'package:spotify_copy_v1/presentation/auth/pages/signup.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 15),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                Either result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
                  email: _emailController.text.toString(),
                  password: _passwordController.text.toString(),
                ));

                result.fold(
                  (l) {
                    SnackBar snackBar = SnackBar(
                      content: Text(l.toString()),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()),
                        (route) => false);
                  },
                );
              },
              title: "Sign In",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField() {
    return TextField(
        controller: _emailController,
        decoration: InputDecoration(
          hintText: "Enter Email",
        ));
  }

  Widget _passwordField() {
    return TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: "Password",
        ));
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a member? ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignupPage()));
            },
            child: const Text(
              "Register Now",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

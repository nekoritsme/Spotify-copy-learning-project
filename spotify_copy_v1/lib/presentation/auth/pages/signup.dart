import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_copy_v1/common/widgets/appbar/app_bar.dart';
import 'package:spotify_copy_v1/common/widgets/button/basic_app_button.dart';
import 'package:spotify_copy_v1/data/models/auth/create_user_req.dart';
import 'package:spotify_copy_v1/presentation/auth/pages/signin.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../domain/usecases/auth/signup.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
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
            _fullNameField(),
            const SizedBox(height: 20),
            _emailField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                Either result = await sl<SignUpUseCase>().call(
                    params: CreateUserReq(
                  fullName: _fullName.text.toString(),
                  email: _email.text.toString(),
                  password: _password.text.toString(),
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
              title: "Create Account",
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField() {
    return TextField(
        controller: _fullName,
        decoration: InputDecoration(
          hintText: "Full Name",
        ));
  }

  Widget _emailField() {
    return TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: "Enter Email",
        ));
  }

  Widget _passwordField() {
    return TextField(
        controller: _password,
        decoration: InputDecoration(
          hintText: "Password",
        ));
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Do you have an account? ",
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
                      builder: (BuildContext context) => SigninPage()));
            },
            child: const Text(
              "Sign In",
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

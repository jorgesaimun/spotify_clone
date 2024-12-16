import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/register.dart';
import 'package:spotify_clone/presentation/home/pages/home_page.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 30,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _textButton(context, 'If You Need Any Support', 'Click Here'),
              const SizedBox(height: 8),
              _basicTextField('Email'),
              const SizedBox(height: 16),
              _basicTextField('Password'),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
              _signInButton(context),
              const SizedBox(height: 16),
              _orAndDivider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppVectors.googleLogo),
                  SvgPicture.asset(AppVectors.appleLogo),
                ],
              ),
              const SizedBox(height: 16),
              _textButton(context, 'Not A Member ?', 'Register Now'),
            ],
          ),
        ),
      ),
    );
  }

  BasicAppButton _signInButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      },
      title: 'Sign In',
      borderRadius: 32,
    );
  }

  Row _orAndDivider() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
        ),
        Text('Or'),
        Expanded(
          child: Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
        )
      ],
    );
  }

  TextField _basicTextField(String title) {
    return TextField(
      decoration: InputDecoration(label: Text(title)),
    );
  }

  Row _textButton(BuildContext context, String textTitle, String buttonTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textTitle),
        TextButton(
          onPressed: () {
            if (buttonTitle != 'Click Here') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>  Register(),
                ),
              );
            }
          },
          child: Text(
            buttonTitle,
            style: const TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}

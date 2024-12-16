import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/Register.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            const BasicAppBar(),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(AppVectors.topPattern),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppVectors.bottomPattern),
            ),
            const Align(
              alignment: Alignment.center,
              child: MainContent(),
            )
          ]),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.logo),
          const SizedBox(height: 20),
          _titleText(),
          const SizedBox(height: 24),
          _descriptionText(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _registerButton(context),
                const SizedBox(width: 8),
                _signInButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _titleText() {
    return const Text(
      "Enjoy Listening To Music",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Expanded _registerButton(BuildContext context) {
    return Expanded(
      child: BasicAppButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>  Register(),
            ),
          );
        },
        title: 'Register',
      ),
    );
  }

  Expanded _signInButton(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Signin(),
            ),
          );
        },
        child: Text(
          'Sign in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Padding _descriptionText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        "Discover new artists, albums, and playlists."
        "Create your own personalized music library."
        "Join the community of music lovers today!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.grey,
        ),
      ),
    );
  }
}

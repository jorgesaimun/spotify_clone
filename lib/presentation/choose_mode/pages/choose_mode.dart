import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  _ChooseModeState createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
  String _selectedMode = 'Dark';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _bgContainer(),
            Container(
              color: Colors.black.withOpacity(0.15),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const Spacer(),
                  const Text(
                    "Choose Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _themeOption(context),
                  const SizedBox(height: 24),
                  _continueButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _themeOption(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          themeMode(context, 'Dark'),
          const SizedBox(
            width: 100,
          ),
          themeMode(context, 'Light'),
        ],
      ),
    );
  }

  BasicAppButton _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SignupOrSignin(),
          ),
        );
      },
      title: 'Continue',
    );
  }

  Container _bgContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 40,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppImages.introBG,
          ),
        ),
      ),
    );
  }

  Column themeMode(BuildContext context, String mode) {
    bool isSelected = _selectedMode == mode;
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedMode = mode;
                });
                context.read<ThemeCubit>().updateTheme(
                    mode == 'Dark' ? ThemeMode.dark : ThemeMode.light);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.blue.withOpacity(0.2)
                      : const Color(0xff30393C).withOpacity(0.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    mode == 'Dark' ? AppVectors.moon : AppVectors.sun,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          '$mode Mode',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

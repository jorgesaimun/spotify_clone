import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.introBG,
                ),
              ),
            ),
          ),
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
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      themeMode(context,'Dark'),
                      const SizedBox(
                        width: 100,
                      ),
                      themeMode(context,'Light'),
                      ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>const SignupOrSignin(),
                      ),
                    );
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column themeMode(BuildContext context,String mode) {
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: GestureDetector(
              onTap: () {
                context.read<ThemeCubit>().updateTheme(mode == 'Dark' ? ThemeMode.dark : ThemeMode.light);
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff30393C).withOpacity(0.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    mode=='dark'?
                    AppVectors.moon:AppVectors.sun,
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
        Text('${mode} Mode'),
      ],
    );
  }
}

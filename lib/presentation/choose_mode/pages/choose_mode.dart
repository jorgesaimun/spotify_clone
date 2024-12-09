import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

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
                    Column(
                    children: [
                      ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff30393C).withOpacity(0.5),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                          AppVectors.moon,
                          fit: BoxFit.none,
                          ),
                        ),
                        ),
                      ),
                      ),
                      const SizedBox(
                      height: 24,
                      ),
                      const Text("Dark Mode"),
                    ],
                    ),
                    const SizedBox(
                    width: 100,
                    ),
                    Column(
                    children: [
                      ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff30393C).withOpacity(0.5),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                          AppVectors.sun,
                          fit: BoxFit.none,
                          ),
                        ),
                        ),
                      ),
                      ),
                      const SizedBox(
                      height: 24,
                      ),
                      const Text("Light Mode"),
                    ],
                    ),
                  ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                BasicAppButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => ChooseMode(),
                    //   ),
                    // );
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
}

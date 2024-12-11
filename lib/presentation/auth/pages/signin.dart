import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const BasicAppBar(),
              const SizedBox(
                width: 30,
              ),
              SvgPicture.asset(AppVectors.logo),
            ],
          ),
          const Text(
            'Sign In',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

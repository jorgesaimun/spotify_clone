import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _registerText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("If You Need Any Support"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Click Here',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _basicTextField('Full Name'),
              const SizedBox(
                height: 16,
              ),
              _basicTextField('Enter Email'),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BasicAppButton(
                onPressed: () {},
                title: 'Create Account',
                borderRadius: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _basicTextField(String title) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }

  Text _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}

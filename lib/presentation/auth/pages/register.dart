import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/home/pages/home_page.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _registerText(),
                _textButton(context, 'If You Need Any Support', 'Click Here'),
                const SizedBox(height: 8),
                _basicTextField('Full Name', _fullNameController),
                const SizedBox(height: 16),
                _basicTextField('Enter Email', _emailController),
                const SizedBox(height: 16),
                _basicTextField('Password', _passwordController),
                const SizedBox(height: 24),
                _createAccountButton(context),
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
                _textButton(context, 'Do You Have An Account?', 'Sign In'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BasicAppButton _createAccountButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () async {
        var result = await GetIt.I<SignupUseCase>().call(
          params: CreateUserReq(
            email: _emailController.text.toString(),
            fullName: _fullNameController.text.toString(),
            password: _passwordController.text.toString(),
          ),
        );
        result.fold((l) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l.message),
              backgroundColor: AppColors.primary,
            ),
          );
        }, (r) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account Created Successfully'),
              backgroundColor: AppColors.primary,
            ),
          );
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      },
      title: 'Create Account',
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
                  builder: (BuildContext context) => const Signin(),
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

  TextField _basicTextField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(label: Text(title)),
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

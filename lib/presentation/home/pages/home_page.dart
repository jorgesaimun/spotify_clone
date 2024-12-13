import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(),
      body: Column(),
    );
  }
}

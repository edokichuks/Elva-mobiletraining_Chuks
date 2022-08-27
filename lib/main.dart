import 'package:flutter/material.dart';
import 'package:muroexe_store/app/locator.dart';

import 'ui/home_screen/home_screen_view.dart';

void main() async {
  await setupAppLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muroexe store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        primarySwatch: Colors.grey,
      ),
      home: const HomeScreenView(),
    );
  }
}

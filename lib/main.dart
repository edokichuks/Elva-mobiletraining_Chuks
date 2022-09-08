import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'src/app/locator.dart';
import 'src/app/locator.router.dart';
import 'src/ui/home_screen/home_screen_view.dart';

void main() {
  //await setupAppLocation();
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
      //  home: const HomeScreenView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerate,
    );
  }
}

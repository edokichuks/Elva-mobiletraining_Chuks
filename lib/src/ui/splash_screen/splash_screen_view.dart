import 'package:flutter/material.dart';
import 'package:muroexe_store/src/core/constants/app_color.dart';
import 'package:muroexe_store/src/ui/home_screen/home_screen_view.dart';
import 'package:muroexe_store/src/ui/splash_screen/splash_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    waitTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, data, child) => Scaffold(
        backgroundColor: Muroexe.mainColor,
        body: Center(
          child: RichText(
            overflow: TextOverflow.fade,
            text: TextSpan(
                text: data.namePart1, //'M U R O ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade900,
                    letterSpacing: 3.0),
                children: [
                  TextSpan(
                    text: data.namePart2,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 3),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void waitTime() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreenView(),
        ),
      ),
    );
  }
}

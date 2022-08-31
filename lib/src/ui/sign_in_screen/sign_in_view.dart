import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muroexe_store/src/core/constants/app_color.dart';
import 'package:muroexe_store/src/ui/sign_in_screen/sign_in_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey.shade50, //Muroexe.mainColor,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Muroexe.textColor,
              ),
              visualDensity: VisualDensity.compact,
            ),
          ],
          title: RichText(
            overflow: TextOverflow.fade,
            text: TextSpan(
                text: 'M U R O ',
                style: const TextStyle(
                    fontSize: 25,
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.w900,
                    color: Muroexe.textColor,
                    letterSpacing: 3.0),
                children: [
                  TextSpan(
                    text: 'E X E',
                    style: TextStyle(
                        overflow: TextOverflow.fade,
                        color: Colors.grey.shade800,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 3),
                  ),
                ]),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 16),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Focus(
                            onFocusChange: (value) {
                              value = model.isFilled = true;
                              print('The value is now ' + value.toString());
                            },
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Muroexe.smallTextColor,

                              ///trying to toggle the focus scope here to enable filled textfield and unfilled textfield when not in focus
                              ///  focusNode: FocusScope.of(context).previousFocus() ? true : false,
                              onTap: model.toggleFilled,
                              decoration: InputDecoration(
                                filled: model.isFilled,
                                fillColor: Colors.grey.shade200,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Muroexe.underLineColor),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            toolbarOptions: const ToolbarOptions(
                              copy: true,
                              paste: true,
                              cut: true,
                              selectAll: true,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Muroexe.smallTextColor,
                            obscureText: model.isHidden,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Muroexe.underLineColor),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: model.toggleHidden,
                                  icon: model.isHidden
                                      ? Icon(Icons.visibility_off,
                                          color: Muroexe.underLineColor)
                                      : Icon(Icons.remove_red_eye),
                                )),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        model.forgotPassword,
                        style: const TextStyle(color: Muroexe.smallTextColor),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade900),
                          foregroundColor: MaterialStateProperty.all(
                              const Color(0xff3F00FF)),
                          overlayColor: MaterialStateProperty.all(
                              const Color(0xff3F00FF)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

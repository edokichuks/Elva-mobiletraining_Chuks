import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.grey.shade900,
              ),
              visualDensity: VisualDensity.compact,
            ),
          ],
          title: RichText(
            overflow: TextOverflow.fade,
            text: TextSpan(
                text: 'M U R O ',
                style: TextStyle(
                    fontSize: 25,
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade900,
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
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            onTap: model.toggleFilled,
                            decoration: InputDecoration(
                              filled: model.isFilled,

                              fillColor: Colors.grey.shade100,

                              // focusedBorder: OutlineInputBorder(
                              //
                              //   borderSide: BorderSide(
                              //       color: Colors.red,
                              //       style: BorderStyle.values[0],
                              //       width: 2),
                              // ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Expanded(child: TextField()),
                        ],
                      ),
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

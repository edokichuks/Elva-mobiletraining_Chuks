import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'test_multiple_viewmodel.dart';

class MultipleFuturesExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MultipleFuturesExampleViewModel>.reactive(
        builder: (context, viewModel, child) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          color: Colors.yellow,
                          // Show busy for number future until the data is back or has failed
                          child: viewModel.fetchingNumber
                              ? CircularProgressIndicator()
                              : Text(viewModel.fetchedNumber.toString()),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          color: Colors.red,
                          // Show busy for string future until the data is back or has failed
                          child: viewModel.fetchingString
                              ? CircularProgressIndicator()
                              : Text(viewModel.fetchedString),
                        ),
                        viewModel.fetchingChuksData
                            ? CircularProgressIndicator()
                            : Text(viewModel.chuksData1)
                      ],
                    ),
                    viewModel.fetchingChuksData2
                        ? const CircularProgressIndicator()
                        : Text('''
                    This is the displayed data
                    ${viewModel.chuksData2}
                    ''')
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => MultipleFuturesExampleViewModel());
  }
}

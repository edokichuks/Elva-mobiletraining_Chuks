import 'package:flutter/material.dart';
import 'package:muroexe_store/src/core/constants/app_color.dart';
import 'package:stacked/stacked.dart';
import 'home_screen_viewmodel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.limitedProducts(),

        ///This line does not mean
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) {
          return Scaffold(
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
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Text(
                      model.advertText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  model.hasError
                      ? Center(child: Text(model.networkErrorText))
                      : model.isBusy
                          ? const Center(
                              child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                          : Stack(
                              children: [
                                Image.network(
                                  model.product!.pImagePath,
                                  //model.data!.pImagePath,
                                  filterQuality: FilterQuality.high,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'EXTRA',
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.grey.shade800,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '\nSALES\n',
                                            style: TextStyle(
                                              fontSize: 60,
                                              color: Colors.grey.shade200,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Up to 60%',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        ]),
                                  ),
                                )
                              ],
                            ),
                  Center(
                    heightFactor: 2.0,
                    child: Text(
                      'FEATURED PRODUCTS',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                  model.hasError
                      ? Center(child: Text(model.networkErrorText))
                      : model.isBusy
                          ? const Center(
                              child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                          : GridView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              //addRepaintBoundaries: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisExtent: 400 //360,
                                      ),
                              itemBuilder: (_, index) =>
                                  Text('test trial') //FutureProduct(),
                              ),

                  // if(model.hasError){
                  //  return model.setBusy(false);
                  // },
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

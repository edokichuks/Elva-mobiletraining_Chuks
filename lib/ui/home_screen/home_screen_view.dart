import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_screen_viewmodel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.singleProduct(),
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white, //Colors.grey.shade200,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey.shade100,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey.shade900,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.lock_sharp,
                    size: 30,
                    color: Colors.grey.shade900,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey.shade900,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RichText(
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
                ],
              ),
              titleSpacing: -10,
              automaticallyImplyLeading: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.product == null
                      ? const Center(
                          child: Text('Check your network connections'))
                      : model.isBusy
                          ? const CircularProgressIndicator()
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
                      ? const Center(
                          child: Text('Check your network connections'))
                      : model.isBusy
                          ? const CircularProgressIndicator()
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
                                  const Text('test trial') //FutureProduct(),
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
            drawer: Drawer(
              backgroundColor: Colors.red,
              child: Drawer(
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.grey.shade200,
                    body: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      children: const [
                        DrawerText(text: 'New In'),
                        DrawerText(text: 'Sale'),
                        DrawerText(text: 'Sneakers'),
                        DrawerText(text: 'Sandals'),
                        DrawerText(text: 'Slippers'),
                        DrawerText(text: 'Accessories'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class DrawerText extends StatelessWidget {
  final String text;
  const DrawerText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
      ),
    );
  }
}

// class FeaturedProduct extends LimitedModel {
//   @override
//   Widget build(
//     BuildContext context,
//     LimitedModel model,
//   ) {
//
//   return  GridView.builder(
//       itemCount: 4,
//       shrinkWrap: true,
//       //addRepaintBoundaries: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate:
//       const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 5,
//           mainAxisExtent: 400 //360,
//       ),
//       itemBuilder: (_, index) =>
//
//      Container
//       (
//       height: 350,
//       width: 150,
//       decoration: const BoxDecoration(
//         color: Colors.white, //Colors.grey.shade200,
//       ),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Image.network(model.data![index].pImagePath),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   height: 30,
//                   width: 40,
//                   color: Colors.red.shade700,
//                   alignment: Alignment.center,
//                   child: const Text(
//                     '60%',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: Icon(
//                     Icons.favorite_border_outlined,
//                     color: Colors.grey.shade800,
//                     size: 30,
//                   ))
//             ],
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: Container(
//                   width: 50,
//                   height: 40,
//                   child: Image.network(model.data![index].pImagePath),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: 50,
//                   height: 40,
//                   child: Image.network(model.data![index].pImagePath),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
//             child: Text(
//               model.data![index].pTitle,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 overflow: TextOverflow.fade,
//               ),
//             ),
//           ),
//
//           RichText(
//             text: TextSpan(
//                 text: '\$${model.data![index].pPrice.toString()}',
//                 style: TextStyle(
//                     fontSize: 16,
//                     overflow: TextOverflow.fade,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.red.shade800 //Colors.grey.shade800,
//                     ),
//                 children: [
//                   TextSpan(
//                       text: '\$99.00',
//                       style: TextStyle(
//                         color: Colors.grey.shade800,
//                         fontWeight: FontWeight.w600,
//                         decoration: TextDecoration.lineThrough,
//                       ))
//                 ]),
//           ),
//         ],
//       ),),
//     );
//   },
// }

// class FutureProduct extends StatelessWidget {
//   const FutureProduct({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<LimitedModel>.reactive(
//         viewModelBuilder: () => LimitedModel(),
//         disposeViewModel: false,
//         onModelReady: (model) => model.initialise(),
//         initialiseSpecialViewModelsOnce: true,
//         builder: (context, model, child) {
//           return model.hasError
//               ? Text(model.error().toString())
//               : model.isBusy
//                   ? const CircularProgressIndicator()
//                   : GridView.builder(
//                       itemCount: 4,
//                       shrinkWrap: true,
//                       //addRepaintBoundaries: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 5,
//                               mainAxisExtent: 400 //360,
//                               ),
//                       itemBuilder: (_, index) => Container(
//                             height: 350,
//                             width: 150,
//                             decoration: const BoxDecoration(
//                               color: Colors.white, //Colors.grey.shade200,
//                             ),
//                             child: Column(
//                               children: [
//                                 Stack(
//                                   children: [
//                                     Image.network(model
//                                         .data![index.toUnsigned(0)].pImagePath),
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Container(
//                                         height: 30,
//                                         width: 40,
//                                         color: Colors.red.shade700,
//                                         alignment: Alignment.center,
//                                         child: const Text(
//                                           '60%',
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                         alignment: Alignment.topRight,
//                                         child: Icon(
//                                           Icons.favorite_border_outlined,
//                                           color: Colors.grey.shade800,
//                                           size: 30,
//                                         ))
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Expanded(
//                                       child: Container(
//                                         width: 50,
//                                         height: 40,
//                                         child: Image.network(
//                                             model.data![index].pImagePath),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         width: 50,
//                                         height: 40,
//                                         child: Image.network(
//                                             model.data![index].pImagePath),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 4.0, horizontal: 12),
//                                   child: Text(
//                                     model.data![index].pTitle,
//                                     textAlign: TextAlign.center,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       overflow: TextOverflow.fade,
//                                     ),
//                                   ),
//                                 ),
//                                 // Text(
//                                 //   ,
//                                 //   textAlign: TextAlign.center,
//                                 //   style: const TextStyle(
//                                 //     fontSize: 16,
//                                 //     overflow: TextOverflow.fade,
//                                 //   ),
//                                 // ),
//                                 RichText(
//                                   text: TextSpan(
//                                       text:
//                                           '\$${model.data![index].pPrice.toString()}',
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           overflow: TextOverflow.fade,
//                                           fontWeight: FontWeight.w800,
//                                           color: Colors.red
//                                               .shade800 //Colors.grey.shade800,
//                                           ),
//                                       children: [
//                                         TextSpan(
//                                             text: '\$99.00',
//                                             style: TextStyle(
//                                               color: Colors.grey.shade800,
//                                               fontWeight: FontWeight.w600,
//                                               decoration:
//                                                   TextDecoration.lineThrough,
//                                             ))
//                                       ]),
//                                 ),
//                               ],
//                             ),
//                           ));
//         });
//   }
// }

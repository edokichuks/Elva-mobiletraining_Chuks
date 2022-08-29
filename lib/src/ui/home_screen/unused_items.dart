///all commented items here will be removed and this file will be deleted on submission of task

///For Drawer removed
// drawer: Drawer(
// backgroundColor: Colors.red,
// child: Drawer(
// child: SafeArea(
// child: Scaffold(
// backgroundColor: Colors.grey.shade200,
// body: ListView(
// padding: const EdgeInsets.symmetric(
// vertical: 4, horizontal: 8),
// children: const [
// DrawerText(text: 'New In'),
// DrawerText(text: 'Sale'),
// DrawerText(text: 'Sneakers'),
// DrawerText(text: 'Sandals'),
// DrawerText(text: 'Slippers'),
// DrawerText(text: 'Accessories'),
// ],
// ),
// ),
// ),
// ),
// ),

// class DrawerText extends StatelessWidget {
//   final String text;
//   const DrawerText({
//     required this.text,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
//       ),
//     );
//   }
// }

///For Featured products removed
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

// import 'package:flutter/material.dart';
//
// import '../const/global_varriable.dart';
//
// class HomeAppBarWidget extends StatelessWidget {
//   const HomeAppBarWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(60),
//       child: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(gradient: GlobalVariables.appBarGradiant),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                   height: 42,
//                   margin: EdgeInsets.only(left: 15),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(7),
//                     elevation: 1,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           prefixIcon: InkWell(
//                             onTap: () {},
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 6),
//                               child: Icon(
//                                 Icons.search,
//                                 color: Colors.black,
//                                 size: 23,
//                               ),
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.only(top: 10),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                                 Radius.circular(7)
//                             ),
//                             borderSide: BorderSide.none,
//
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(7),
//
//                             ),
//                             borderSide: BorderSide(
//                                 color: Colors.black38,
//                                 width: 1
//                             ),
//                           ),
//                           hintText: "Search our Product",
//                           hintStyle: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 17
//                           )
//                       ),
//
//                     ),
//                   )),
//             ),
//             Container(
//               color: Colors.transparent,
//               height: 42,
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               child: Icon(Icons.mic,
//                 color: Colors.black,
//                 size: 25,),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }

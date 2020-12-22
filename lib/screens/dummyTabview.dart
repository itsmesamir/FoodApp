// import 'package:Food_app/screens/category_screen.dart';
// import 'package:Food_app/screens/favourite.dart';
// import 'package:flutter/material.dart';

// class TabsView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Meals"),
//           bottom: TabBar(
//             indicatorColor: Theme.of(context).accentColor,
//             labelColor: Colors.orange,
//             unselectedLabelColor: Colors.white,
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "Category",
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'favourite',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoryScreen(),
//             FavouriteScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }

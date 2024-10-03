import 'package:flutter/material.dart';

class BettingProvider with ChangeNotifier {
  String _selectedUserName = '';
  List<String> _userNames = [];

  String get selectedUserName => _selectedUserName;
  List<String> get userNames => _userNames;

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }

  Future<void> fetchUserNamesFromApi() async {
    // Make your API request here to fetch user names
    // Update _userNames with the response data
    // Notify listeners after updating the data
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UserNameSelectorBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userNameProvider = Provider.of<UserNameProvider>(context);

//     return Column(
//       children: [
//         ListTile(
//           title: Text('Select a User'),
//         ),
//         Divider(),
//         Expanded(
//           child: ListView.builder(
//             itemCount: userNameProvider.userNames.length,
//             itemBuilder: (context, index) {
//               final userName = userNameProvider.userNames[index];
//               return ListTile(
//                 title: Text(userName),
//                 onTap: () {
//                   userNameProvider.setSelectedUserName(userName);
//                   Navigator.of(context).pop(); // Close the bottom sheet
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserNameProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userNameProvider = Provider.of<UserNameProvider>(context);

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('User Name Selector'),
//         ),
//         body: GestureDetector(
//           onTap: () async {
//             await userNameProvider.fetchUserNamesFromApi();
//             showModalBottomSheet(
//               context: context,
//               builder: (_) => UserNameSelectorBottomSheet(),
//             );
//           },
//           child: Center(
//             child: Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//               ),
//               child: Consumer<UserNameProvider>(
//                 builder: (context, provider, child) {
//                   return Text(provider.selectedUserName.isEmpty
//                       ? 'Tap to select a user'
//                       : 'Selected User: ${provider.selectedUserName}');
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

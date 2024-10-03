import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dataBundle_provider.dart';

class UserNameSelectorBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNameProvider = Provider.of<UserNameProvider>(context);

    return Column(
      children: [
        ListTile(
          title: Text('Select a User'),
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: userNameProvider.userNames.length,
            itemBuilder: (context, index) {
              final userName = userNameProvider.userNames[index];
              final isSelected = userNameProvider.selectedStates[index];

              return ListTile(
                title: Text(userName),
                leading: Radio<bool>(
                  value: isSelected,
                  groupValue: true,
                  onChanged: (bool? value) {
                    userNameProvider.setSelectedIndex(index);
                    if (value == true) {
                      userNameProvider.setSelectedUserName(userName);
                      Navigator.of(context).pop(); // Close the bottom sheet
                    }
                  },
                ),
                onTap: () {
                  userNameProvider.setSelectedIndex(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

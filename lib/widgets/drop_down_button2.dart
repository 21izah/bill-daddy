import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:page_transition/page_transition.dart';

class DropDownButton2 extends StatefulWidget {
  const DropDownButton2({super.key});

  @override
  State<DropDownButton2> createState() => _DropDownButton2State();
}

class _DropDownButton2State extends State<DropDownButton2> {
  final List<String> items = [
    'Airtel',
    'MTN',
    'GLO',
    '9Mobile',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DropdownButton2(
      iconStyleData: IconStyleData(
        // icon: Icon(Icons.arrow_downward_outlined),
        iconEnabledColor: Colors.green,
        iconDisabledColor: Colors.blue,
      ),
      style: TextStyle(
        color: Colors.amber,
      ),
      barrierColor: Colors.transparent,
      underline: Container(),
      hint: Text(
        'hello',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;

          if (selectedValue == 'My Profile') {
            // Navigator.of(context).push(PageTransition(
            //   child: ProfilePage(),
            //   type: PageTransitionType.rightToLeft,
            // ));
          } else if (selectedValue == 'Bank Account') {
            // Navigator.of(context).push(PageTransition(
            //   child: CreatePinScreen(),
            //   type: PageTransitionType.rightToLeft,
            // ));
          }
        });
      },
      dropdownStyleData: DropdownStyleData(
        width: screenSize.width * 0.2,
        offset: Offset(10, 10),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.all(10),
          height: screenSize.height * 0.05,
          width: screenSize.width * 0.215,
          decoration: BoxDecoration(
            color: Colors.blue,
            // Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(5),
          )),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    );
  }
}

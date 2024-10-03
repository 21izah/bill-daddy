import 'package:flutter/material.dart';
import '../../data/api_calls/jsonProvider.dart';

import '../../models/airtime_model.dart';
import '../../widgets/drop_down_button2.dart';
import '../../data/api_calls/jsonProvider.dart';

// import '../../widgets/drop_down_button2.dart';
// import 'package:cool_dropdown/cool_dropdown.dart';

class AirtimeProviderNumberContainer extends StatefulWidget {
  const AirtimeProviderNumberContainer({super.key});

  @override
  State<AirtimeProviderNumberContainer> createState() =>
      _AirtimeProviderNumberContainerState();
}

class _AirtimeProviderNumberContainerState
    extends State<AirtimeProviderNumberContainer> {
  final List items = [
    'airtel',
    'mtn',
    'glo',
    '9mobile',
    'smile',
  ];
  //
  dynamic selectedValue = 'mtn';
  // text controllers
  final _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: ApiProvider().getAirtimeProviders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
          return Container(
            child: Row(children: [
              DropdownButton(
                underline: Container(),
                borderRadius: BorderRadius.circular(5),
                items: [
                  DropdownMenuItem(
                    value: data['data'][4]['provider'],
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: Image.asset('lib/assets/airtel.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Airtel'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: data['data'][1]['provider'],
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: Image.asset('lib/assets/mtn.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('MTN'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: data['data'][3]['provider'],
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: Image.asset('lib/assets/glo.jpeg'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('GLO'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: data['data'][2]['provider'],
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: Image.asset('lib/assets/9mobile.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('9Mobile'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: data['data'][0]['provider'],
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: Image.asset('lib/assets/smile_network.jpeg'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Smile'),
                      ],
                    ),
                  ),
                ],
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;

                    // if (selectedValue == 'My Profile') {
                    //   // Navigator.of(context).push(PageTransition(
                    //   //   child: ProfilePage(),
                    //   //   type: PageTransitionType.rightToLeft,
                    //   // ));
                    // } else if (selectedValue == 'Bank Account') {
                    //   // Navigator.of(context).push(PageTransition(
                    //   //   child: CreatePinScreen(),
                    //   //   type: PageTransitionType.rightToLeft,
                    //   // ));
                    // }
                  });
                },
              ),
              // DropDownButton2(),
              Expanded(
                child: Container(
                  // width: screenSize.width,
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Input Phone Number';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.blue),
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _phoneNumberController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 15,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(5),
                        // hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: screenSize.width * 0.03),
                        filled: true,
                        fillColor: Colors.white,
                        border: UnderlineInputBorder()
                        //  OutlineInputBorder(
                        //   borderSide: BorderSide.none,
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

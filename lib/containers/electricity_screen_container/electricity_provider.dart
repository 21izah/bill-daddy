import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/api_calls/jsonProvider.dart';

class ElectricityProvider extends StatefulWidget {
  const ElectricityProvider({super.key});

  @override
  State<ElectricityProvider> createState() => _ElectricityProviderState();
}

class _ElectricityProviderState extends State<ElectricityProvider> {
  final _username = Hive.box('username');

  bool isSwitched1 = true;
  final List items = [
    'airtel',
    'mtn',
    'glo',
    '9mobile',
    'smile',
  ];
  //
  dynamic selectedValue = 'mtn';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Provider'),
              FutureBuilder(
                  future: ApiProvider().getAirtimeProviders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map<String, dynamic> data =
                          snapshot.data! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            borderRadius: BorderRadius.circular(5),
                            items: [
                              DropdownMenuItem(
                                value: _username.get('airtel') ??
                                    data['data'][4]['provider'],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                        child: Image.asset(
                                            'lib/assets/airtel.png'),
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
                                value: _username.get('mtn') ??
                                    data['data'][1]['provider'],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                        child:
                                            Image.asset('lib/assets/mtn.png'),
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
                                value: _username.get('glo') ??
                                    data['data'][3]['provider'],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                        child:
                                            Image.asset('lib/assets/glo.jpeg'),
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
                                value: _username.get('9mobile') ??
                                    data['data'][2]['provider'],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                        child: Image.asset(
                                            'lib/assets/9mobile.png'),
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
                                value: _username.get('smile') ??
                                    data['data'][0]['provider'],
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 10,
                                        child: Image.asset(
                                            'lib/assets/smile_network.jpeg'),
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
                              });
                            },
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            height: 10,
                            width: 10,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.blue,
                            ))),
                      );
                    }
                  }),
              Divider(
                color: Colors.amber,
                endIndent: 5,
                indent: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(
                      left: 70,
                      right: 70,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Center(
                      child: Text('Prepaid'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(
                      left: 70,
                      right: 70,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Center(
                      child: Text('Postpaid'),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/api_calls/jsonProvider.dart';
import '../../models/cable_model.dart';
import '../../widgets/drop_down_button2 copy.dart';

class TvSmartCardContainer extends StatefulWidget {
  const TvSmartCardContainer({super.key});

  @override
  State<TvSmartCardContainer> createState() => _TvSmartCardContainerState();
}

class _TvSmartCardContainerState extends State<TvSmartCardContainer> {
  final _username = Hive.box('username');
  final List items = [
    'Airtel',
  ];
  //
  dynamic selectedValue = 'dstv';
  final _smartcardNumberController = TextEditingController();
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Provider'),
            FutureBuilder<CableProviderModel>(
              future: ApiProvider().getCableProviders(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final CableProviderModel? data = snapshot.data;
                  // Map<String, dynamic> data = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        borderRadius: BorderRadius.circular(5),
                        items: [
                          DropdownMenuItem(
                            value: _username.get('gotv') ??
                                data!.data![0].provider,
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
                                Text('GoTv'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: _username.get('startimes') ??
                                data!.data![1].provider,
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
                                Text('Startimes'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: _username.get('dstv') ??
                                data!.data![2].provider,
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
                                Text('Dstv'),
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
                    child: Shimmer.fromColors(
                      baseColor: Color.fromARGB(
                          255, 209, 217, 231), // Color when not shimmering
                      highlightColor:
                          Colors.grey[100]!, // Color when shimmering
                      period:
                          Duration(milliseconds: 1000), // Duration of one cycle
                      child: Container(
                        color: Colors.white,
                        height: 50,
                        width: screenSize.width - 10,
                      ),
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Smartcard Number'),
                Row(
                  children: [
                    Text('Beneficiaries'),
                    Icon(
                      Icons.arrow_right,
                    ),
                  ],
                )
              ],
            ),
            Container(
              // width: screenSize.width,
              padding: const EdgeInsets.all(0.0),
              child: TextFormField(
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Input Phone Number';
                //   }
                //   return null;
                // },
                style: TextStyle(color: Colors.blue),
                cursorColor: Colors.blue,
                keyboardType: TextInputType.number,
                controller: _smartcardNumberController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // suffixIcon: IconButton(
                  //   onPressed: () {
                  //     _smartcardNumberController.clear();
                  //   },
                  //   icon: Icon(
                  //     Icons.clear,
                  //     size: 15,
                  //   ),
                  // ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Please input your smartcard number',
                  hintStyle: TextStyle(
                      color: Colors.black, fontSize: screenSize.width * 0.03),
                  filled: true,
                  fillColor: Color.fromARGB(255, 209, 217, 231),
                  border:

                      //  UnderlineInputBorder()
                      OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                top: 30,
              ),
              child: Text('Subscription Period'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 156, 218, 188)),
                child: Text(
                  '30 days',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20),
              child: Text('Package'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('data'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Product Name'),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 10,
                                  child: Image.asset('lib/assets/mtn.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('MTN'),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [Text('Amount'), Text('#504')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Save Beneficiary'),
                            Switch.adaptive(
                              activeColor:
                                  Theme.of(context).colorScheme.background,
                              activeTrackColor: Colors.deepOrange,
                              inactiveTrackColor: Colors.deepOrange,
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ]),
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select the package you will like to pay for'),
                        Icon(Icons.arrow_right),
                      ]),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 217, 217),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Save Beneficiary'),
                  Switch.adaptive(
                    activeColor: Theme.of(context).colorScheme.background,
                    activeTrackColor: Colors.deepOrange,
                    inactiveTrackColor: Colors.deepOrange,
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: screenSize.width - 5,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Comfirm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 100,
              width: screenSize.width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

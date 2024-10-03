import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/register_model.dart';

class ProfileHomeContainer extends StatefulWidget {
  const ProfileHomeContainer({super.key});

  @override
  State<ProfileHomeContainer> createState() => _ProfileHomeContainerState();
}

class _ProfileHomeContainerState extends State<ProfileHomeContainer> {
  final _username = Hive.box('username');
  final RegisterModel _registerModel = RegisterModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
      ),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('lib/assets/man(1).png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Hi,${_username.get('name')}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 20,
                  width: 20,
                  child: Image.asset('lib/assets/customer-service(1).png')),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: Container(
                  height: 20,
                  width: 20,
                  child: Image.asset('lib/assets/qr-code(2).png'),
                ),
              ),
              Icon(Icons.notifications),
            ],
          )
        ]),
      ),
    );
  }
}

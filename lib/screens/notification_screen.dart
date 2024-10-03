import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic> messages = [
    {
      'message1':
          'Congratulations! You have purchased an MTN data bundle (more data) 22GB successfully',
      'date': 'Thur, Feb 29th 2024'
    },
    {
      'message2':
          'Congratulations! You have purchased #15,000 of electricity token successfully.',
      'date': 'Tue, Feb 79th 2024'
    },
    {
      'message3':
          'Congratulations! You have purchased #2,500 AIrtel airtime successfully.',
      'date': 'Mon, Feb 29th 2024'
    },
  ];

  void openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.mark_email_read_outlined,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Mark as read',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.grey[700],
            ),
          )
        ],
        backgroundColor: Colors.grey[200],
        title: Text(
          'Notification',
          style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: messages.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              bottom: 10,
            ),
            child: GestureDetector(
              onTap: () {
                openBottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                // height: screenSize.height * 0.15,
                width: screenSize.width - 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10,
                        top: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Badge(
                              offset: Offset(-15, -5),
                              largeSize: 16,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                child:
                                    Image.asset('lib/assets/billDaddyLogo.png'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 0.0,
                          top: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Congratulations! You have purchased an  data bundle (more data) 22GB successfully',
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Thur, Feb 29th 2024',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/balance_obscure_provider.dart';

class DashboardHomeDetail extends StatefulWidget {
  const DashboardHomeDetail({super.key});

  @override
  State<DashboardHomeDetail> createState() => _DashboardHomeDetailState();
}

class _DashboardHomeDetailState extends State<DashboardHomeDetail> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: screenSize.width - 20,
        height: screenSize.height * .22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Available Balance  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.height * 0.015,
                          ),
                        ),
                        Consumer<BalanceObscureProvider>(
                          builder: (context, si, child) => GestureDetector(
                            onTap: () => si.obscure(),
                            child: si.passwordObscured
                                ? Icon(
                                    size: screenSize.height * 0.02,
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                    size: screenSize.height * 0.02,
                                  ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Transaction History >',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenSize.height * 0.015,
                      ),
                    ),
                  ],
                ),
                Consumer<BalanceObscureProvider>(
                  builder: (context, ki, child) => ki.passwordObscured
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('#',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: screenSize.height * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text('.00',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                              '****',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                ),
                Row(
                  children: [
                    Text('Earn rewards daily  >',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset('lib/assets/image-gallery.png'),
                          ),
                          Text('Add money',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.height * 0.015,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.blue.shade600,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 20,
                            width: 20,
                            child: Image.asset('lib/assets/transfer.png'),
                          ),
                          Text('Transfer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.height * 0.015,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: Image.asset('lib/assets/withdraw.png'),
                          ),
                          Text('Withdraw',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.height * 0.015,
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

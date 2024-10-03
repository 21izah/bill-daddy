import 'package:flutter/material.dart';

class TvProvider extends StatefulWidget {
  const TvProvider({super.key});

  @override
  State<TvProvider> createState() => _TvProviderState();
}

class _TvProviderState extends State<TvProvider> {
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
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('lib/assets/dstv.jpeg'),
                  ),
                  Text(
                    '  DSTV',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

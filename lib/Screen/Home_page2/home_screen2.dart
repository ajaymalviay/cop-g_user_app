import 'package:eshop_multivendor/Helper/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height/1,
          child: ListWheelScrollView.useDelegate(
              controller: FixedExtentScrollController(),
              diameterRatio:1.5,
              itemExtent:900,
              childDelegate:ListWheelChildBuilderDelegate(
              childCount: 10,
              builder: (context, index) {
               return  Container(
                   height: MediaQuery.of(context).size.height/1,
                   width: MediaQuery.of(context).size.width/1,
                   child: Image.asset('assets/images/image2.png',fit: BoxFit.fill,));
                      },)),
        ),
      ),
    );
  }
}


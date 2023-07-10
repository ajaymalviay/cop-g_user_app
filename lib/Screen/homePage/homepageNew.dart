
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height/1,
          child: ListWheelScrollView.useDelegate(
              controller: FixedExtentScrollController(),
              diameterRatio:9,
              itemExtent:900,
              physics:FixedExtentScrollPhysics(),
              perspective: 0.009,
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




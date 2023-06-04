

import 'dart:math';

import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int one = Random().nextInt(18);
  int two = Random().nextInt(18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<int>(
          tween: IntTween(begin:min(one,two),end: max(one, two)),
          duration: const Duration(seconds: 3),
          builder: (_,index, __){
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.primaries[one],
                    Colors.primaries[two],
                  ],
                ),
              ),
            );
          },
          curve: Curves.easeInOutBack,
          onEnd: (){
            one = Random().nextInt(18);
            two = Random().nextInt(18);
            setState(() {

            });
          },
        ),
      ),
    );
  }
}


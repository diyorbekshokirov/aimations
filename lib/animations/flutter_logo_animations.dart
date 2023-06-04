
// Flutet logo Animation

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomPage(),
    );
  }
}

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage>  with SingleTickerProviderStateMixin{
  late AnimationController _animatedContainer;
  late final _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animatedContainer = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(1.5, 0.0)).
    animate(CurvedAnimation(parent: _animatedContainer, curve: Curves.easeIn),
    );


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animatedContainer.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: FlutterLogo(size: 150.0,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle),
        onPressed: () {
          _animatedContainer.forward();
        },
      ),
    );
  }
}



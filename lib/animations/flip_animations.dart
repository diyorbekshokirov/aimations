



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
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animatedContainer = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animatedContainer)..addListener(() {
      setState(() {

      });
    })..addStatusListener((AnimationStatus status) {
      _status = status;
    });


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
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(3.14 * _animation.value),
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Icon(Icons.accessibility_sharp,color: Colors.white,),
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



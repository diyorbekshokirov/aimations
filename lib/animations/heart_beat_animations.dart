


///  Pils Animation
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
    _animation = Tween<Size>(
      begin: const Size(100, 100),
      end: Size(120, 120),
    ).animate(CurvedAnimation(parent: _animatedContainer, curve: Curves.bounceIn)
    );

    _animatedContainer.addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
        _animatedContainer.repeat();
      }
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
        child:  AnimatedBuilder(
          animation: _animation,
          builder: (ctx,ch) =>Container(
            width: _animation.value.width,
            height: _animation.value.height,
            child: const Icon(Icons.favorite,
              color: Colors.red,
              size: 150,
            ),
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








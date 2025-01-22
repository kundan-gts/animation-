import 'package:flutter/material.dart';

void main(){

   runApp(MaterialApp(
      home: animation()
   ));

}

class animation extends StatefulWidget {
  animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {
  double w=200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // container
            AnimatedContainer(
              height: 200,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("./assets/car.png"),fit: BoxFit.fill)
              ), duration: Duration(seconds: 1),
            ),
            ElevatedButton(onPressed: (){
                setState(() {
                   w==200 ? w=300: w=200;
                });
            }, child: Text("move")),
          ],
        ),
      ),
    );
  }
}

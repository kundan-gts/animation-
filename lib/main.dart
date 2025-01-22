
import 'package:flutter/material.dart';

void main(){

   runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
      home: animation()
   ));

}

class animation extends StatefulWidget {
  animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {

  Matrix4 m = Matrix4.rotationY(0);
  Alignment alig= Alignment.centerLeft;
  Alignment bg= Alignment.centerLeft;
  Alignment en=Alignment.centerRight;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // container
            TweenAnimationBuilder(
              tween: Tween(begin: bg,end:en),
              duration: Duration(seconds: 2),
              curve: Curves.bounceOut,
              builder:(context,value,widget) {
                return Align(
                  alignment: value,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: m,
                    child: Container(
                        height: 200,
                        width: 250,
                        decoration: const  BoxDecoration(
                            image: DecorationImage(image: AssetImage(
                                "./assets/car.png"), fit: BoxFit.fill,)
                        ),

                      ),
                    ),
                  );
                },
                onEnd: (){
                    setState(() {
                         var tmp=bg;
                         bg=en;
                         en=tmp;
                         m==Matrix4.rotationY(0) ? m=Matrix4.rotationY(3.14159): m=Matrix4.rotationY(0);
                    });
                },
            ),
            ElevatedButton(onPressed: (){
                setState(() {
                  alig==Alignment.centerLeft ? alig=Alignment.centerRight: alig=Alignment.centerLeft;;
                });
            }, child: Text("move")),

          ],
        ),
      ),
    );
  }
}

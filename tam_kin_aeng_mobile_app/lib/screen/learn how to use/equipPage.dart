import 'package:flutter/material.dart';

class equipPage extends StatefulWidget {
  @override
  _equipPageState createState() => _equipPageState();
}

class _equipPageState extends State<equipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logoRevised.png",
              height: 30,
            ),
          ],
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 9 / 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          InkWell(
              onTap: () => print("1"),
              child: Container(
                color: Color(0xffD92E40),
                    child: Column(
                      children: [
                        Row(children: [
                          Container(
                            child:Wrap(children: [
                                Image.asset("assets/images/ceramicLogo.png",height: 40,),
                                Image.asset("assets/images/ceramicLogo.png",height: 40,),
                                Image.asset("assets/images/ceramicLogo.png",height: 40,),
                                Image.asset("assets/images/ceramicLogo.png",height: 40,),
                            ],)
                          )
                        ],)
                      ],
                    ),
              ),
            ),
                    Image.asset("assets/images/pan.png"),
                  ],
                ),
              );
  }
}

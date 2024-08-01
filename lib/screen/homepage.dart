import 'dart:math';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int s = DateTime.now().second;
  int m = DateTime.now().minute;
  int h = DateTime.now().hour;
  String Time_Digit = "";

  void setclock() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        final now = DateTime.now();
        s = now.second;
        m = now.minute;
        h = now.hour;
        Time_Digit = "${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
      });
      setclock(); // Call setclock recursively
    });
  }
  @override
  void initState() {
    super.initState();
    setclock();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("HOME PAGE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,bottom: 0,top: 18),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 100,right: 100),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2,2),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child:  const Center(
                    child: Text("ANALOG CLOCK",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 9,
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(320),),
                    image: const DecorationImage(
                      image: NetworkImage('https://clipart-library.com/images/6iy5bje5T.png'),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Transform.rotate(
                          angle: pi/2,
                          child: Transform.rotate(
                            angle: (h % 12) * (pi * 2) / 12,
                            child: const Divider(
                              color: Colors.black,
                              indent: 70,
                              endIndent: 160,
                              thickness: 5.5,
                            ),

                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: pi/2,
                          child: Transform.rotate(
                              angle: m * (pi * 2) / 60,
                            child: const Divider(
                              color: Colors.black,
                              indent: 60,
                              endIndent: 160,
                              thickness: 4,

                            ),

                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: pi/2,
                          child: Transform.rotate(
                            angle: s * (pi * 2) / 60,
                            child: const Divider(
                              color: Colors.red,
                              indent: 40,
                              endIndent: 150,
                              thickness: 2,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
            // time clock digit
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 15,left: 100,right: 100),
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2,2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child:  const Center(
                  child: Text("TIME CLOCK",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.black,
                    ),
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.white,Colors.white, Colors.green,],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3,0.4,0.6,0.7],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50),),
                  ),
                  child: Center(
                    child: Text(Time_Digit,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('homepage');
              },
              icon: const Icon(Icons.home_filled,
              color: Colors.black,
              ),
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('clockpage');
              },
              icon: const Icon(Icons.punch_clock,
              color: Colors.black,
              ),
            ),
            label: "CLOCK",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('stoppage');
              },
              icon: const Icon(Icons.stop_circle_rounded,
              color: Colors.black,
              ),
            ),
            label: "STOP",
          ),
        ],
      ),

    );
  }
}

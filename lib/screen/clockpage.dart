import 'package:flutter/material.dart';

class Clock_Page extends StatefulWidget {
  const Clock_Page({super.key});

  @override  State<Clock_Page> createState() => _Clock_PageState();
}

class _Clock_PageState extends State<Clock_Page> {
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
      setclock();
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('homepage');
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Center(
            child: Text("CLOCK PAGE",
           style: TextStyle(
             color: Colors.black,
             fontSize: 22,
             fontWeight: FontWeight.bold,
           ),
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              height: 380,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),

              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Transform.scale(
                      scale: 7,
                      child: CircularProgressIndicator(
                        value: s / 60,
                        color: Colors.red,
                        strokeWidth: 2,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.scale(
                      scale: 6,
                      child: CircularProgressIndicator(
                        value: m / 60,
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.scale(
                      scale: 4.8,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: Colors.white,
                        color: Colors.green,
                        value: (h % 12) / 12,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(Time_Digit,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
                Navigator.of(context).popAndPushNamed('homepage');
              },
              icon: const Icon(Icons.home_filled,color: Colors.black,),
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.punch_clock,color: Colors.black,),
            ),
            label: "CLOCK",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('stoppage');
              },
              icon: const Icon(Icons.stop_circle_rounded,color: Colors.black,),
            ),
            label: "STOP",
          ),
        ],
      ),
    );
  }
}

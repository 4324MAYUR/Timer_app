import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stop_Page extends StatefulWidget {
  const Stop_Page({super.key});

  @override
  State<Stop_Page> createState() => _Stop_PageState();
}

class _Stop_PageState extends State<Stop_Page> {
  int s = 0;
  int m = 0;
  int h = 0;
  int ms = 0;
  bool started = false;

  List<String> laps = [];

  void startStopTimer() {
    if (started) {
      started = false;
    } else {
      started = true;
      _runStopwatch();
    }
    setState(() {});
  }

  void _runStopwatch() {
    if (!started) return;

    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        ms += 10;
        if (ms >= 1000) {
          ms = 0;
          s++;
        }
        if (s >= 60) {
          s = 0;
          m++;
          if (m >= 60) {
            m = 0;
            h++;
          }
        }
      });
      _runStopwatch();
    });
  }

  void reset() {
    setState(() {
      s = 0;
      m = 0;
      h = 0;
      ms = 0;
      started = false;
      laps.clear();
    });
  }

  void addLap() {
    String lap =
        "${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}:${(ms ~/ 10).toString().padLeft(2, '0')}";
    setState(() {
      laps.add(lap);
    });
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
          child: Text(
            "STOP PAGE",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${h.toString().padLeft(2, '0')} : ${m.toString().padLeft(2, '0')} : ${s.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  ".${(ms ~/ 10).toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawMaterialButton(
                  onPressed: startStopTimer,
                  elevation: 5,
                  fillColor: Colors.black,
                  constraints: const BoxConstraints(
                    minWidth: 25,
                    minHeight: 25,
                  ),
                  shape: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: started
                        ? const Icon(
                      Icons.pause_circle,
                      size: 35,
                      color: Colors.white,
                    )
                        : const Icon(
                      Icons.play_arrow_sharp,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: addLap,
                  elevation: 5.0,
                  fillColor: Colors.black,
                  constraints: const BoxConstraints(
                    minWidth: 15,
                    minHeight: 15,
                  ),
                  shape: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.flag_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: reset,
                  elevation: 5.0,
                  fillColor: Colors.black,
                  constraints: const BoxConstraints(
                    minWidth: 15,
                    minHeight: 15,
                  ),
                  shape: const CircleBorder(),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.refresh,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("LAP ${index + 1}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    ),
                    trailing: Text(laps[index]),
                  );
                },
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
              icon: const Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('clockpage');
              },
              icon: const Icon(
                Icons.punch_clock,
                color: Colors.black,
              ),
            ),
            label: "CLOCK",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('stoppage');
              },
              icon: const Icon(
                Icons.stop_circle_rounded,
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

import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoros = 0;

  void onTick(Timer timer) {
    // On tick, substract 1 second from totalSeconds, and setState so screen can be updated

    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSeconds = 1500;
      });

      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String formatTime(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split('.').first.substring(2, 7);
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = 1500;
      timer.cancel();
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              formatTime(totalSeconds),
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 89,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 128,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline_rounded
                          : Icons.play_circle_outlined,
                    )),
                IconButton(
                  onPressed: onResetPressed,
                  icon: const Icon(Icons.restore_outlined),
                  iconSize: 32,
                  color: Theme.of(context).cardColor,
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pomodoros',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      Text(
                        "$totalPomodoros",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/timer_example/timer_provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TimerProvider>(context, listen: false);
    
    Timer.periodic(Duration(seconds: 1), (timer){
      provider.setTime();
    });
  }


  @override
  Widget build(BuildContext context) {
    print("build call");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
      ),
      body: Center(
        child: Consumer<TimerProvider>(
          builder: (BuildContext context, TimerProvider value, Widget? child) {
            return Text(
              value.time.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TimerProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<TimerProvider>();
    final providerWatch = context.watch<TimerProvider>();
    provider.calculationTime();
    return Scaffold(
        appBar: AppBar(
          title: const Text("TimerOnProvider"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 65,
                  width: 65,
                  margin: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      provider.restart();
                    },
                    child: const Icon(Icons.restart_alt),
                  )),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 85,
                      width: 85,
                      margin: const EdgeInsets.all(10),
                      child: CircularProgressIndicator(
                        value: providerWatch.percent,
                        backgroundColor: Colors.yellow[800],
                        strokeWidth: 8,
                      )),
                  Positioned(
                      child: Text(
                        providerWatch.timeStr,
                        style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              Container(
                  height: 65,
                  width: 65,
                  margin: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      providerWatch.isStart ? provider.pause() : provider.start(context);
                    },
                    child: providerWatch.isStart
                        ? const Icon(Icons.pause_circle_outline, size: 55,)
                        : const Icon(Icons.play_circle_outline_sharp, size: 55,),
                  )),
            ],
          ),
        ));
  }
}


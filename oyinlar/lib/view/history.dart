import 'package:flutter/material.dart';

import 'package:oyinlar/provider/home_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class History extends StatefulWidget {
  History(
      {super.key, required this.redGamewinner, required this.blueGamewinner});
  int redGamewinner;
  int blueGamewinner;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              homeProvider.restartGame();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Row(
              children: [
                const Text(
                  "Ferrari:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(widget.redGamewinner.toString())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Row(
              children: [
                const Text(
                  "Tesla:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(widget.blueGamewinner.toString())
              ],
            ),
          )
        ],
      )),
    );
  }
}

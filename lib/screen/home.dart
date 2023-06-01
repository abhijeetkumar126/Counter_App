import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  String countKey = 'home_count';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final box = Hive.box<int>('tutorial');
    final value = box.get(countKey) ?? 0;
    count = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter'),
      ),
      body: Center(
        child: Text('you have pressed : $count times'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isIncrement,
        label: const Text('increment'),
      ),
    );
  }

  void isIncrement() {
    final box = Hive.box<int>('tutorial');
    setState(() {
      count = count + 1;
    });
    box.put(countKey, count);
  }
}

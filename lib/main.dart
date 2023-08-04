import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

const url =
    'https://cdn.jsdelivr.net/gh/q1uyj/BlogImage/img/202308042149153.png';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Opacity(
          opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withAlpha(100),
                    spreadRadius: 10,
                  )
                ],
              ),
              child: Image.network(url),
            ),
          ),
        ));
  }
}

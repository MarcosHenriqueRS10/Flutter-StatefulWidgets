import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double iconSize = 200; // Tamanho inicial do ícone (M)
  double red = 0;
  double green = 0;
  double blue = 0;

  void _updateIconSize(double change) {
    setState(() {
      iconSize = (iconSize + change).clamp(100.0, 300.0); // Limita o valor entre 100 e 300
    });
  }

  void _setIconSize(double size) {
    setState(() {
      iconSize = size;
    });
  }

  void _updateColor(double value, String color) {
    setState(() {
      if (color == 'red') {
        red = value;
      } else if (color == 'green') {
        green = value;
      } else if (color == 'blue') {
        blue = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter State'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => _updateIconSize(-10),
          ),
          IconButton(
            icon: const Text('S'),
            onPressed: () => _setIconSize(100),
          ),
          IconButton(
            icon: const Text('M'),
            onPressed: () => _setIconSize(200),
          ),
          IconButton(
            icon: const Text('L'),
            onPressed: () => _setIconSize(300),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _updateIconSize(10),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.lock_clock,
                size: iconSize,
                color: Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    activeColor: Colors.red,
                    value: red,
                    min: 0,
                    max: 255,
                    onChanged: (value) => _updateColor(value, 'red'),
                  ),
                ),
                Text(
                  red.toInt().toString(),
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    activeColor: Colors.green,
                    value: green,
                    min: 0,
                    max: 255,
                    onChanged: (value) => _updateColor(value, 'green'),
                  ),
                ),
                Text(
                  green.toInt().toString(),
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    activeColor: Colors.blue,
                    value: blue,
                    min: 0,
                    max: 255,
                    onChanged: (value) => _updateColor(value, 'blue'),
                  ),
                ),
                Text(
                  blue.toInt().toString(),
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

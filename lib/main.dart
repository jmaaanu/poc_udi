import 'package:flutter/material.dart';
import 'package:poc_udi/barcode_scanner_with_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavigationBarExample(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF375F9C),
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SimpleBarcodeScannerPage(),
    ZebraScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POC UDI'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.barcode_reader),
            label: 'Zebra',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ZebraScreen extends StatelessWidget {
  const ZebraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SimpleBarcodeScannerPage extends StatefulWidget {
  const SimpleBarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<SimpleBarcodeScannerPage> createState() =>
      _SimpleBarcodeScannerPageState();
}

class _SimpleBarcodeScannerPageState extends State<SimpleBarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BarcodeScannerWithController(),
                ),
              ),
              child: const Text('Open Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}

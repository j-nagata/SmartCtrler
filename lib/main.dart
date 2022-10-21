import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SmartCtrlerApp());
}

ThemeData _buildTheme(brightness) {
  final baseTheme =
      ThemeData(brightness: brightness, primarySwatch: Colors.pink);

  return baseTheme.copyWith(
      textTheme: GoogleFonts.mPlus1TextTheme(baseTheme.textTheme));
}

class SmartCtrlerApp extends StatelessWidget {
  const SmartCtrlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCtrler',
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SmartCtrler'),
          centerTitle: true,
        ),
        body: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: const [
                  RoomCard(
                    name: 'ベランダ 1',
                    disciption: "リビング キッチン側のライト",
                  ),
                  RoomCard(
                    name: 'ベランダ 2',
                    disciption: "リビング ベランダ側のライト",
                  ),
                  RoomCard(
                    name: '部屋',
                    disciption: '部屋のライト',
                  ),
                  RoomCard(
                    name: '洗濯の部屋',
                    disciption: "洗濯の部屋のライト",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class RoomCard extends StatefulWidget {
  const RoomCard({super.key, required this.name, required this.disciption});

  final String name;
  final String disciption;

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool _isEnabled = false;

  void switchIsEnabled() => setState(() {
        _isEnabled = !_isEnabled;
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
        data: _isEnabled
            ? _buildTheme(Brightness.light)
            : _buildTheme(Brightness.dark),
        child: Card(
            elevation: 10,
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.light),
                  title: Text(
                    widget.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(widget.disciption),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 20, bottom: 20),
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () => switchIsEnabled(),
                        child: const Text('切り替え')))
              ],
            )));
  }
}

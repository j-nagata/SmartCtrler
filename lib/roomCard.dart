import 'package:flutter/material.dart';

class RoomCard extends StatefulWidget {
  const RoomCard(
      {super.key,
      required this.theme,
      required this.darkTheme,
      required this.name,
      required this.disciption});

  final ThemeData theme;
  final ThemeData darkTheme;
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
        data: _isEnabled ? widget.theme : widget.darkTheme,
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

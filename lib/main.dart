import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'roomCard.dart';

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
    ThemeData theme = _buildTheme(Brightness.light);
    ThemeData darkTheme = _buildTheme(Brightness.dark);

    return MaterialApp(
      title: 'SmartCtrler',
      theme: theme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SmartCtrler'),
          centerTitle: true,
        ),
        body: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ListView(
                children: [
                  RoomCard(
                    theme: theme,
                    darkTheme: darkTheme,
                    name: 'リビング 1',
                    disciption: "リビング キッチン側のライト",
                  ),
                  RoomCard(
                    theme: theme,
                    darkTheme: darkTheme,
                    name: 'リビング 2',
                    disciption: "リビング ベランダ側のライト",
                  ),
                  RoomCard(
                    theme: theme,
                    darkTheme: darkTheme,
                    name: '部屋',
                    disciption: '部屋のライト',
                  ),
                  RoomCard(
                    theme: theme,
                    darkTheme: darkTheme,
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

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TerminalBox extends StatefulWidget {
  const TerminalBox({super.key});

  @override
  State<TerminalBox> createState() => _TerminalBoxState();
}

class _TerminalBoxState extends State<TerminalBox> {
  final List<Widget> _lines = [];
  int _currentLine = 0;

  final List<Map<String, dynamic>> _texts = [
    {
      "text": "\$ echo \"Gaurav\"",
      "color": Colors.greenAccent,
      "fontSize": 16,
    },
    {
      "text":
          "Senior Software Developer crafting ideas\ninto reliable, production-ready applications.",
      "color": Colors.yellowAccent,
      "fontSize": 14,
    },
    {
      "text":
          "\n[+] From the first API call to deployment,\nI build scalable solutions and deliver\nquality from development to release.",
      "color": Colors.redAccent,
      "fontSize": 14,
    },
    {
      "text": "\$ _",
      "color": Colors.white,
      "fontSize": 16,
    },
  ];

  void _showNextLine() {
    if (_currentLine >= _texts.length) return;

    final line = _texts[_currentLine];

    setState(() {
      _lines.add(
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(
              line['text'],
              textStyle: TextStyle(
                color: line['color'],
                fontSize: line['fontSize'],
                fontFamily: "monospace",
              ),
              speed: const Duration(milliseconds: 50),
            ),
          ],
          onFinished: () {
            _currentLine++;
            _showNextLine(); // Show next line
          },
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showNextLine());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _lines,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonCalculator extends StatefulWidget {
  final String label;
  final Function funcaoBotao;

  const ButtonCalculator({super.key, required this.label, required this.funcaoBotao});

  @override
  State<ButtonCalculator> createState() => _ButtonCalculatorState();
}

class _ButtonCalculatorState extends State<ButtonCalculator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 100,
      child: ElevatedButton(
        onPressed: () {
          widget.funcaoBotao();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          backgroundColor: Colors.blue,
          foregroundColor: const Color.fromARGB(255, 1, 84, 153),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30)
          )
        ),
        child: Text(widget.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:calculadora/components/button_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  String numero = '0';
  String s = '0';
  bool somar = false;

  void calcular(String tecla){

    switch(tecla){
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
      setState(() {
        numero += tecla;

        numero = numero.replaceAll(',', '.');

        if(numero.contains('.')) {
          //double numeroDouble = double.parse(numero);
          //numero = numeroDouble.toString();
        }
        else{
          int numeroInt = int.parse(numero);
          numero = numeroInt.toString();
        }
        numero = numero.replaceAll('.', ',');

      });
      break;
      case 'AC': setState(() {
        numero = '0';
        s = '';
      });
      break;

      case 'back': setState(() {
        List<String> lista = numero.split('');
        lista.removeLast();
        if (lista.length == 0){
          numero = '0';
        }
        else{
          numero = lista.join('');
        }
      });

      case '+': setState(() {
        somar = true;
        s = numero;
        numero = '';
        print('somar é true');
      });
      break;

      case '=': setState(() {
        if (somar == true) {
          if (s.contains(',') == true || numero.contains(',')){
            somar = false;
            numero = numero.replaceAll(',', '.');
            s = s.replaceAll(',', '.');
            double numeroDouble = double.parse(numero);
            double sDouble = double.parse(s);
            numeroDouble = sDouble + numeroDouble;
            numero = numeroDouble.toString();
            numero = numero.replaceAll('.', ',');
            s = '';
            print('somado, valor = ${numero}');
          }
          else{
            int numeroInt = int.parse(numero);
            int sInt = int.parse(s);
            numeroInt = sInt + numeroInt;
            numero = numeroInt.toString();
            s = '';
            print('somado, valor = ${numero}');
          }
        }
        else{
          calcular('AC');
        }
      });
      break;

      default:
      numero += tecla;
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Calculadora',
              style: TextStyle(color: Colors.blueGrey, fontSize: 30),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // where it shows the numbers
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  s,
                  style: TextStyle(fontSize: 20),
                  )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: TextStyle(fontSize: 72),
                  )
              ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCalculator(label: 'AC', funcaoBotao: () {
                  calcular('AC');
                },),
                Text(''),
                Text(''),
                ButtonCalculator(label: 'back', funcaoBotao: () {
                  calcular('back');
                },),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCalculator(label: '7', funcaoBotao: () {
                  calcular('7');
                },),
                ButtonCalculator(label: '8', funcaoBotao: () {
                  calcular('8');
                },),
                ButtonCalculator(label: '9', funcaoBotao: () {
                  calcular('9');
                },),
                ButtonCalculator(label: '/', funcaoBotao: () {
                  calcular('/');
                },)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCalculator(label: '4', funcaoBotao: () {
                  calcular('4');
                },),
                ButtonCalculator(label: '5', funcaoBotao: () {
                  calcular('5');
                },),
                ButtonCalculator(label: '6', funcaoBotao: () {
                  calcular('6');
                },),
                ButtonCalculator(label: 'X', funcaoBotao: () {
                  calcular('X');
                },)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCalculator(label: '1', funcaoBotao: () {
                  calcular('1');
                },),
                ButtonCalculator(label: '2', funcaoBotao: () {
                  calcular('2');
                },),
                ButtonCalculator(label: '3', funcaoBotao: () {
                  calcular('3');
                },),
                ButtonCalculator(label: '-', funcaoBotao: () {
                  calcular('-');
                },)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonCalculator(label: '0', funcaoBotao: () {
                  calcular('0');
                },),
                ButtonCalculator(label: ',', funcaoBotao: () {
                  calcular(',');
                },),
                ButtonCalculator(label: '=', funcaoBotao: () {
                  calcular('=');
                },),
                ButtonCalculator(label: '+', funcaoBotao: () {
                  calcular('+');
                },)
              ],
            ),
            Text('Coluna6')
          ],
        ),
      ),
    );
  }
}

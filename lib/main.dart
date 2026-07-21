import 'dart:ffi';

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
                GestureDetector(
                  onTap: (){
                    calcular('AC');
                    print('AC');
                  },
                  child: Text(
                    'AC',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                Text(''),
                Text(''),
                GestureDetector(
                  onTap: () => calcular('back'),
                  child: Text(
                    'back',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () { 
                    print('Clicou 7');
                    calcular('7'); 
                    },
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: (){
                    calcular('8');
                  },
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: (){
                    calcular('9');
                  },
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () => calcular('/'),
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 48),
                    ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('4');
                  },
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: (){
                    calcular('5');
                  },
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('6');
                  },
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () => calcular('X'),
                  child: Text(
                    'X',
                    style: TextStyle(fontSize: 48),
                    ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('1');
                  },
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('2');
                  },
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('3');
                  },
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () => calcular('-'),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 48),
                    ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('0');
                  },
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () => calcular(','),
                  child: Text(
                    ',',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () => calcular('='),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 48),
                    ),
                ),
                GestureDetector(
                  onTap: () => calcular('+'),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 48),
                    ),
                )
              ],
            ),
            Text('Coluna6')
          ],
        ),
      ),
    );
  }
}

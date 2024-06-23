import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const double fontSize = 30.0;


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int contador = 0;//aqui es una propiedad

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  void decrementar() {
    setState(() {
      contador--;
    });
  }

  void reset() {
    setState(() {
      contador=0;
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Home', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Numero de click',
                  style: TextStyle(fontSize: HomeScreen.fontSize)),
              Text('$contador',
                  style: const TextStyle(fontSize: HomeScreen.fontSize)),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:  Buttons(
          incrementarFn: incrementar,
          decrementarFn: decrementar,
          resetFn: reset,
        ));
  }
}

class Buttons extends StatelessWidget {
  final Function incrementarFn;
  final Function decrementarFn;
  final Function resetFn;
  const Buttons({
    super.key, required this.incrementarFn, required this.decrementarFn, required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () {
            decrementarFn();
          },
          backgroundColor: Colors.red[300],
          child: const Icon(Icons.exposure_minus_1, color: Colors.white),
        ),
        FloatingActionButton(
          onPressed: () {
            resetFn();
          },
          backgroundColor: Colors.red[300],
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
        FloatingActionButton(
          onPressed: () {
             incrementarFn(); 
          },
          backgroundColor: Colors.red[300],
          child: const Icon(Icons.plus_one, color: Colors.white),
        )
        
      ],
    );
  }
}

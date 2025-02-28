import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  ///Primer RECTANGULO AZUL gradiante///
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 2, 
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 0.2, 0.4, 0.9],
                    colors: [
                      Color.fromARGB(255, 130, 229, 152),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),

            // Círculo blanco dentro del primer rectángulo azul
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 129, 129),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      stops: [0.0, 0.2, 0.4, 0.9],
                      colors: [
                        Color.fromARGB(255, 32, 128, 255),
                        Color.fromARGB(255, 24, 63, 189),
                        Color.fromARGB(255, 22, 52, 151),
                        Color.fromARGB(255, 38, 20, 126),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              top: 15,
              left: 10,
              child: Column(
                children: [
                  Text(
                    "Buenos días",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ///SEGUNDO RECTANGULO AZUL FUERTE///
            Positioned(
              top: 160,
              left: 37,
              child: Container(
                height: 230,
                width: 370,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 35, 105),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 143, 173, 238),
                      blurRadius: 2.0,
                      offset: Offset(0,10)
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 11, 27, 78),
                      offset: Offset(-3, 0)
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 8, 19, 54),
                      offset: Offset(3, 0)
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

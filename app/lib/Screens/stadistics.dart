import 'package:flutter/material.dart';

class Stadistics extends StatefulWidget {
  const Stadistics({Key? key}) : super(key: key);

  @override
  State<Stadistics> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Stadistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('Estadisticas',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                  ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ...List.generate(4, (index) {
                        return Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 32, 128, 255),
                    ),
                    alignment: Alignment.center,
                    child: Text('Dia', style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                   
                  );
                          
                        })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
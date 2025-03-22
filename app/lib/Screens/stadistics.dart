import 'package:app/widget/chart.dart';
import 'package:flutter/material.dart';
import 'package:app/data/listdata.dart';

class Stadistics extends StatefulWidget {
  const Stadistics({super.key});

  @override
  State<Stadistics> createState() => _StadisticsState();
}

class _StadisticsState extends State<Stadistics> {
  List<String> day = ['Día', 'Semana', 'Mes', 'Año'];
  // ignore: non_constant_identifier_names
  int index_color = 0;

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
                  Text(
                    'Estadísticas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                index_color = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index_color == index
                                    ? Color.fromARGB(255, 32, 128, 255)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                style: TextStyle(
                                  color: index_color == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Gastos',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Chart(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Lo mas gastado', style: TextStyle(
                        color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)
                              ,),
                              Icon(Icons.swap_vert, size: 25, color: Colors.grey,
                              )
                              ],
                    ),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
              return ListTile(
                leading: Image.asset('assets/${geter()[index].image ?? ''}',
                height: 40,), // Asegúrate de manejar los null
                title: Text(
                  geter()[index].time!,
                   style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                   ),
                   ),
                   subtitle: Text(
                  geter()[index].name!,
                   style: TextStyle(
                    fontWeight: FontWeight.w600,
                   ),
                   ), 
                   trailing: Text(
                  geter()[index].fee!,
                   style: TextStyle(
                    fontSize: 19,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                   ),
                   ),
              );
            },
            childCount: geter().length,
            ))
          ],
        ),
      ),
    );
  }
}

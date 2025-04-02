import 'package:app/data/add_date.dart';
import 'package:app/data/listdata.dart';
import 'package:app/data/utility.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
   class _HomePageState extends State<HomePage> {
  var history;
  final box = Hive.box<Add_data> ('data');
  final List<String> day = [
    'Lunes',
    "Martes",
    "Miercoles",
    "Jueves",
    'Viernes',
    'Sabado',
    'Domingo'
  ];
  
 Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<Add_data> box, _) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 350, child: _head()),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Historial de transacciones',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Ver todo',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 16, 36, 216),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= box.length) return SizedBox(); // Previene errores
                      final history = box.getAt(index);
                      return getList(history!, index);
                    },
                    childCount: box.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
   Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5), 
        child: Image.asset('assets/${history.name}.png', height: 40),
            ),
            title: Text(
              history.name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
            ),
            subtitle:Text(
             '${day[history.datetime.weekday - 1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ) ,
            trailing: Text(
              history.amount, 
              style:  TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: history.IN == 'Ingreso' ? Colors.green:Colors.red,
            )
            ),
            );
  }
  Widget _head(){
    return Stack(
          children: [
            Column(
              children: [
                /// Fondo Azul///
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
                  child: Stack(
                    children: [
                      // Notificación dentro del primer widget
                      Positioned(
                        top: 10, 
                        right: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Color.fromRGBO(21, 129, 252, 0.443),
                            child: Icon(
                              Icons.notification_add_outlined,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ///TEXTO DE BIENVENIDA///  
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Buenos días",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Luis Illescas",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /// TARJETA AZUL
            Positioned(
              top: 130,
              left: 50,
              child: Container(
                height: 210,
                width: 350,
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 143, 173, 238),
                      blurRadius: 2.0,
                      offset: Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 11, 27, 78),
                      offset: Offset(-3, 0),
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 8, 19, 54),
                      offset: Offset(3, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Balance total',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white
                            ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 7,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text(
                             '\$ ${total()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Color.fromRGBO(102, 145, 194, 1),
                                child: Icon(
                                  Icons.arrow_downward, color: 
                                  Colors.white,
                                  size: 19,), 
                              ),
                              SizedBox(width: 7),
                              Text(
                                'Ingresos',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255,216,216,216),
                                ),
                                )
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Color.fromRGBO(102, 145, 194, 1),
                                child: Icon(
                                  Icons.arrow_upward, color: 
                                  Colors.white,
                                  size: 18,), 
                              ),
                              SizedBox(width: 7),
                              Text(
                                'Gastos',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255,216,216,216),
                                ),
                                )
                            ],
                          ),
                        ],
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                               '\$ ${income()}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                             '\$ ${expenses()}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        );

  }
  
}

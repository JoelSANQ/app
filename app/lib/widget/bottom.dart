import 'package:app/Screens/add.dart';
import 'package:app/Screens/home_page.dart';
import 'package:app/Screens/stadistics.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
 int index_color = 0;
 List Screens = [HomePage(), Stadistics(),HomePage(), Stadistics()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index_color],
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Add()));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color= 0;
                    });
                  },
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: index_color ==  0 ? const Color.fromARGB(255, 64, 102, 255): Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color= 1;
                    });
                  },
                  child: Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                    color: index_color ==  1 ? const Color.fromARGB(255, 64, 102, 255): Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color= 2;
                    });
                  },
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 30,
                    color: index_color ==  2 ? const Color.fromARGB(255, 64, 102, 255): Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color= 3;
                    });
                  },
                  child: Icon(
                    Icons.person_outlined,
                    size: 30,
                    color: index_color ==  3? const Color.fromARGB(255, 64, 102, 255): Colors.black,
                  ),
                ),
              
              ],
            ),
          ),
        ),
        
    );
  }
}
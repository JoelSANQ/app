import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String? selectedItem;  
  final TextEditingController expalin_C = TextEditingController();
  final List<String> _item = [
    'food',
    'transfer',
    'Enterteinment',
    'Education',
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: Main_Container(),
            ),
          ],
        ),
      ),
    );
  }

  Container Main_Container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 50),
          name(),
          SizedBox(height: 50),
          TextField(
            controller: expalin_C,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                minHeight: 40,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), labelText: 'Motivo',
              labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 20) )
            ),
          )
        ],
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xffc5c5c5),
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: (value) {
            setState(() {
              selectedItem = value!;
            });
          },
          items: _item
              .map((e) => DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset('assets/${e}.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(e, style: TextStyle(fontSize: 18),)
                        ],
                      ),
                    ), 
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (context) {
            return _item.map((e) => Row(
              children: [
                Container(
                  width: 42,
                  child: Image.asset('assets/${e}.png'),
                ), 
                SizedBox(width: 10),
                Text(
                  e,
                  style: TextStyle(fontSize: 18),
                )
              ],
            )).toList(); 
          },
          hint: Text(
            'Name' ,
            style: TextStyle(color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
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
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      'Añadir',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
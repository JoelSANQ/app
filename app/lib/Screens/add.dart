import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String? selctedItem;
  final List<String> _item = [
    'Food',
    'Transfer',
    'Transportation',
    'Education'
  ]; // ← Punto y coma corregido aquí

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: const Color(0xffc5c5c5),
                ),
              ),
              child: DropdownButton<String>(
                items: _item
                    .map((e) => DropdownMenuItem(
                          child: Container(), 
                          value: e,
                        ))
                    .toList(), 
                    hint: Text(
                      'Name' ,
                      style: TextStyle(color: Colors.grey),
                      ),
                   
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
                onChanged: (value) {
                  setState(() {
                    selctedItem = value!;
                  });
                },
              ),
            ),
          ),
        ],
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

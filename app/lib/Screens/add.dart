import 'package:app/data/add_date.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final box = Hive.box<Add_data> ('data');
  DateTime date = DateTime.now();
  String? selectedItem;  
  String? selectedItemi;  
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  
  final List<String> _item = [
    'food',
    'transfer',
    'Entertainment',
    'Education',
  ]; 

  final List<String> _itemei = [
    'Ingreso',
    "Gasto",
  ]; 
  
  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }
  
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
      ),
      height: 650,  // Increase the height to fit the Date Picker
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 50),
          name(),
          SizedBox(height: 50),
          explain(),
          SizedBox(height: 30),
          amount(),
          SizedBox(height: 30),
          income_expense(),
          SizedBox(height: 30),
          date_picker(),
          Spacer(),
          save(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
          onTap: () {
           var add = Add_data(
            selectedItemi!, amount_c.text, date, expalin_C.text, selectedItem!);
            box.add(add);
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 0, 0, 0)
            ),
            width: 120,
            height: 50,
            child: Text("Guardar"
            , style: TextStyle(
              fontFamily: 'f',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 17,
            ),),
          ),
        );
  }

  Padding amount() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      keyboardType: TextInputType.number,
      focusNode: amount_,
      controller: amount_c,
      style: TextStyle(
        color: Colors.white,  // Mantener el texto siempre blanco
      ),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          minHeight: 40,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        labelText: 'Monto',
        labelStyle: TextStyle(fontSize: 17, color: const Color.fromARGB(255, 255, 255, 255)),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 5, color: Colors.grey.shade500),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: Colors.grey.shade500),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: Colors.grey.shade500),
        ),
      ),
    ),
  );
}
  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        style: TextStyle(
        color: Colors.white,  // Mantener el texto siempre blanco
      ),
        decoration: InputDecoration(
          constraints: BoxConstraints(
            minHeight: 40,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), labelText: 'Motivo',
          labelStyle: TextStyle(fontSize: 17, color: const Color.fromARGB(255, 243, 243, 243)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 5, color: Colors.grey.shade500) ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade500)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.grey.shade500)),
        ),
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
                          Text(e, style: TextStyle(fontSize: 18,),)
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
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            )).toList(); 
          },
          hint: Text(
            'Categoria' ,
            style: TextStyle(color: const Color.fromARGB(255, 243, 243, 243)),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  // This is the new dropdown for Income/Expense
  Padding income_expense() {
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
          value: selectedItemi,
          onChanged: (value) {
            setState(() {
              selectedItemi = value!;
            });
          },
          items: _itemei
              .map((e) => DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(e, style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),)
                        ],
                      ),
                    ), 
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (context) {
            return _itemei.map((e) => Row(
              children: [
                SizedBox(width: 10),
                Text(
                  e,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            )).toList(); 
          },
          hint: Text(
            'Ingreso / Gasto' ,
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  // This is the new date picker
  Padding date_picker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (picked != null && picked != date) {
            setState(() {
              date = picked;
            });
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: const Color(0xffc5c5c5),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today),
              SizedBox(width: 10),
              Text(
                "${date.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
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

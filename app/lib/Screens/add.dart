import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String? selectedItem;  
  final TextEditingController explainC = TextEditingController();
  final TextEditingController amountC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  FocusNode ex = FocusNode();

  final List<String> _item = [
    'food',
    'transfer',
    'Entertainment',
    'Education',
  ]; 

  @override
  void initState() {
    super.initState();
    ex.addListener(() {
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
            backgroundContainer(context),
            Positioned(
              top: 120,
              child: mainContainer(),
            ),
          ],
        ),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 650, 
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 50),
          name(),
          const SizedBox(height: 20),
          amount(),
          const SizedBox(height: 20),
          motive(),
          const SizedBox(height: 20),
          datePicker(),
          const SizedBox(height: 30),
          saveButton(),
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
          items: _item.map((e) => DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                SizedBox(width: 40, child: Image.asset('assets/${e}.png')),
                const SizedBox(width: 10),
                Text(e, style: TextStyle(fontSize: 18))
              ],
            ),
          )).toList(),
          selectedItemBuilder: (context) {
            return _item.map((e) => Row(
              children: [
                SizedBox(width: 42, child: Image.asset('assets/$e.png')),
                const SizedBox(width: 10),
                Text(e, style: TextStyle(fontSize: 18))
              ],
            )).toList(); 
          },
          hint: Text('Name', style: TextStyle(color: Colors.grey)),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: amountC,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Monto',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983)),
            ),
          ),
        ),
      ),
    );
  }

  Padding motive() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          focusNode: ex,
          controller: explainC,
          decoration: InputDecoration(
            labelText: 'Motivo',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983)),
            ),
          ),
        ),
      ),
    );
  }

  Padding datePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: dateC,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Fecha',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.grey.shade600),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983)),
            ),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              setState(() {
                dateC.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              });
            }
          },
        ),
      ),
    );
  }

  ElevatedButton saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff368983),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      onPressed: () {
        print("Categoría: $selectedItem");
        print("Monto: ${amountC.text}");
        print("Motivo: ${explainC.text}");
        print("Fecha: ${dateC.text}");
      },
      child: const Text(
        'Guardar',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.blueAccent],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}

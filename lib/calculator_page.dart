import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController angka1 = TextEditingController();
  TextEditingController angka2 = TextEditingController();

  double hasilSetState = 0;
  bool useProvider = false;

  void hitungSetState(String op) {
    double a = double.tryParse(angka1.text) ?? 0;
    double b = double.tryParse(angka2.text) ?? 0;

    setState(() {
      if (op == "+") hasilSetState = a + b;
      if (op == "-") hasilSetState = a - b;
      if (op == "x") hasilSetState = a * b;
      if (op == "/") hasilSetState = b == 0 ? 0 : a / b;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalculatorProvider>();

    return Scaffold(
      backgroundColor: Color(0xfff5f0ff),

      // AppBar lebih keren
      appBar: AppBar(
        title: Text(
          "Kalkulator Sederhana",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 450,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mode
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mode: ${useProvider ? "Provider" : "setState"}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Switch(
                      value: useProvider,
                      onChanged: (v) => setState(() {
                        useProvider = v;
                      }),
                      activeColor: Colors.deepPurple,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Angka 1
                TextField(
                  controller: angka1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Angka Pertama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Angka 2
                TextField(
                  controller: angka2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Angka Kedua",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Tombol
                Wrap(
                  spacing: 12,
                  children: [
                    _button("+", provider),
                    _button("-", provider),
                    _button("x", provider),
                    _button("/", provider),
                  ],
                ),

                SizedBox(height: 30),

                // Hasil
                Text(
                  "Hasil: ${useProvider ? provider.result : hasilSetState}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _button(String op, CalculatorProvider provider) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple.shade100,
        foregroundColor: Colors.deepPurple.shade800,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: () {
        if (useProvider) {
          provider.calculate(
            op,
            double.tryParse(angka1.text) ?? 0,
            double.tryParse(angka2.text) ?? 0,
          );
        } else {
          hitungSetState(op);
        }
      },
      child: Text(op, style: TextStyle(fontSize: 22)),
    );
  }
}

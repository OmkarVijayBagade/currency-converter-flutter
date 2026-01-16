import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _controller = TextEditingController();

  double result = 0;

  void convert() {
    final input = double.tryParse(_controller.text);

    if (input == null) {
      debugPrint("Invalid input");
      return;
    }

    setState(() {
      result = input * 83; // USD → INR
    });

    debugPrint("USD: $input → INR: $result");
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        color: Colors.amber,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          toolbarHeight: 65,
          centerTitle: true,
          title: const Text(
            'Currency Converter',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// INR + Result (SIDE BY SIDE)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'INR ',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.amber[200],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    result.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(244, 255, 214, 100),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// INPUT FIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.amber,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter USD amount',
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.amber,
                    ),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),

              const SizedBox(height: 10),

              /// CONVERT BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: convert,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Convert',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
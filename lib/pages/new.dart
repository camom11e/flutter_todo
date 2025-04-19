import 'package:flutter/material.dart';

class NewToDoPage extends StatelessWidget {
  const NewToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Новые",
          style: TextStyle(
            color: const Color.fromARGB(255, 2, 69, 124),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 167, 99, 99),
        centerTitle: true,
      ),
    );
  }
}

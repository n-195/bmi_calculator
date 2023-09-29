import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //Last 6 digits/alphabets describe the RGB components and FF describes the opacity. 0x need to put
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0D22),
        ),

        scaffoldBackgroundColor: const Color(0xFF0A0D22),

        // Below snippet to change the floatingActionButtonColor
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   backgroundColor: Color(0xFFEB1555),
        // ),

        // By default, text is white in dark theme.
        // textTheme: const TextTheme(
        //   bodyMedium: TextStyle(color: Colors.white),
        // ),
      ),
      home: const InputPage(),
    );
  }
}

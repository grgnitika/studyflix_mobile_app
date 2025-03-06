// import 'package:flutter/material.dart';
// import 'package:studyflix/app/constants/theme_constant.dart';

// class AppTheme {
//   AppTheme._();

//   static getApplicationTheme({required bool isDarkMode}) {
//     return ThemeData(
//       // change the theme according to the user preference
//       colorScheme: isDarkMode
//           ? const ColorScheme.dark(
//               primary: ThemeConstant.darkPrimaryColor,
//             )
//           : const ColorScheme.light(
//               primary: Color.fromARGB(255, 17, 119, 20),
//             ),
//       brightness: isDarkMode ? Brightness.dark : Brightness.light,
//       fontFamily: 'Montserrat',
//       useMaterial3: true,

//       // Change app bar color
//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         backgroundColor: ThemeConstant.appBarColor,
//         centerTitle: true,
//         titleTextStyle: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//         ),
//       ),

//       // Change elevated button theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           elevation: 0,
//           foregroundColor: Colors.white,
//           backgroundColor: ThemeConstant.primaryColor,
//           textStyle: const TextStyle(
//             fontSize: 20,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),

//       // Change text field theme
//       inputDecorationTheme: const InputDecorationTheme(
//         contentPadding: EdgeInsets.all(15),
//         border: OutlineInputBorder(),
//         labelStyle: TextStyle(
//           fontSize: 20,
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: ThemeConstant.primaryColor,
//           ),
//         ),
//       ),
//       // Circular progress bar theme
//       progressIndicatorTheme: const ProgressIndicatorThemeData(
//         color: ThemeConstant.primaryColor,
//       ),
//       //Bottom navigation bar theme
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.lightGreen,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.black,
//         type: BottomNavigationBarType.fixed,
//         elevation: 0,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.white;

class AppTheme {
  AppTheme._();

  static ThemeData getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.grey[200],
      fontFamily: 'Montserrat Regular',

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: primaryColor,
        elevation: 4,
        shadowColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),

      // TextField Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor, width: 2.0),
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
        labelStyle: TextStyle(
          color: isDarkMode ? Colors.white : primaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: secondaryColor,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(primaryColor),
        fillColor: WidgetStateProperty.all(
          isDarkMode ? Colors.black : Colors.white,
        ),
        side: WidgetStateBorderSide.resolveWith((states) {
          return const BorderSide(
            color: primaryColor,
            width: 2,
          );
        }),
      ),
    );
  }
}

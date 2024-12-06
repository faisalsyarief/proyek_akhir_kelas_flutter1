import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_akhir_kelas_flutter1/services/theme_data.dart';
import 'package:proyek_akhir_kelas_flutter1/services/theme_provider.dart';
import 'view/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      title: 'Banking App',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'Banking App'),
    );
  }
}

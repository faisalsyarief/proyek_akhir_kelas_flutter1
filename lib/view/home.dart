import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek_akhir_kelas_flutter1/services/theme_provider.dart';

import '../controller/payment_purchase.dart';
import '../controller/view_balance.dart';
import '../controller/wallet.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          style: const TextStyle(
            fontFamily: 'Quintessential',
          ),
          title,
        ),
        actions: [
          Switch(
            value: themeProvider.currentTheme == ThemeMode.dark,
            onChanged: (isDarkMode) {
              themeProvider.toggleTheme();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              children: _generateIcons(context),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(8),
              children: _generateIcons(context),
            );
          } else {
            return GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(8),
              children: _generateIcons(context),
            );
          }
        },
      ),
    );
  }

  List<Widget> _generateIcons(BuildContext context) {
    final icons = [
      Icons.account_balance,
      Icons.transfer_within_a_station,
      Icons.account_balance_wallet,
      Icons.payment,
    ];

    final menuName = [
      'View Balance',
      'Transfer Money',
      'Wallet',
      'Payments',
    ];

    return List.generate(icons.length, (index) {
      return GestureDetector(
        onTap: () {
          if (menuName[index] == 'View Balance') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ViewBalance(title: title, subTitle: menuName[index]),
              ),
            );
          } else if (menuName[index] == 'Wallet') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Wallet(title: title, subTitle: menuName[index]),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PaymentPurchase(title: title, subTitle: menuName[index]),
              ),
            );
          }
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.teal
                  : Colors.blue,
              width: 1,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[index],
                  size: 50,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.teal
                      : Colors.blue,
                ),
                const SizedBox(height: 8),
                Text(
                  menuName[index],
                  style: const TextStyle(
                      fontFamily: 'Quintessential', fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

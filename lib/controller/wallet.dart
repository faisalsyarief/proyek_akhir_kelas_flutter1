import 'package:flutter/material.dart';
import 'package:proyek_akhir_kelas_flutter1/model/wallet.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Quintessential',
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 200) {
            return ListView(
              children: _generateWalletIcons(context),
            );
          } else if (constraints.maxWidth < 400) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: _generateWalletIcons(context),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(8),
              children: _generateWalletIcons(context),
            );
          } else {
            return GridView.count(
              crossAxisCount: 5,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              padding: const EdgeInsets.all(8),
              children: _generateWalletIcons(context),
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.teal
                : Colors.blue,
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }

  List<Widget> _generateWalletIcons(BuildContext context) {
    return List.generate(walletData.length, (index) {
      final feature = walletData[index];
      return GestureDetector(
        onTap: () {
          _showFeatureDetails(
            context,
            feature.label,
            feature.status,
            feature.desc,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              child: Icon(
                feature.icon,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.teal
                    : Colors.blue,
                size: 28,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              feature.label,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Oxygen',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }

  void _showFeatureDetails(
      BuildContext context, String label, String status, String desc) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.teal
                    : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 4.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '$label ($status)',
                    style: const TextStyle(
                      fontFamily: 'Oxygen',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Oxygen'),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewBalance extends StatefulWidget {
  const ViewBalance({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  State<ViewBalance> createState() => _ViewBalanceState();
}

class _ViewBalanceState extends State<ViewBalance> {
  late String _formattedTime;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    widget.subTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.teal
                                    : Colors.black,
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '987654',
                            style: TextStyle(fontFamily: 'Oxygen'),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.teal
                                    : Colors.black,
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Rp123.456.789',
                            style: TextStyle(fontFamily: 'Oxygen'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Assalamualaikum, Faisal Syarifuddin!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Oxygen', fontSize: 16.0),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.teal
                          : Colors.black,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _formattedTime,
                      style: const TextStyle(fontFamily: 'Oxygen'),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.teal
                            : Colors.blue,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _formattedTime = _getCurrentTime();
    _updateTimeEverySecond();
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm:ss').format(now);
  }

  void _updateTimeEverySecond() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _formattedTime = _getCurrentTime();
      });
      _updateTimeEverySecond();
    });
  }
}

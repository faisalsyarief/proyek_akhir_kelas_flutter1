import 'package:flutter/material.dart';

class PaymentPurchase extends StatefulWidget {
  const PaymentPurchase(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  State<PaymentPurchase> createState() => _PaymentPurchaseState();
}

class _PaymentPurchaseState extends State<PaymentPurchase> {
  final TextEditingController _debitAccountController = TextEditingController();
  final TextEditingController _destinationBankController =
      TextEditingController();
  final TextEditingController _destinationAccountNumberController =
      TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _statusMessage = '';

  @override
  Widget build(BuildContext context) {
    String label2;
    String label3;

    if (widget.subTitle == 'Transfer Money') {
      label2 = 'Destination Bank';
      label3 = 'Destination Account Number';
    } else {
      label2 = 'Payment Category';
      label3 = 'ID / Payment Code';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Quintessential',
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         Text(
      //           widget.subTitle,
      //           style: const TextStyle(
      //               fontFamily: 'Staatliches',
      //               fontSize: 24,
      //               fontWeight: FontWeight.bold),
      //           textAlign: TextAlign.center,
      //         ),
      //         const SizedBox(height: 20),
      //         TextField(
      //           controller: _debitAccountController,
      //           style: const TextStyle(fontFamily: 'Oxygen'),
      //           keyboardType: TextInputType.number,
      //           decoration: const InputDecoration(
      //             border: OutlineInputBorder(),
      //             labelText: 'Debit Account',
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         TextField(
      //           controller: _destinationBankController,
      //           style: const TextStyle(fontFamily: 'Oxygen'),
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             border: const OutlineInputBorder(),
      //             labelText: label2,
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         TextField(
      //           controller: _destinationAccountNumberController,
      //           style: const TextStyle(fontFamily: 'Oxygen'),
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             border: const OutlineInputBorder(),
      //             labelText: label3,
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         TextField(
      //           controller: _nominalController,
      //           style: const TextStyle(fontFamily: 'Oxygen'),
      //           keyboardType: TextInputType.number,
      //           decoration: const InputDecoration(
      //             border: OutlineInputBorder(),
      //             labelText: 'Nominal',
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         TextField(
      //           controller: _descriptionController,
      //           style: const TextStyle(fontFamily: 'Oxygen'),
      //           keyboardType: TextInputType.number,
      //           decoration: const InputDecoration(
      //             border: OutlineInputBorder(),
      //             labelText: 'Description',
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             foregroundColor:
      //                 Theme.of(context).brightness == Brightness.dark
      //                     ? Colors.white
      //                     : Colors.black,
      //             backgroundColor:
      //                 Theme.of(context).brightness == Brightness.dark
      //                     ? Colors.teal
      //                     : Colors.blue,
      //             textStyle: const TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //             ),
      //             padding:
      //                 const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               if (widget.subTitle == 'Transfer Money') {
      //                 _statusMessage = 'Transfer Successful!\n\n'
      //                     'From Account: ${_debitAccountController.text}\n'
      //                     'To Account: ${_destinationAccountNumberController.text} (${_destinationBankController.text})\n'
      //                     'Amount: ${_nominalController.text}\n\n'
      //                     'Note: ${_descriptionController.text}';
      //               } else {
      //                 _statusMessage = 'Payment Successful!\n\n'
      //                     'From Account: ${_debitAccountController.text}\n'
      //                     'To Payment Code (Category): ${_destinationAccountNumberController.text} (${_destinationBankController.text})\n'
      //                     'Amount: ${_nominalController.text}\n\n'
      //                     'Note: ${_descriptionController.text}';
      //               }
      //               _debitAccountController.clear();
      //               _destinationAccountNumberController.clear();
      //               _destinationBankController.clear();
      //               _nominalController.clear();
      //               _descriptionController.clear();
      //             });
      //           },
      //           child: const Text('Submit'),
      //         ),
      //         const SizedBox(height: 20),
      //         Text(
      //           _statusMessage,
      //           style: TextStyle(
      //             fontSize: 16,
      //             fontFamily: 'Oxygen',
      //             color: Theme.of(context).brightness == Brightness.dark
      //                 ? Colors.white
      //                 : Colors.black,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //         const Spacer(),
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             foregroundColor:
      //                 Theme.of(context).brightness == Brightness.dark
      //                     ? Colors.white
      //                     : Colors.black,
      //             backgroundColor:
      //                 Theme.of(context).brightness == Brightness.dark
      //                     ? Colors.teal
      //                     : Colors.blue,
      //           ),
      //           onPressed: () => Navigator.pop(context),
      //           child: const Text('Back to Home'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double fontSize = 24;
                double inputFieldHeight = 50.0;

                if (constraints.maxWidth < 400) {
                  fontSize = 18;
                  inputFieldHeight = 45.0;
                } else if (constraints.maxWidth < 900) {
                  fontSize = 20;
                  inputFieldHeight = 50.0;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Judul dengan ukuran font dinamis
                    Text(
                      widget.subTitle,
                      style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    // Input fields yang responsif
                    _buildTextField(
                      _debitAccountController,
                      'Debit Account',
                      inputFieldHeight,
                    ),
                    _buildTextField(
                      _destinationBankController,
                      label2,
                      inputFieldHeight,
                    ),
                    _buildTextField(
                      _destinationAccountNumberController,
                      label3,
                      inputFieldHeight,
                    ),
                    _buildTextField(
                      _nominalController,
                      'Nominal',
                      inputFieldHeight,
                    ),
                    _buildTextField(
                      _descriptionController,
                      'Description',
                      inputFieldHeight,
                    ),

                    const SizedBox(height: 20),

                    // Tombol Submit
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
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (widget.subTitle == 'Transfer Money') {
                            _statusMessage = 'Transfer Successful!\n\n'
                                'From Account: ${_debitAccountController.text}\n'
                                'To Account: ${_destinationAccountNumberController.text} (${_destinationBankController.text})\n'
                                'Amount: ${_nominalController.text}\n\n'
                                'Note: ${_descriptionController.text}';
                          } else {
                            _statusMessage = 'Payment Successful!\n\n'
                                'From Account: ${_debitAccountController.text}\n'
                                'To Payment Code (Category): ${_destinationAccountNumberController.text} (${_destinationBankController.text})\n'
                                'Amount: ${_nominalController.text}\n\n'
                                'Note: ${_descriptionController.text}';
                          }
                          _debitAccountController.clear();
                          _destinationAccountNumberController.clear();
                          _destinationBankController.clear();
                          _nominalController.clear();
                          _descriptionController.clear();
                        });
                      },
                      child: const Text('Submit'),
                    ),

                    const SizedBox(height: 20),

                    // Status Message
                    Text(
                      _statusMessage,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Oxygen',
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    // Tombol Back to Home
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    double height,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontFamily: 'Oxygen'),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
      ),
    );
  }
}

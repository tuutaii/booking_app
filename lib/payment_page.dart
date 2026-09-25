import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your debit card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$5600',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text('4142'),
                        SizedBox(width: 8),
                        Text('...'),
                        SizedBox(width: 8),
                        Text('7322'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('NAME'),
                        SizedBox(width: 8),
                        Text('Finn McMissile'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Exp'),
                        SizedBox(width: 8),
                        Text('09/22'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Choose payment methods',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            RadioGroup<String>(
              groupValue: 'selectedPayment',
              onChanged: (value) {
                // Implement payment method selection logic
              },
              child: Column(
                children: [
                  RadioListTile(
                    value: 'MasterCard',
                    title: const Text('Visa'),
                    secondary: Image.asset('assets/images/master_card.png'),
                  ),
                  RadioListTile(
                    value: 'PayPal',
                    title: const Text('PayPal'),
                    secondary: Image.asset('assets/images/paypal.png'),
                  ),
                  RadioListTile(
                    value: 'Visa',
                    title: const Text('Visa'),
                    secondary: Image.asset('assets/images/visa.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement payment processing logic
                },
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

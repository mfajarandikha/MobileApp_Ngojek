import 'package:flutter/material.dart';

class PromosPage extends StatelessWidget {
  const PromosPage({super.key});

  static const Color customGreen = Color(0xFF01AD01);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top counts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard('Vouchers', '5'),
                _infoCard('Subscriptions', '2'),
              ],
            ),
            const SizedBox(height: 25),

            // Promo Code Input
            Text(
              'Enter Promo Code',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'e.g. DISCOUNT50',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customGreen,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Promo code submitted (dummy)!')),
                    );
                  },
                  child: const Text('Apply'),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // Promo banners
            Text(
              'Special Promos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _promoBanner('assets/images/gojekpromo1.jpg'),
            _promoBanner('assets/images/gojekpromo2.jpg'),
            _promoBanner('assets/images/gojekpromo3.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String count) {
    return Container(
      width: 165,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: customGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: customGreen),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 👈 Optional: center vertically
        children: [
          Text(
            count,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: customGreen),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _promoBanner(String assetPath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          height: 140,
          width: double.infinity,
        ),
      ),
    );
  }
}

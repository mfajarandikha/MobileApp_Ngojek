import 'dart:async';
import 'package:flutter/material.dart';
import 'maps.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<String> promoImages = [
    'assets/images/gojekpromo1.jpg',
    'assets/images/gojekpromo2.jpg',
    'assets/images/gojekpromo3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < promoImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Search...',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Promo Carousel (with aspect ratio to preserve image ratio)
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: promoImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        promoImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Balance Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Your Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Rp120.000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildBalanceAction(Icons.qr_code, 'Pay'),
                        _buildBalanceAction(Icons.add_circle, 'Top Up'),
                        _buildBalanceAction(Icons.account_balance_wallet, 'Balance'),
                        _buildBalanceAction(Icons.more_horiz, 'More'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // GoServices Section
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildServiceIcon(Icons.pedal_bike, 'GoRide', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapPage()),
                    );
                  }),
                  _buildServiceIcon(Icons.directions_car, 'GoCar'),
                  _buildServiceIcon(Icons.fastfood, 'GoFood'),
                  _buildServiceIcon(Icons.local_shipping, 'GoSend'),
                  _buildServiceIcon(Icons.store, 'GoMart'),
                  _buildServiceIcon(Icons.receipt, 'GoTagihan'),
                  _buildServiceIcon(Icons.train, 'GoTransit'),
                  _buildServiceIcon(Icons.more_horiz, 'More'),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceIcon(IconData iconData, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade100,
            radius: 20,
            child: Icon(iconData, size: 20, color: Colors.green),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  Widget _buildBalanceAction(IconData iconData, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          radius: 20,
          child: Icon(iconData, size: 20, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}

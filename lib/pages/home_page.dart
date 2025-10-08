import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Celana Jeans Pendek',
      price: 15000,
      imageUrl:
          'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=400',
      description: 'Celana jeans pendek',
      rating: 4.5,
      stock: 1,
      category: 'Fashion',
    ),
    Item(
      name: 'Jas kantor bukan jas hujan',
      price: 8000,
      imageUrl:
          'https://images.unsplash.com/photo-1598808503746-f34c53b9323e?w=400',
      description: 'Jas Kantor yang sering dipake pejabat',
      rating: 4.2,
      stock: 5,
      category: 'Fashion',
    ),
    Item(
      name: 'Perhiasan mahal ini bro',
      price: 25000,
      imageUrl:
          'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?w=400',
      description: 'Perhiasan mahal ini yg dipake pejabat',
      rating: 4.7,
      stock: 10,
      category: 'Aksesoris',
    ),
    Item(
      name: 'Skinker',
      price: 12000,
      imageUrl:
          'https://images.unsplash.com/photo-1571781926291-c477ebfd024b?w=400',
      description: 'Skinker biar glowing katanya',
      rating: 4.3,
      stock: 10,
      category: 'Kecantikan',
    ),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BelanjaApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade50,
        child: Column(
          children: [
            _buildBanner(),
            _buildCategoryTab(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ProductCard(item: item);
                  },
                ),
              ),
            ),

            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Discount!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Dapatkan diskon hingga 50% untuk\nproduk pilihan terbatas',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'BELI SEKARANG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab() {
    final categories = [
      'All',
      'Fashion',
      'Aksesoris',
      'Kecantikan',
      'Elektronik',
    ];

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: index == 0
                    ? Colors.blue.shade700
                    : Colors.white,
                foregroundColor: index == 0
                    ? Colors.white
                    : Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.blue.shade700),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: Text(categories[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Text(
            'Aplikasi Belanja - Tugas Pemrograman Mobile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Nama: Iga Ramadana Sahputra - NIM: 2341760083',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

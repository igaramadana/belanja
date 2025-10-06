import 'package:belanja/models/item.dart';
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
    ),
    Item(
      name: 'Jas kantor bukan jas hujan',
      price: 8000,
      imageUrl:
          'https://images.unsplash.com/photo-1598808503746-f34c53b9323e?w=400',
      description: 'Jas Kantor yang sering dipake pejabat',
      rating: 4.2,
    ),
    Item(
      name: 'Perhiasan mahal ini bro',
      price: 25000,
      imageUrl:
          'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?w=400',
      description: 'Perhiasan mahal ini yg dipake pejabat',
      rating: 4.7,
    ),
    Item(
      name: 'Skinker',
      price: 12000,
      imageUrl:
          'https://images.unsplash.com/photo-1571781926291-c477ebfd024b?w=400',
      description: 'Skinker biar glowing katanya',
      rating: 4.3,
    ),
    Item(
      name: 'Makanan jadi',
      price: 45000,
      imageUrl:
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
      description: 'Gatau ini makanan apa',
      rating: 4.8,
    ),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belanja',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey.shade50,
        child: Column(
          children: [
            // Header dengan banner
            Container(
              width: double.infinity,
              height: 120,
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
                          'Special Offer!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ini Cuma Testing buat Card Biar Lumayan Bagus',
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'JANGAN BELI DULU',
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
            ),

            // List produk
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/item', arguments: item);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              // Gambar produk
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(item.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Informasi produk
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          item.rating.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Rp ${item.price.toString()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Icon panah
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey.shade400,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

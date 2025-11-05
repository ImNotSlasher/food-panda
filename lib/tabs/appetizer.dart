import 'package:flutter/material.dart';

class Appetizer extends StatelessWidget {
  final ScrollController scrollController;
  const Appetizer({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      'CheesyHotdogBBQChickenPizza.jpg',
      'PastaKeemaoSeafood(Spicy).jpg',
      'PastaShrimpRose.jpg',
      'CheesyHotdogSeafoodPizza(M).jpg',
      'Pastaspicychicken.jpg',
      'Pastaspicypork.jpg'
    ];

    final descriptions = [
      'Cheesy hot dog crust pizza dough topped with BBQ sauce, cooked chicken, lots of cheese, and red onion (For ref only)',
      'Salty, spicy and savoury pasta with seafood (For ref only)',
      'Pasta in a tomato-based cream sauce. Its the perfect hybrid between tomato-based sauces and creamy sauces (For ref only)',
      'Cheesy hot dog crust pizza topped with pizza sauce, cheese, shrimp, crab stick, squid, mussels and pineapple (For ref only)',
      'Pasta-Spicy chicken (Spicy)'
      'Meat Pork & Tomato, Mushroom'
    ];

    final items = List.generate(6, (i) => {
      'name': 'Special Pizza Deal #${i + 1}',
      'description': descriptions[i % descriptions.length],
      'price': ['\$10.94', '\$3.80', '\$3.80', '\$12.22', '\$3.58', '\$3.58'][i % 6],
      'oldPrice': ['\$19.90', '\$6.90', '\$6.90', '\$22.22', '\$6.50', '\$6.50'][i % 6],
      'image': 'assets/img/${imageNames[i % imageNames.length]}',
    });

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Container(
            height: 120,
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                // Texts on the left
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['description']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(item['price']!,
                              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 4),
                          Text(item['oldPrice']!,
                              style: const TextStyle(
                                  color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                // Image on the right
                Container(
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['image']!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.add, color: Colors.red, size: 20),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

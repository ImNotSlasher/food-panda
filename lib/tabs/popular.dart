import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  final ScrollController? scrollController;
  const Popular({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    // replace with your real data or network images
    final imageNames = [
      'CheesyHotdogBBQChickenPizza.jpg',
      'CheesyHotdogSeafoodPizza(M).jpg',
      'PanPizzaSeafood(M).jpg',
      'PastaKeemaoSeafood(Spicy).jpg',
      'Pastacarbonara.jpg',
      'PastaShrimpRose.jpg',
    ];
    
    final items = List.generate(6, (i) => {
      'name': [
        'Cheesy Hotdog BBQ Chicken Pizza (M)',
        'Cheesy Hotdog Seafood Pizza (M)',
        'Pan Pizza Seafood (M)',
        'Pasta-Keemao Seafood (Spicy)',
        'Pasta-Carbonara',
        'Pasta-Shrimp Rose',
        
      ][i % 6],
      'price': ['\$10.95', '\$12.22', '\$7.26', '\$3.80', '\$3.80', '\$3.80',][i % 6],
      'oldPrice': ['\$19.90', '\$22.22', '\$13.20', '\$6.90', '\$6.90', '\$6.90',][i % 6],
      'image': 'assets/img/${imageNames[i % imageNames.length]}',
    });

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Popular', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 6),
                Text('Most ordered right now.', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = items[index];
              return MenuCard(
                name: item['name']!,
                price: item['price']!,
                oldPrice: item['oldPrice']!,
                image: item['image']!,
              );
            }, childCount: items.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.70,
            ),
          ),
        ),

        // optional bottom padding to allow for comfortable scrolling
        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String name;
  final String price;
  final String oldPrice;
  final String image;
  const MenuCard({super.key, required this.name, required this.price, required this.oldPrice, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          // Fixed height image container
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[200], // matches container
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add, color: Colors.red),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(price, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Text(oldPrice, style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 12)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';

class Chicken extends StatelessWidget {
  final ScrollController scrollController;
  const Chicken({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      'Crispywing.jpg',
      'Spicycornercrispywing.jpg',
      'Pepperchickenwings.jpg',
      'Bbqchickenwings'
    ];

    final descriptions = [
      'Crispy, golden brown, and tender (For ref only)',
      'Crispy deep-fried spicy chicken, so yum! (For ref only)',
      'Perfectly marinated chicken wing with pepper and other ingredients then grilled until golden brown (For ref only)',
      'Crispy chicken wings smothered in a sweet, tangy BBQ sauce (For ref only)',
    ];

    final items = List.generate(4, (i) => {
      'name': ['Crispy Wings'
               'Spicy Corner Crispy Wings (6pcs)'
               'Pepper Chicken Wings'
               'BBQ Chicken Wings'
      ][i%4],
      'description': descriptions[i % descriptions.length],
      'price': ['\$3.35', '\$3.35', '\$3.25', '\$3.02'][i % 4],
      'oldPrice': ['\$3.10', '\$6.10', '\$5.90', '\$25.50'][i % 4],
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

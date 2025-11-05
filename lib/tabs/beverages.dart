import 'package:flutter/material.dart';

class Beverages extends StatelessWidget {
  final ScrollController scrollController;
  const Beverages({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      'Purewater.jpg',
      'Milktea.jpg',
      'Lemontea.jpg',
      'Coca(can).jpg',
      'Coca(bottle).jpg',
    ];

    final descriptions = [
      '500 ml',
      'The perfect balance between tea and milk yet not too sweet (For ref only)',
      'Everyone favorite drink! With the most iconic mixture of Taiwanese tea, lemon, and sugar to make it tastes refreshing (For ref only)',
      '330 ml',
      '1.5L'
    ];

    final items = List.generate(5, (i) => {
      'name': [
        'Pure Water',
        'Milk Tea',
        'Lemon Tea',
        'Coca-Cola (can)',
        'Coca-Cola (bottle)',
      ][i % 5],
      'description': descriptions[i % descriptions.length],
      'price': ['\$0.37', '\$0.66', '\$0.55', '\$0.55', '\$1.26'][i % 5],
      'oldPrice': ['\$0.68', '\$1.20', '\$1.00', '\$1.00', '\$2.30'][i % 5],
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

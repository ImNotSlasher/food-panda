import 'package:flutter/material.dart';

class Crispypizza extends StatelessWidget {
  final ScrollController scrollController;
  const Crispypizza({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      'Crispythinpizzaspicybeef.jpg'
      'Crispythinseafoodcocktail.jpg'
      'Crispythintomatoshrimp.jpg'
      'Crispythintomyum.jpg'
    ];

    final descriptions = [
      'Medium (For ref only)',
      'Crispy thin crust pizza topped with pizza sauce, cheese, ham, shrimp, crab stick and pineapple (For ref only)',
      'Medium',
      'Crispy thin crust pizza topped with pizza sauce, tom yum tomato sauce, cheese, shrimp, mussels and mushroom (For ref only)',
    ];

    final items = List.generate(4, (i) => {
      'name': ['Crispy Thin Pizza Spicy Beef (M)'
               'Crispy Thin Seafood Cocktail (M)'
               'Crispy Thin Pizza Tomato Shrimp (M)'
               'Crispy Thin Pizza Tom Yum (M)'    
      ][i%4],
      'description': descriptions[i % descriptions.length],
      'price': ['\$7.26', '\$7.26', '\$7.26', '\$7.26'][i % 4],
      'oldPrice': ['\$13.20', '\$13.20', '\$13.20', '\$13.20'][i % 4],
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

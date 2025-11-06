import 'package:flutter/material.dart';

class Cheesyjumbopizza extends StatelessWidget {
  final ScrollController scrollController;
  const Cheesyjumbopizza({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      'Cheesyjumbohotdogbbqchicken.jpg'
      'Cheesyjumbohotdogbbqpork.jpg'
      'Cheesyjumbohotdoghawaiian.jpg'
      'Cheesyjumbohotdogseafoodcocktail.jpg'
    ];

    final descriptions = [
      'Its a deliciously indulgent combination of savory, cheesy, and smoky flavors, perfect for satisfying cravings with every bite (For ref only)',
      'The cheesy jumbo hotdog BBQ pork pizza is a delightful blend of flavors, with savory BBQ pork, melted cheese, and hearty jumbo hotdog slices on a crispy pizza crust (For ref only)',
      'A tantalizing twist on the classic Hawaiian pizza, featuring juicy jumbo hotdog slices, sweet pineapple chunks, savory ham, and gooey melted cheese on a crispy pizza crust (For ref only)',
      'A mouthwatering creation, featuring succulent seafood cocktail mixed with juicy jumbo hotdog slices and gooey melted cheese, all nestled within a fluffy bun (For ref only)',
    ];

    final items = List.generate(4, (i) => {
      'name': ['Cheesy Jumbo Hotdog BBQ Chicken Pizza (M)'
                'Cheesy Jumbo Hotdog BBQ Pork Pizza (M)'
                'Cheesy Jumbo Hotdog Hawaiian (M)'
                'Cheesy Jumbo Hotdog Seafood Cocktail (M)'
      ][i%4],
      'description': descriptions[i % descriptions.length],
      'price': ['\$10.95', '\$10.95', '\$10.95', '\$12.22'][i % 4],
      'oldPrice': ['\$19.90', '\$19.90', '\$19.90', '\$22.22'][i % 4],
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

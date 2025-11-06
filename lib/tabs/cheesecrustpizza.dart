import 'package:flutter/material.dart';

class Cheesecrustpizza extends StatelessWidget {
  final ScrollController scrollController;
  const Cheesecrustpizza({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      'Cheesecrustbbqchicken.jpg'
      'Cheesecrustseafood.jpg'
      'Cheesecrusttomyum.jpg'
      'Cheesecrusttomatoshrimp.jpg'
      'Cheesecrustspicybeef.jpg'
    ];

    final descriptions = [
      'A delicious blend of savory flavors thats sure to satisfy (For ref only)',
      'This flavorful combination is complemented by melted mozzarella cheese, offering a satisfying taste of the sea in every bite (For ref only)',
      'This pizza offers a perfect blend of savory and spicy flavors that will satisfy your taste buds (For ref only)',
      'A cheese-filled crust topped with succulent shrimp and a savory tomato sauce (For ref only)',
      'Dive into our Cheese Crust Spicy Beef Pizza, featuring a cheese-filled crust topped with flavorful spicy beef, melted mozzarella cheese, and a tangy tomato sauce'
    ];

    final items = List.generate(5, (i) => {
      'name': [
        'Cheese Crust BBQ Chicken Pizza (M)',
        'Cheese Crust Seafood Pizza (M)',
        'Cheese Crust Tom Yum Pizza (M)',
        'Cheese Crust Tomato Shrimp (M)',
        'Cheese Crust Spicy Beef Pizza (M)',
      ][i % 5],
      'description': descriptions[i % descriptions.length],
      'price': ['\$10.95', '\$12.22', '\$12.22', '\$12.22', '\$12.22'][i % 5],
      'oldPrice': ['\$19.90', '\$22.22', '\$22.22', '\$22.22', '\$22.22'][i % 5],
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

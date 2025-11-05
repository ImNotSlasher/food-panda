import 'package:flutter/material.dart';
import 'package:food_panda/widgets/searchbar.dart';
import 'package:food_panda/tabs/tabs.dart';

class Home extends StatefulWidget {
  const Home({super.key});
 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: const SearchBarWidget(), // Add SearchBar here
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to previous screen
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(100, 80, 0, 0),
                  items: const [
                    PopupMenuItem<int>(
                         value: 0,
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.grey), // Icon in front
                            SizedBox(width: 8), // Space between icon and text
                            Text("Restaurant Information"),
                          ],
                        ),
                      ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.grey), // Icon in front
                          SizedBox(width: 8),
                          Text("Add to Favorites"),
                        ],
                      ),
                    ),
                   PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(Icons.share, color: Colors.grey), // Icon in front
                          SizedBox(width: 8),
                          Text("Share"),
                        ],
                      ),
                    ),
                  ],
                );
              }
            ),
          ],
         bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Special offer 60%'), // replace if needed
              Tab(text: 'Pasta'),
              Tab(text: 'Chicken'),
              Tab(text: 'Cheesy Hotdog Pizza'),
              Tab(text: 'Pan Pizza'),
              Tab(text: 'Crispy Pizza'),
              Tab(text: 'Italian Pizza'),
              Tab(text: 'Cheesy Jumbo Pizza'),
              Tab(text: 'Cheese Crust Pizza'),
              Tab(text: 'Appetizers'),
              Tab(text: 'Beverages'),
            ],
          ),
        ),
          body: TabBarView(
           children: [
             Popular(),
             Specialoffer(),
             Pasta(),
             Chicken(),
             Cheesyhotdogpizza(),
             Panpizza(),
             Crispypizza(),
             Italianpizza(),
             Cheesyjumbopizza(),
             Cheesecrustpizza(),
             Appetizer(),
             Beverages(),
            ],
          ),
      ),
    );
  }
}
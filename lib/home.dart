import 'package:flutter/material.dart';
import 'package:food_panda/widgets/searchbar.dart';
import 'package:food_panda/tabs/tabs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<ScrollController> _controllers =
      List.generate(12, (_) =>  ScrollController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 12, vsync: this);

    // Add listeners for auto-switch scroll
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        double pixels = _controllers[i].position.pixels;
        double max = _controllers[i].position.maxScrollExtent;

        // Scroll down → go to next tab
        if (pixels >= max - 50 && i < _controllers.length - 1) {
          if (_tabController.index == i) {
            _tabController.animateTo(i + 1);
          }
        }

        // Scroll up → go to previous tab
        if (pixels <= 50 && i > 0) {
          if (_tabController.index == i) {
            _tabController.animateTo(i - 1);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: const SearchBarWidget(),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
                            Icon(Icons.info, color: Colors.grey),
                            SizedBox(width: 8),
                            Text("Restaurant Information"),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.grey),
                            SizedBox(width: 8),
                            Text("Add to Favorites"),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Icons.share, color: Colors.grey),
                            SizedBox(width: 8),
                            Text("Share"),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ],
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            tabAlignment: TabAlignment.start,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Special Offer 60%'),
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
          controller: _tabController,
          children: [
            Popular(scrollController: _controllers[0]),
            Specialoffer(scrollController: _controllers[1]),
            Pasta(scrollController: _controllers[2]),
            Chicken(scrollController: _controllers[3]),
            Cheesyhotdogpizza(scrollController: _controllers[4]),
            Panpizza(scrollController: _controllers[5]),
            Crispypizza(scrollController: _controllers[6]),
            Italianpizza(scrollController: _controllers[7]),
            Cheesyjumbopizza(scrollController: _controllers[8]),
            Cheesecrustpizza(scrollController: _controllers[9]),
            Appetizer(scrollController: _controllers[10]),
            Beverages(scrollController: _controllers[11]),
          ],
        ),
      ),
    );
  }  
}
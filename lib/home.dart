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

  // Scroll controllers for each tab
  late ScrollController _popularController;
  late ScrollController _specialController;
  late ScrollController _pastaController;
  late ScrollController _chickenController;
  late ScrollController _cheesyController;
  late ScrollController _panController;
  late ScrollController _crispyController;
  late ScrollController _italianController;
  late ScrollController _jumboController;
  late ScrollController _crustController;
  late ScrollController _appetizerController;
  late ScrollController _beveragesController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 12, vsync: this);

    _popularController = ScrollController();
    _specialController = ScrollController();
    _pastaController = ScrollController();
    _chickenController = ScrollController();
    _cheesyController = ScrollController();
    _panController = ScrollController();
    _crispyController = ScrollController();
    _italianController = ScrollController();
    _jumboController = ScrollController();
    _crustController = ScrollController();
    _appetizerController = ScrollController();
    _beveragesController = ScrollController();

    // Example auto-tab-on-scroll for Popular → SpecialOffer
    _popularController.addListener(() {
      if (_popularController.position.pixels >=
          _popularController.position.maxScrollExtent - 50) {
        if (_tabController.index == 0) _tabController.animateTo(1);
      }
    });
    _specialController.addListener(() {
      if (_specialController.position.pixels <= 50) {
        if (_tabController.index == 1) _tabController.animateTo(0);
      }
      if (_specialController.position.pixels >=
          _specialController.position.maxScrollExtent - 50) {
        if (_tabController.index == 1) _tabController.animateTo(2);
      }
    });
    // Add more scroll listeners similarly if needed
  }

  @override
  void dispose() {
    _tabController.dispose();
    _popularController.dispose();
    _specialController.dispose();
    _pastaController.dispose();
    _chickenController.dispose();
    _cheesyController.dispose();
    _panController.dispose();
    _crispyController.dispose();
    _italianController.dispose();
    _jumboController.dispose();
    _crustController.dispose();
    _appetizerController.dispose();
    _beveragesController.dispose();
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
            Popular(scrollController: _popularController),
            Specialoffer(scrollController: _specialController),
            Pasta(scrollController: _pastaController),
            Chicken(scrollController: _chickenController),
            Cheesyhotdogpizza(scrollController: _cheesyController),
            Panpizza(scrollController: _panController),
            Crispypizza(scrollController: _crispyController),
            Italianpizza(scrollController: _italianController),
            Cheesyjumbopizza(scrollController: _jumboController),
            Cheesecrustpizza(scrollController: _crustController),
            Appetizer(scrollController: _appetizerController),
            Beverages(scrollController: _beveragesController),
          ],
        ),
      ),
    );
  }
}
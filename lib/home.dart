import 'package:flutter/material.dart';
import 'package:food_panda/widgets/searchbar.dart';
import 'package:food_panda/tabs/tabs.dart'; // ✅ only one import now!

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  // 12 GlobalKeys for sections
  final List<GlobalKey> _sectionKeys =
      List.generate(12, (index) => GlobalKey());

  bool _userScroll = true;

  final List<String> _tabs = [
    'Popular',
    'Special Offer 60%',
    'Pasta',
    'Chicken',
    'Cheesy Hotdog Pizza',
    'Pan Pizza',
    'Crispy Pizza',
    'Italian Pizza',
    'Cheesy Jumbo Pizza',
    'Cheese Crust Pizza',
    'Appetizers',
    'Beverages',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_userScroll) return;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final keyContext = _sectionKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero).dy;
          // When section top is near app bar
          if (position < 150 && position > 0) {
            if (_tabController.index != i) {
              _tabController.animateTo(i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    _userScroll = false;
    Scrollable.ensureVisible(
      _sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    ).then((_) => _userScroll = true);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBarWidget(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          onTap: (index) => _scrollToSection(index),
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildSection(0, 'Popular', Popular(scrollController: ScrollController())),
            _buildSection(1, 'Special Offer 60%',  Specialoffer(scrollController: ScrollController())),
            _buildSection(2, 'Pasta',  Pasta(scrollController: ScrollController())),
            _buildSection(3, 'Chicken',  Chicken(scrollController: ScrollController())),
            _buildSection(4, 'Cheesy Hotdog Pizza',  Cheesyhotdogpizza(scrollController: ScrollController())),
            _buildSection(5, 'Pan Pizza',  Panpizza(scrollController: ScrollController())),
            _buildSection(6, 'Crispy Pizza',  Crispypizza(scrollController: ScrollController())),
            _buildSection(7, 'Italian Pizza', Italianpizza(scrollController: ScrollController())),
            _buildSection(8, 'Cheesy Jumbo Pizza', Cheesyjumbopizza(scrollController: ScrollController())),
            _buildSection(9, 'Cheese Crust Pizza',  Cheesecrustpizza(scrollController: ScrollController())),
            _buildSection(10, 'Appetizers',  Appetizer(scrollController: ScrollController())),
            _buildSection(11, 'Beverages',  Beverages(scrollController: ScrollController())),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, String title, Widget content) {
    return Container(
      key: _sectionKeys[index],
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(title),
          content,
        ],
      ),
    );
  }
}

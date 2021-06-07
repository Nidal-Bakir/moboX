import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobox/features/categories/bloc/categories_bloc.dart';
import 'package:mobox/features/categories/presentation/screen/categories_tab.dart';
import 'package:mobox/features/home_feed/presentation/screen/home_tab.dart';
import 'package:mobox/features/profile/presentation/screen/profile.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this, initialIndex: 0);

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                'MobeX store',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: 'Leelawadee',
                ),
              ),
              floating: true,
              pinned: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                  Navigator.of(context).pushNamed('/search');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_rounded),
                  onPressed: () {},
                )
              ],
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: 'HOME'),
                  Tab(text: 'CATEGORIES'),
                  Tab(text: 'NOTIFICATIONS'),
                  Tab(text: 'PROFILE'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HomeTab(),
            BlocProvider<CategoriesBloc>(
              create: (context) => GetIt.I.get(),
              child: CategoriesTab(),
            ),
            Tab2(),
            Profile()
          ],
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild Tab2');
    return Container(
      child: Text("Tab 2"),
    );
  }
}

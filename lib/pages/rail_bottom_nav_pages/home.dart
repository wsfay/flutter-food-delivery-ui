import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/app_state.dart';
import '../../colors.dart';
import '../../constants.dart';
// import '../../globals.dart';
import '../search.dart';
import '../tab_pages/all.dart';
import '../tab_pages/recent.dart';
import '../tab_pages/top.dart';
import '../tab_pages/offer.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;
  final List<String> _tabs = ['ALL', 'NEW', 'TOP', 'OFFERS'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _tabs.length,
        vsync: this,
        initialIndex: PageStorage.of(context).readState(
              context,
              identifier: context.read<AppState>().indexOfSelectedTab,
            ) ??
            0);

    _tabController.addListener(() {
      PageStorage.of(context).writeState(
        context,
        _tabController.index,
        identifier: context.read<AppState>().indexOfSelectedTab,
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<AppState>(
      builder: (context, indexOfItem, child) {
        return DefaultTabController(
          length: _tabs.length,
          child: Builder(builder: (context) {
            
            return NestedScrollView(
              

              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      brightness: Brightness.dark,
                        title: (width > LARGE_HANDSET_WIDTH)
                            ? _buildCenterMaterialSearch(context)
                            : _buildMaterialSearch(context),
                        floating:
                            true, pinned:
                            true, snap:
                            true, stretch: true,
                        expandedHeight: 120.0,
                        forceElevated: innerBoxIsScrolled,
                        bottom: (width > LARGE_HANDSET_WIDTH)
                            ? _buildCenteredTabBar(_tabs)
                            : _buildTabBar(_tabs),
                      ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  All(),
                  Recent(),
                  Top(),
                  Offer(),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildCenterMaterialSearch(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 300.0,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          color: onPrimaryColor,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _searchFieldTapped(context),
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Icon(
                      Icons.search,
                      color: onBackground,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Search on demo',
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialSearch(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: onPrimaryColor,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _searchFieldTapped(context),
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Icon(
                  Icons.search,
                   color: onBackground,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Flexible(
                child: Text(
                  'Search on demo',
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _searchFieldTapped(BuildContext context) {
    // nk.currentState.pushNamed('/search');
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Search()));
  }

  Widget _buildTabBar(List<String> _tabs) {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: TabBar(
        controller: _tabController,
        // isScrollable: true,
        tabs: _tabs.map((String name) => Tab(text: name)).toList(),
      ),
    );
  }

  Widget _buildCenteredTabBar(List<String> _tabs) {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: Align(
        alignment: Alignment.center,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs.map((String name) => Tab(text: name)).toList(),
        ),
      ),
    );
  }
}

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid_tracker_app/config/palette.dart';
import 'package:covid_tracker_app/config/styles.dart';
import 'package:covid_tracker_app/widgets/covid_bar_chart.dart';
import 'package:covid_tracker_app/widgets/custom_appBar.dart';
import 'package:covid_tracker_app/widgets/stats_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatusTabBar(),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(child: StatsGrid(),)
            ,),
          SliverPadding(padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: [],),
            ),
            ),
        ],
      ),
    );
  }
  SliverPadding _buildHeader(){
    return SliverPadding(
      padding: EdgeInsets.all(10.0),
      sliver: SliverToBoxAdapter(
        child: Text('Statistics',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
      ),
    );
  }
  SliverToBoxAdapter _buildRegionTabBar(){
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 35.0,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20.0),
        ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Text('My Country'),
              Text('Global'),
            ],
            onTap: (index){},
          ),
        ),
      ),
    );
  }
  SliverPadding _buildStatusTabBar(){
    return SliverPadding(
      padding: const EdgeInsets.all(20),
    sliver: SliverToBoxAdapter(
      child: DefaultTabController(length: 3,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelStyle: Styles.tabTextStyle,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white38,
          tabs: [
            Text('Today'),
            Text('Total'),
            Text('Yesterday'),
          ],
          onTap: (index){},
        ),
      ),
    ),
    );
  }
}

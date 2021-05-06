import 'package:covid_tracker_app/config/palette.dart';
import 'package:covid_tracker_app/config/styles.dart';
import 'package:covid_tracker_app/data/data.dart';
import 'package:covid_tracker_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'USA';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
        _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }
  SliverToBoxAdapter _buildHeader(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding:const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('COVID-19',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                CountryDropdown(
                    countries: ['CN','FR','IN','IT','UK','USA'],
                    country: _country,
                    onChanged: (val) => setState(() => _country = val)
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Are you feeling sick?',style:const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                )),
                SizedBox(height: screenHeight * 0.01),
                Text('If you feel sick with any COVID-19 symptoms, please call us or text us immediately for help',style:const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white70
                )
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton.icon(onPressed: (){},
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                      icon: const Icon(Icons.phone,
                      color: Colors.white,

                    ), label: Text(
                        'Call Now',
                        style: Styles.ButtonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    // ignore: deprecated_member_use
                    FlatButton.icon(onPressed: (){},
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                      icon: const Icon(Icons.chat_bubble,
                        color: Colors.white,

                      ), label: Text(
                        'SMS us',
                        style: Styles.ButtonTextStyle,
                      ),
                      textColor: Colors.white,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Prevention tips',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
          const SizedBox(height: 7.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: prevention.map((e) => Column(
              children: [
                Image.asset(
                  e.keys.first,
                  height: screenHeight * 0.11,
                ),
                SizedBox(height: screenHeight * 0.005,),
                Text(
                  e.values.first,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
                  textAlign: TextAlign.center,
                ),
              ],
            )).toList(),
          ),
        ],
      ),
    ),
  );
  }
  SliverToBoxAdapter _buildYourOwnTest(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
        padding: EdgeInsets.all(5.0),
        height: screenHeight*0.17,
       decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffad9fe4), Palette.primaryColor],
          ),
         borderRadius: BorderRadius.circular(20.0),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           Image.asset('assets/images/test.jpg'),
           Column(
             children: <Widget>[
               Text('Do your own Test!',style: TextStyle(color: Colors.white,fontSize: 18.0)),
               SizedBox(height: screenHeight * 0.01),
               Text('Follow the instructions\nto do your own test',style: TextStyle(color: Colors.white,fontSize: 15.0))

             ],
           )
         ],
        ),
      ),
    );
  }
}

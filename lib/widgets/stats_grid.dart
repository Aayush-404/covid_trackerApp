import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('Total Cases','1.81M',Colors.orange),
                  _buildStatCard('Total deaths', '145k',Colors.red),
                ],
              )
          ),
          Flexible(
              child: Row(
                children: [
                  _buildStatCard('Total Cases','1.81M',Colors.orange),
                  _buildStatCard('Total deaths', '145k',Colors.red),
                  _buildStatCard('Recovered', '190k', Colors.lightBlue)
                ],
              )
          ),
        ],
      ),
    );
  }
  Expanded _buildStatCard (String title,String count,MaterialColor color){
    return  Expanded(
             child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(title,style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w600),),
                      Text(count,style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                        ),
                    ),
            );
  }

}

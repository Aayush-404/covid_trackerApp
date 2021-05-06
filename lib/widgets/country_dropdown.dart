import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {

  final List<String> countries;
  final String country;
  final Function(String) onChanged;

  const CountryDropdown({
     @required this.countries,
     @required this.country,
     @required this.onChanged,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries.map((e) => DropdownMenuItem(
              child: Row(
                children: <Widget>[

                CircleAvatar(
                  radius: 18.0,
                  child: Image.asset('assets/images/${e.toLowerCase()}_logo.jpeg'),
                ),
                const SizedBox(width: 8.0),
                Text(e,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              ),
            value: e,
          ))
                .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
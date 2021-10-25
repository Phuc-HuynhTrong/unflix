import 'package:flutter/material.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({Key? key}) : super(key: key);

  @override
  _SearchMainScreenState createState() => _SearchMainScreenState();
}

class _SearchMainScreenState extends State<SearchMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 15, 8, 0),
            decoration: BoxDecoration(
              color: Color(0xff323232),
              borderRadius: BorderRadius.circular(5)
              
            ),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Color(0xFF7c7c7c)),
                Text('Tìm kiếm', style: TextStyle(
                  fontSize:  12,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF7c7c7c)
                ),)
              ],
            ),
          )
        ],
      ),

    );
  }
}

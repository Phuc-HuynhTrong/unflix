import 'package:flutter/material.dart';
import 'package:unflix/core/data/listposter.dart';
import 'package:unflix/style/text_style.dart';

class FavouriteListScreen extends StatelessWidget {
  const FavouriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          textTheme: TextTheme(
              headline6: TextInApp().headline6(Colors.white, context)),
          title: Text('Danh sách'),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
        ),
        body: GridView.count(
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 100.0,
            childAspectRatio: 2.0,
            crossAxisCount: 3,
            children: List.generate(favouriteList.length, (index) {
              return Container(
                height: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 120.0,
                    width: 50.0,
                    fit: BoxFit.fill,
                    image: favouriteList[index],
                  ),
                ),
              );
            })));
  }
}

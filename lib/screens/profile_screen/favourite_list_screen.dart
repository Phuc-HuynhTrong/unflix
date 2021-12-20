import 'package:flutter/material.dart';
import 'package:unflix/core/data/listposter.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:unflix/style/text_style.dart';

class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteListScreen> createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  List<int> listDelete = [];
  bool isShowToDelete = false;
  ListPoster data = new ListPoster();
  var listFilm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listFilm = data.favouriteList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          textTheme: TextTheme(
              headline6: TextInApp().headline6(Colors.white, context)),
          title: Text('Danh sách'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          actions: [
            isShowToDelete
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        isShowToDelete = false;
                        listDelete.clear();
                      });
                    },
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ))
                : SizedBox(),
            SizedBox(
              width: 10,
            ),
            isShowToDelete
                ? IconButton(
                    onPressed: () {
                      for (int i = 0; i < listDelete.length; i++) {
                        setState(() {
                          listFilm.removeAt(listDelete[i]);
                        });
                      }
                      setState(() {
                        isShowToDelete = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        //width: MediaQuery.of(context).size.width ,
                        backgroundColor: Color(0xffF6C700),
                        content: Text(
                          "Đã xóa khỏi danh sách",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(milliseconds: 2000),
                      ));
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cast,
                      color: Colors.white,
                    ),
                  ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: GridView.count(
              physics:
                  BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
              children: List.generate(listFilm.length, (index) {
                return Container(
                  height: 100.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      onTap: () {
                        !isShowToDelete
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FilmInformationScreen()))
                            : {
                                setState(() {
                                  if(listDelete.contains(index))
                                    {
                                      listDelete.remove(index);
                                    }
                                  else{
                                    listDelete.add(index);
                                  }
                                })
                              };
                      },
                      onLongPress: () {
                        if (!isShowToDelete) {
                          setState(() {
                            isShowToDelete = true;
                            listDelete.add(index);
                          });
                        }
                      },
                      child: !isShowToDelete
                          ? Image(
                              height: 120.0,
                              width: 50.0,
                              fit: BoxFit.fill,
                              image: listFilm[index],
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: listFilm[index],
                                fit: BoxFit.cover,
                              )),
                              child: GestureDetector(
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                    child: listDelete.contains(index)
                                        ? Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.blue,
                                                size: 30,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Center(),
                                          )),
                              )),
                    ),
                  ),
                );
              })),
        ));
  }
}

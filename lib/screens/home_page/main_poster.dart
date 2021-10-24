import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unflix/controllers/mainposter_controller.dart';
import 'package:unflix/core/data/listposter.dart';
import 'package:unflix/style/text_style.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class MainPoster extends StatelessWidget {
  const MainPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviePosterController moviePosterController =
        Get.put(MoviePosterController());
    ListPoster listPoster = ListPoster();
    TextInApp textInApp = TextInApp();
    return Container(
        height: 570,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 550,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: moviePosterController.pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 550,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: listPoster.listMainPoster[index].poster,
                        fit: BoxFit.fill,
                      )),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 190,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                            listPoster
                                                .listMainPoster[index].name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 10),
                                        width: 23,
                                        height: 11,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF6C700),
                                        ),
                                        child: Text(
                                          'IMDb',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              listPoster
                                                  .listMainPoster[index].imdb
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '/10 ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffF6C700),
                                              size: 11,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 190,
                                    child: Text(
                                      listPoster
                                          .listMainPoster[index].description,
                                      style: textInApp.subtitle(
                                          Colors.white, context),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Container(
                                      height: 46,
                                      width: 127,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffF6C700),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Colors.black,
                                            size: 28,
                                          ),
                                          Text(' Phát',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800)),
                                        ],
                                      ),
                                    )),
                                Container(
                                  width: 1,
                                  margin: EdgeInsets.only(right: 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.more_vert_rounded,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Obx(() => Container(
                    height: 1,
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: moviePosterController.currentPage == 1
                              ? Colors.white
                              : Colors.white38,
                          size: 12,
                        ),
                        Icon(
                          Icons.circle,
                          color: moviePosterController.currentPage == 2
                              ? Colors.white
                              : Colors.white38,
                          size: 12,
                        ),
                        Icon(
                          Icons.circle,
                          color: moviePosterController.currentPage == 3
                              ? Colors.white
                              : Colors.white38,
                          size: 12,
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}

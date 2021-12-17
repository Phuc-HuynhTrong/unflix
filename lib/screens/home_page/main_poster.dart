import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unflix/controllers/mainposter_controller.dart';
import 'package:unflix/core/data/listposter.dart';
import 'package:unflix/core/models/SuperIcon.dart';
import 'package:unflix/screens/display_movie/display_movie_screen.dart';
import 'package:unflix/screens/film_information/film_information_screen.dart';
import 'package:unflix/style/text_style.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class MainPoster extends StatelessWidget {
  final List<MainPosterModel> listPoster;

  const MainPoster({
    Key? key,
    required this.listPoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviePosterController moviePosterController =
        Get.put(MoviePosterController());
    TextInApp textInApp = TextInApp();
    return Container(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          padding: EdgeInsets.only(bottom: 8),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FilmInformationScreen()));
          },
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(1),
                height: 550,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    onPageChanged: (int index) {
                      moviePosterController.chanePagecurrent(index);
                    },
                    controller: moviePosterController.pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 550,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: listPoster[index].poster,
                          fit: BoxFit.fill,
                        )),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            listPoster[index].name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w800),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 8, right: 4),
                                              height: 12,
                                              child: Image.asset(
                                                'assets/icons/imdb.png',
                                              ),
                                            ),
                                            Text(
                                              listPoster[index]
                                                  .imdb
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight.w800),
                                            ),
                                            const Text(
                                              '/10 ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Color(0xffF6C700),
                                              size: 11,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      listPoster[index].description,
                                      style: textInApp.subtitle(
                                          Colors.white, context),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.landscapeLeft,
                                          DeviceOrientation.landscapeRight
                                        ]);
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DisplayMovieScreen(
                                                      assetVideo:
                                                          'assets/videos/TopGun.mp4',
                                                      isSingleFlim: false,
                                                    )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Color(0xffF6C700),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.play_arrow_rounded,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text('Phát',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                            SizedBox(
                                              width: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 2,
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_vert_rounded,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Obx(() => Container(
                      height: 1,
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: moviePosterController.currentPage == 0
                                ? Colors.white
                                : Colors.white38,
                            size: 8,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.circle,
                            color: moviePosterController.currentPage == 1
                                ? Colors.white
                                : Colors.white38,
                            size: 8,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.circle,
                            color: moviePosterController.currentPage == 2
                                ? Colors.white
                                : Colors.white38,
                            size: 8,
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}

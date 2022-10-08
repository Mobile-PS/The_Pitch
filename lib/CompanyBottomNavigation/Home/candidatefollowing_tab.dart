import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_textform_widget.dart';
import 'package:the_new_pitchapp/models/CandidateModel.dart';

import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';
import 'package:the_new_pitchapp/utility/widget/custom_button.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/utility/widget/score_container.dart';
import 'package:video_player/video_player.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class CandidateFollowingTabPage extends StatelessWidget {
  final List<CData> videos;
  final bool isFollowing;

  final int? variable;

  CandidateFollowingTabPage(this.videos, this.isFollowing, {this.variable});

  @override
  Widget build(BuildContext context) {
    return CandidateFollowingTabBody(videos, isFollowing, variable);
  }
}

class CandidateFollowingTabBody extends StatefulWidget {
  final List<CData> videos;

  final bool isFollowing;
  final int? variable;

  CandidateFollowingTabBody(this.videos, this.isFollowing, this.variable);

  @override
  _CandidateFollowingTabBodyState createState() => _CandidateFollowingTabBodyState();
}

class _CandidateFollowingTabBodyState extends State<CandidateFollowingTabBody> {
  PageController? _pageController;
  int current = 0;
  bool isOnPageTurning = false;

  void scrollListener() {
    if (isOnPageTurning &&
        _pageController!.page == _pageController!.page!.roundToDouble()) {
      setState(() {
        current = _pageController!.page!.toInt();
        isOnPageTurning = false;
      });
    } else if (!isOnPageTurning &&
        current.toDouble() != _pageController!.page) {
      if ((current.toDouble() - _pageController!.page!).abs() > 0.1) {
        setState(() {
          isOnPageTurning = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController!.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemBuilder: (context, position) {
        return VideoPage(
          widget.videos[position].videoPath!,
          widget.videos[position].photoPath!,
          widget.videos[position].firstName!,
          pageIndex: position,
          currentPageIndex: current,
          isPaused: isOnPageTurning,
          isFollowing: widget.isFollowing,
        );
      },
      /*onPageChanged: widget.variable == null
          ? (i) async {
              if (i == 2) {
                await showModalBottomSheet(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: transparentColor),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.0))),
                  context: context,
                  isScrollControlled: true,
                  isDismissible: false,
                  builder: (context) {
                    return Container(
                        height: MediaQuery.of(context).size.width * 1.2,
                        child: LoginNavigator());
                  },
                );
              }
            }
          : null,*/
      itemCount: widget.videos.length,
    );
  }
}

class VideoPage extends StatefulWidget {
  final String video;
  final String image;
  final int? pageIndex;
  final int? currentPageIndex;
  final bool? isPaused;
  final bool? isFollowing;
  final String? name;

  VideoPage(this.video, this.image,this.name,
      {this.pageIndex, this.currentPageIndex, this.isPaused, this.isFollowing});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> with RouteAware {
  late VideoPlayerController _controller;
  bool initialized = false;
  bool isLiked = false;
  List<String> _dynamicChips = [
    'Health',
    'Food',
    'Nature',
  ];
  double start = 0;
  double end = 50;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video)
      ..initialize().then((value) {
        setState(() {
          _controller.setLooping(true);
          initialized = true;
        });
      });
  }

  @override
  void didPopNext() {
    print("didPopNext");
    _controller.play();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    print("didPushNext");
    _controller.pause();
    super.didPushNext();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageIndex == widget.currentPageIndex &&
        !widget.isPaused! &&
        initialized) {
      _controller.play();
    } else {
      _controller.pause();
    }
    // var locale = AppLocalizations.of(context)!;
//    if (_controller.value.position == _controller.value.duration) {
//      setState(() {
//      });
//    }
    if (widget.pageIndex == 2) _controller.pause();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            },
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : SizedBox.shrink(),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: -10.0,
            bottom: 80.0,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _controller.pause();
                    //  Navigator.pushNamed(context, PageRoutes.userProfilePage);
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                          backgroundImage:
                          NetworkImage(widget.image)),
                      PositionedDirectional(
                        bottom: -10,
                        start: 12,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: mainColor,
                          child: Icon(
                            Icons.add,
                            size: 12,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  ImageIcon(
                    AssetImage('assets/icons/ic_views.png'),
                    color: secondaryColor,
                  ),
                  '1.2k',
                ),
                CustomButton(
                  Icon(
                    isLiked ? Icons.bookmark : Icons.bookmark_border,
                    color: secondaryColor,
                  ),
                  '8.2k',
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                CustomButton(
                    ImageIcon(
                      AssetImage('assets/icons/ic_comment.png'),
                      color: secondaryColor,
                    ),
                    '287', onPressed: () {
                  // commentSheet(context);
                }),
                CustomButton(
                  Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: secondaryColor,
                  ),
                  '8.2k',
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                /* Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: RotatedImage(widget.image),
                ),*/
              ],
            ),
          ),
          widget.isFollowing!
              ? Positioned.directional(
            textDirection: Directionality.of(context),
            end: 27.0,
            bottom: 320.0,
            child: CircleAvatar(
                backgroundColor: mainColor,
                radius: 8,
                child: Icon(
                  Icons.add,
                  color: secondaryColor,
                  size: 12.0,
                )),
          )
              : SizedBox.shrink(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 60.0),
                child: LinearProgressIndicator(
                  //minHeight: 1,
                )),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 12.0,
            bottom: 72.0,
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, PageRoutes.addMusic);
              },
              child: Row(children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(widget.image)),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: widget.name!+'\n',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5)),
                    TextSpan(text: 'Test test test'),
                    TextSpan(
                        text: 'seeMore',
                        style: TextStyle(
                            color: secondaryColor.withOpacity(0.5),
                            fontStyle: FontStyle.italic))
                  ]),
                )
              ]),
            ),
          ),
          PositionedDirectional(
              end: 20,
              top: 34,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: transparentColor),
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.0))),
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    builder: (context) {
                      return StatefulBuilder(builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Container(
                            height: MediaQuery.of(context).size.width * 1.4,
                            child: Container(
                              child: Column(children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width / 1.2,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 5),
                                        Icon(Icons.search, size: 18),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: TypeAheadField(
                                            textFieldConfiguration:
                                            TextFieldConfiguration(
                                              // controller: profileCtrl.skillcontroller,
                                              cursorColor: buttonColor,
                                              textInputAction:
                                              TextInputAction.search,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                constString.serachskill,
                                                hintStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18.0,
                                                    fontFamily: 'Nunito Sans'),
                                              ),
                                            ),
                                            suggestionsCallback: (pattern) {
                                              //  profileCtrl.getSkilldata("1.0", pattern);
                                              //  return profileCtrl.skillList;
                                              return _dynamicChips;
                                            },
                                            itemBuilder:
                                                (context, String suggestion) {
                                              return Container(
                                                height: 40,
                                                padding:
                                                const EdgeInsets.all(10),
                                                margin: const EdgeInsets.all(2),
                                                child: SubstringHighlight(
                                                  text: suggestion,
                                                  term: suggestion,
                                                  textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                  ),
                                                  textStyleHighlight:
                                                  const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              );
                                            },
                                            onSuggestionSelected:
                                                (String suggestion) {
                                              //  profileCtrl.updateSkill(suggestion);
                                              //  profileCtrl.skillcontroller.clear();
                                              hideKeyBoard();
                                            },
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: const Color.fromRGBO(
                                              200, 200, 200, 1),
                                          child: IconButton(
                                            onPressed: () {
                                              // profileCtrl.skillcontroller.clear();
                                              SystemChannels.textInput
                                                  .invokeMethod(
                                                  'TextInput.hide');
                                            },
                                            constraints: const BoxConstraints(),
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    width:
                                    MediaQuery.of(context).size.width / 1.2,
                                    child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 6.0,
                                        runSpacing: 6.0,
                                        children: List<Widget>.generate(
                                            _dynamicChips.length, (int index) {
                                          return Chip(
                                            label: Text(_dynamicChips[index]),
                                            onDeleted: () {
                                              // profileCtrl.removeSkill(index);
                                            },
                                          );
                                        }))),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Experience : " +
                                      start.toInt().toString() +
                                      " - " +
                                      end.toInt().toString() +
                                      " years",
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                RangeSlider(
                                  inactiveColor: Colors.black,
                                  activeColor: Colors.black,
                                  values: RangeValues(start, end),
                                  labels: RangeLabels(
                                      start.toString(), end.toString()),
                                  onChanged: (value) {
                                    setState(() {
                                      start = value.start;
                                      end = value.end;
                                    });
                                  },
                                  min: 0,
                                  max: 50,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width / 1.2,
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(color: Colors.grey)),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        hint: Text("Employee Type"),
                                        items: <String>[
                                          'Messaging',
                                          'Chating',
                                          'No Longer Interested',
                                          'Document Request'
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (_) {},
                                      )),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DefaultButton(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            3,
                                        height: 50,
                                        text: 'Search',
                                        press: () {}),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    DefaultButton(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            3,
                                        height: 50,
                                        text: 'Clear',
                                        press: () {})
                                  ],
                                )
                              ]),
                            ));
                      });
                    },
                  );
                },
                child: CoinContainer(),
              ))
        ],
      ),
    );
  }
}

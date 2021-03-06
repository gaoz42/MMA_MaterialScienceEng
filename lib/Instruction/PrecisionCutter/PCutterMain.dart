import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'PCutterData.dart';
import 'package:flutter/services.dart';
import 'package:mma_mse/customTileScroll.dart';

class PCutterinstruction extends StatefulWidget {
  final video videoType;
  const PCutterinstruction({Key key, this.videoType}) : super(key: key);

  @override
  _PCutterinstructionState createState() => _PCutterinstructionState();
}

class _PCutterinstructionState extends State<PCutterinstruction> {
  List _instructionList = List<video>();
  double _screenWidth;
  double _screenH;
  final ScrollController controller = ScrollController();
  List titles = [];

  @override
  void initState() {
    super.initState();
    _instructionList = video().videoList();
    for (var j = 0; j < _instructionList.length; j++) {
      titles.add(_instructionList[j].title);
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    Drawer pCutterinstru() => Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Instruction For Precision Cutter"),
              ),
              for (var i = 0; i < titles.length; i++)
                ScrollcustomListTile(
                    name: titles[i],
                    pageTo: i - 1,
                    fonts: 13,
                    controller: controller),
            ],
          ),
        );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Precision Cutter instruction",
            style:
                TextStyle(fontSize: _screenH / 35, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: pCutterinstru(),
        body: SafeArea(
          child: ListView.builder(
            itemExtent: 330,
            controller: controller,
            itemCount: _instructionList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  color: _instructionList[index].materialcolor,
                  margin: EdgeInsets.fromLTRB(20, 16, 20, 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 250,
                          left: 5,
                          child: Text(
                            _instructionList[index].title,
                            style: TextStyle(
                                fontSize: _screenH / 47,
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 270,
                          left: 5,
                          child: Text(
                            _instructionList[index].subtitle,
                            style: TextStyle(fontSize: _screenH / 58),
                          )),
                      Positioned(
                          top: 0,
                          child: Container(
                            height: 245,
                            child: YoutubePlayer(
                              controller:
                                  _instructionList[index].videoController,
                              liveUIColor: Colors.amber,
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

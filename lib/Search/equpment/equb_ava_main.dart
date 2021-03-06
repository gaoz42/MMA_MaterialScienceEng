import 'equb_available.dart';
import 'equb_ava_data.dart';
import 'package:flutter/material.dart';
import 'package:mma_mse/customTileScroll.dart';

class equb_main extends StatefulWidget {
  final HeroType heroType;
  const equb_main({Key key, this.heroType}) : super(key: key);

  @override
  _equb_mainState createState() => _equb_mainState();
}

class _equb_mainState extends State<equb_main> {
  HeroType _heroType;
  double _screenWidth;
  List _heroTypeList = List<HeroType>();
  double _screenWidthAdjustment;
  List equipments = [];
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _heroTypeList = HeroType().createSampleList();

    for (var eq = 0; eq < _heroTypeList.length; eq++) {
      equipments.add(_heroTypeList[eq].title);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    Drawer searchEquipMain() => Drawer(
            child: ListView(children: [
          DrawerHeader(child: Text("Equipment Avaiable in MSE")),
          ExpansionTile(
            title: Text("Tensile Machine"),
            children: [
              ScrollcustomListTile(
                  name: equipments[0],
                  pageTo: 0,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[11],
                  pageTo: 11,
                  fonts: 13,
                  controller: controller),
            ],
          ),
          ExpansionTile(
            title: Text("Hardness Tester"),
            children: [
              ScrollcustomListTile(
                  name: equipments[1],
                  pageTo: 1,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[5],
                  pageTo: 5,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[13],
                  pageTo: 13,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[12],
                  pageTo: 12,
                  fonts: 13,
                  controller: controller),
            ],
          ),
          ExpansionTile(
            title: Text("Microscope"),
            children: [
              ScrollcustomListTile(
                  name: equipments[6],
                  pageTo: 6,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[10],
                  pageTo: 10,
                  fonts: 13,
                  controller: controller),
            ],
          ),
          ExpansionTile(
            title: Text("Furnace"),
            children: [
              ScrollcustomListTile(
                  name: equipments[7],
                  pageTo: 7,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[9],
                  pageTo: 9,
                  fonts: 13,
                  controller: controller),
            ],
          ),
          ExpansionTile(
            title: Text("Cutter"),
            children: [
              ScrollcustomListTile(
                  name: equipments[3],
                  pageTo: 3,
                  fonts: 13,
                  controller: controller),
              ScrollcustomListTile(
                  name: equipments[14],
                  pageTo: 14,
                  fonts: 13,
                  controller: controller),
            ],
          ),
          ExpansionTile(title: Text("Mounting Press"), children: [
            ScrollcustomListTile(
                name: equipments[15],
                pageTo: 15,
                fonts: 13,
                controller: controller),
            ScrollcustomListTile(
                name: equipments[16],
                pageTo: 16,
                fonts: 13,
                controller: controller),
            ScrollcustomListTile(
                name: equipments[17],
                pageTo: 17,
                fonts: 13,
                controller: controller),
          ]),
          ExpansionTile(title: Text("Polisher"), children: [
            ScrollcustomListTile(
                name: equipments[8],
                pageTo: 8,
                fonts: 13,
                controller: controller),
          ]),
          ScrollcustomListTile(
              name: equipments[2],
              pageTo: 2,
              fonts: 13,
              controller: controller),
          ScrollcustomListTile(
              name: equipments[4],
              pageTo: 4,
              fonts: 13,
              controller: controller),
        ]));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Equipment Availble in MSE",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      drawer: searchEquipMain(),
      body: SafeArea(
          child: ListView.builder(
              controller: controller,
              itemExtent: 305.0,
              itemCount: _heroTypeList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                    semanticContainer: true,
                    margin: EdgeInsets.fromLTRB(21, 16, 21, 8),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Hero(
                            tag: 'background' + _heroTypeList[index].title,
                            child: Container(
                              color: _heroTypeList[index].materialColor,
                            )),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Hero(
                            tag: 'image' + _heroTypeList[index].title,
                            child: Image.network(
                              _heroTypeList[index].image,
                              fit: BoxFit.fitWidth,
                              height: 220,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 225.0,
                          left: 14.0,
                          width: _screenWidthAdjustment,
                          child: Hero(
                              tag: 'text' + _heroTypeList[index].title,
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  '${_heroTypeList[index].title}',
                                  style: TextStyle(
                                      fontSize: _screenWidth / 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )),
                        ),
                        Positioned(
                            top: 253.0,
                            left: 14.0,
                            width: _screenWidthAdjustment,
                            child: Hero(
                                tag: 'subtitle' + _heroTypeList[index].title,
                                child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      _heroTypeList[index].subTitle,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: _screenWidth / 33,
                                          fontWeight: FontWeight.bold),
                                    )))),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      fullscreenDialog: true,
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return equb_ava(
                            heroType: HeroType(
                                title: _heroTypeList[index].title,
                                subTitle: _heroTypeList[index].subTitle,
                                fText: _heroTypeList[index].fText,
                                image: _heroTypeList[index].image,
                                pageTo: _heroTypeList[index].pageTo,
                                materialColor:
                                    _heroTypeList[index].materialColor));
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                            opacity:
                                animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                            child: child);
                      },
                    ));
                  },
                );
              })),
    );
  }
}

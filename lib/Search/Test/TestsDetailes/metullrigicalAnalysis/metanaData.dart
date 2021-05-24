import 'package:flutter/cupertino.dart';
import 'package:mma_mse/equipment/MountPress/EcoPress/EcoMain.dart';
import 'package:mma_mse/equipment/ManualGrinder/MgrinderMain.dart';

class testdetailData {
  String title;
  String content;
  String backImg;
  String addOnImg;
  Widget pageTo;

  testdetailData(
      {this.title, this.content, this.backImg, this.addOnImg, this.pageTo});
  String bImg =
      "https://github.com/RayLyu-Mac/MMA_MaterialScienceEng/blob/main/assest/test/IronS.jpg?raw=true";
  List<testdetailData> detailL() {
    List detail = List<testdetailData>();
    return detail
      ..add(testdetailData(
          title: "Step1: Mount the sample",
          content:
              "First step is to mounting the sample using mounting press machine and a thermosetting resin to form a single polymeric-specimen compound. Followed with engrave the initial, sample’s name and date on the back of the compound",
          backImg: bImg,
          pageTo: EcoPress(),
          addOnImg:
              "https://github.com/RayLyu-Mac/MMA_MaterialScienceEng/blob/main/assest/equipment/met.jpg?raw=true"))
      ..add(testdetailData(
          title: "Step2: Grind sample",
          content:
              "Then the sample was grinded several times. Start with 240 silicon carbide (Sic) paper, the specimen’s edge was first being grinded to make it easier to be picked up. Then goes to a series of silicon carbide wheel with the counter clockwise or clockwise 90 turn based on the last direction and with appropriate downward force. The specimen checked for every 40 seconds to see how well it grinded and the operators would adjust the force they apply on",
          backImg: bImg,
          pageTo: ManualGrinder(),
          addOnImg:
              "https://github.com/RayLyu-Mac/MMA_MaterialScienceEng/blob/main/assest/equipment/mg.jpg?raw=true"));
  }
}

import 'package:digithub/Components/buttons/sport_selector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:digithub/Components/Cards/score_card.dart';
import 'package:digithub/Components/Cards/star_card.dart';
import 'package:digithub/Components/app_bar/main_app_bar.dart';
import 'package:digithub/Components/buttons/compact_controller.dart';
import 'package:digithub/Components/buttons/date_selector_button.dart';
import 'package:digithub/Components/buttons/group_by_btn.dart';
import 'package:digithub/Components/buttons/live_btn.dart';
import 'package:digithub/Components/buttons/text_tab_button.dart';
import 'package:digithub/Components/dividers/gradient_divider.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                
                const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 20),
                    child: SportsSelectorButton(),
                  ),
                ),

               
                const MainAppBar(
                  title: 'Football',
                ),
                const CompactControlBar(),
                const DateSelectorButton(),
                const SizedBox(
                  height: 10,
                ),
                const GradientDivider(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics:
                        const BouncingScrollPhysics(), 
                    child: Column(
                      children: [
                        const TextSelectorButton(),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LiveButton(),
                              GroupByButton(),
                            ],
                          ),
                        ),
                       
                        IconButtonWithStar(
                          imagePath: "assets/images/logo.jpg",
                          title: "FIFA Club World Cup",
                          initiallyStarred: true, 
                          buttons: [
                            ButtonItem(Icons.menu, "Standing"),
                            ButtonItem(Icons.people, "Source"),
                            ButtonItem(Icons.access_time, "Share"),
                          ],
                          onStarChanged: (isStarred) {
                            print("Star status changed to: $isStarred");
                          }, color: Colors.amber,
                        ),


                        const MatchCard(
                          team1Name: "Al Ahly",
                          team1ShortName: "ALAHLY",
                          team1Logo: "assets/images/ALAHLY.jpg",
                          team2Name: "Chelsea",
                          team2ShortName: "CHE",
                          team2Logo: "assets/images/Chelsea.jpg",
                          score: "2 - 0",
                          additionalInfo: null,
                          matchStatus: "FINAL",
                          colorLeft: Colors.blue,
                          colorRight: Colors.red,
                        ),
                        const MatchCard(
                          team1Name: "Al Ahly",
                          team1ShortName: "ALAHLY",
                          team1Logo: "assets/images/ALAHLY.jpg",
                          team2Name: "Chelsea",
                          team2ShortName: "CHE",
                          team2Logo: "assets/images/Chelsea.jpg",
                          score: "2 - 0",
                          additionalInfo: null,
                          matchStatus: "7:00",
                          colorLeft: Colors.blue,
                          colorRight: Colors.red,
                        ),
                       IconButtonWithStar(
                          imagePath: "assets/images/logo.jpg",
                          title: "UEFA Champions League",
                          initiallyStarred: true, 
                          buttons: [
                            ButtonItem(Icons.menu, "Standing"),
                            ButtonItem(Icons.people, "Source"),
                            ButtonItem(Icons.access_time, "Share"),
                          ],
                          onStarChanged: (isStarred) {
                            print("Star status changed to: $isStarred");
                          }, color:  Colors.blue[800],
                        ),
                        const MatchCard(
                          team1Name: "Al Ahly",
                          team1ShortName: "ALAHLY",
                          team1Logo: "assets/images/ALAHLY.jpg",
                          team2Name: "Chelsea",
                          team2ShortName: "CHE",
                          team2Logo: "assets/images/Chelsea.jpg",
                          score: "2 - 0",
                          additionalInfo: null,
                          matchStatus: "FINAL",
                          colorLeft: Colors.yellow,
                          colorRight: Colors.green,
                        ),
                        const MatchCard(
                          team1Name: "Al Ahly",
                          team1ShortName: "ALAHLY",
                          team1Logo: "assets/images/ALAHLY.jpg",
                          team2Name: "Chelsea",
                          team2ShortName: "CHE",
                          team2Logo: "assets/images/Chelsea.jpg",
                          score: "2 - 0",
                          additionalInfo: null,
                          matchStatus: "FINAL",
                          colorLeft: Colors.yellow,
                          colorRight: Colors.green,
                        ),
                        const MatchCard(
                          team1Name: "Al Ahly",
                          team1ShortName: "ALAHLY",
                          team1Logo: "assets/images/ALAHLY.jpg",
                          team2Name: "Chelsea",
                          team2ShortName: "CHE",
                          team2Logo: "assets/images/Chelsea.jpg",
                          score: "2 - 0",
                          additionalInfo: null,
                          matchStatus: "FINAL",
                          colorLeft: Colors.yellow,
                          colorRight: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }
}
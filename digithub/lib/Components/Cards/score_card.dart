
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String team1Name;
  final String team1ShortName;
  final String team1Logo;
  final String team2Name;
  final String team2ShortName;
  final String team2Logo;
  final String score;
  final String? additionalInfo;
  final String? matchStatus;
  final Color? colorRight;
   final Color? colorLeft;
  const MatchCard({
    required this.team1Name,
    required this.team1ShortName,
    required this.team1Logo,
    required this.team2Name,
    required this.team2ShortName,
    required this.team2Logo,
    required this.score,
    required this.colorRight,
    required this.colorLeft,
    this.additionalInfo,
    this.matchStatus = "FINAL",
    Key? key,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Container(
        constraints: const BoxConstraints(minHeight: 80),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
            stops: [0.2, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Background gradients
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 1.0,
                    colors: [
                     colorRight!.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.5],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: [
                      colorLeft!.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.5],
                  ),
                ),
              ),
            ),

            // Main content
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Match status badge
                if (matchStatus != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        matchStatus!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                // Match row
                Transform.translate(
                  offset: const Offset(5, -10),
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Team 1 info
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                team1Name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                team1ShortName,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          
                          // Team 1 logo
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(team1Logo),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          
                          const SizedBox(width: 8),
                          
                          // Score
                          Text(
                            score,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          const SizedBox(width: 8),
                          
                          // Team 2 logo
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(team2Logo),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          
                          // Team 2 info
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                team2Name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                team2ShortName,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Additional info
                if (additionalInfo != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      additionalInfo!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
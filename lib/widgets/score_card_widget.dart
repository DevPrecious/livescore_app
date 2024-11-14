import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({super.key, required this.time, required this.homeTeam, required this.awayTeam, required this.homeScore, required this.awayScore});
  final String time;
  final String homeTeam;
  final String awayTeam;
  final String homeScore;
  final String awayScore;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.sports_soccer),
                Text(
                    time,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff274893),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Icon(Icons.sports_soccer),
                    Text(
                        homeTeam,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  "$homeScore - $awayScore",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff274893),
                  ),
                ),
                Column(
                  children: [
                    const Icon(Icons.sports_soccer),
                    Text(awayTeam, style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

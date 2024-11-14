import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scoreapp/controllers/leagues_controller.dart';
import 'package:scoreapp/screens/standing_screen.dart';
import 'package:scoreapp/widgets/input_search_widget.dart';
import 'package:scoreapp/widgets/league_card_widget.dart';
import 'package:scoreapp/widgets/score_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LeaguesController leaguesController = Get.put(LeaguesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's on your mind?",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              InputSearchWidget(
                hintText: 'Search match, player, team...',
                prefixIcon: Icons.search,
                controller: TextEditingController(),
              ),
              SizedBox(height: 10.h),
              Text(
                'Leagues',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 70.h,
                child: Obx(
                  () => leaguesController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: leaguesController.leagues.length,
                          separatorBuilder: (context, index) => SizedBox(width: 8.w),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(() => StandingScreen(leagueId: leaguesController.leagues[index].league.id));
                            },
                            child: LeagueCardWidget(
                              title: leaguesController.leagues[index].league.name,
                              imageUrl: leaguesController.leagues[index].league.logo,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Live Now',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff274893),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13.sp,
                        color: Color(0xff274893),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const ScoreCardWidget(
                time: "85'",
                homeTeam: "Man City",
                awayTeam: "Man Utd",
                homeScore: "3",
                awayScore: "0",
              ),
              SizedBox(height: 10.h),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Just finished',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff274893),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13.sp,
                        color: Color(0xff274893),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const ScoreCardWidget(
                time: "85'",
                homeTeam: "Aston Villa",
                awayTeam: "Arsenal",
                homeScore: "2",
                awayScore: "0",
              ),
              SizedBox(height: 10.h),
              Text(
                'Featured news',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            SizedBox(height: 10.h),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/400/200',
                        width: double.infinity,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Premier League Title Race Heats Up',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Manchester City closes gap at the top with convincing victory',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16.sp,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '2 hours ago',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}

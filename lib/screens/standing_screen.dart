import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoreapp/controllers/standing_controller.dart';

class StandingScreen extends StatefulWidget {
  const StandingScreen({super.key, required this.leagueId});
  final int leagueId;

  @override
  State<StandingScreen> createState() => _StandingScreenState();
}

class _StandingScreenState extends State<StandingScreen> {
  final standingController = Get.put(StandingController());

  @override
  void initState() {
    super.initState();
    standingController.getStanding(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Standing')),
      body: Obx(
        () => standingController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Pos')),
                      DataColumn(label: Text('Team')),
                      DataColumn(label: Text('P')),
                      DataColumn(label: Text('W')),
                      DataColumn(label: Text('D')),
                      DataColumn(label: Text('L')),
                      DataColumn(label: Text('GF')),
                      DataColumn(label: Text('GA')),
                      DataColumn(label: Text('GD')),
                      DataColumn(label: Text('Pts')),
                    ],
                    rows: standingController.standings.map((team) {
                      return DataRow(cells: [
                        DataCell(Text('${team.rank}')),
                        DataCell(Text(team.team.name)),
                        DataCell(Text('${team.all.played}')),
                        DataCell(Text('${team.all.win}')),
                        DataCell(Text('${team.all.draw}')),
                        DataCell(Text('${team.all.lose}')),
                        DataCell(Text('${team.all.goals.forGoals}')),
                        DataCell(Text('${team.all.goals.against}')),
                        DataCell(Text('${team.goalsDiff}')),
                        DataCell(Text('${team.points}')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
      ),
    );
  }
}

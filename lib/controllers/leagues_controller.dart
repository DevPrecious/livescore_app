import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/leagues_model.dart';

class LeaguesController extends GetxController {
  final apiService = ApiService();
  final leagues = <LeaguesModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    getLeagues();
    super.onInit();
  }

  Future<void> getLeagues() async {
    try {
      isLoading.value = true;
      final response = await apiService.get('leagues');
      final List<dynamic> leaguesData = response['response'];
      
      print('Total leagues received: ${leaguesData.length}');
      print('First league name: ${leaguesData.first['league']['name']}');
      
      leagues.value = leaguesData
          .map((leagueJson) => LeaguesModel.fromJson(leagueJson))
          .toList();
      
      print('Leagues list length after parsing: ${leagues.length}');
    } catch (e) {
      print('Error fetching leagues: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

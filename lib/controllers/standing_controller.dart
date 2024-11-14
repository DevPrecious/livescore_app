import 'package:get/get.dart';
import 'package:scoreapp/models/standing_model.dart';
import 'package:scoreapp/services/api_service.dart';

class StandingController extends GetxController {
  final standings = RxList<Standing>();
  final apiService = ApiService();
  final isLoading = true.obs;


  Future<void> getStanding(int leagueId) async {
    try {
      isLoading.value = true;
      final response = await apiService.get('standings?league=$leagueId&season=2022');
      if (response != null) {
        standings.value = StandingModel.fromJson(response['response'][0]).league.standings[0];
      }
    } catch (e) {
      print('Error fetching standings: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

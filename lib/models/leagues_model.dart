class LeaguesModel {
  final League league;
  final Country country;
  final List<Season> seasons;

  LeaguesModel({
    required this.league,
    required this.country,
    required this.seasons,
  });

  factory LeaguesModel.fromJson(Map<String, dynamic> json) => LeaguesModel(
        league: League.fromJson(json['league']),
        country: Country.fromJson(json['country']),
        seasons: List<Season>.from(
            json['seasons'].map((x) => Season.fromJson(x))),
      );
}

class League {
  final int id;
  final String name;
  final String type;
  final String logo;

  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        logo: json['logo'],
      );
}

class Country {
  final String name;
  final String? code;
  final String? flag;

  Country({
    required this.name,
    this.code,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'],
        code: json['code'],
        flag: json['flag'],
      );
}

class Season {
  final int year;
  final String start;
  final String end;
  final bool current;
  final Coverage coverage;

  Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json['year'],
        start: json['start'],
        end: json['end'],
        current: json['current'],
        coverage: Coverage.fromJson(json['coverage']),
      );
}

class Coverage {
  final Fixtures fixtures;
  final bool standings;
  final bool players;
  final bool topScorers;
  final bool topAssists;
  final bool topCards;
  final bool injuries;
  final bool predictions;
  final bool odds;

  Coverage({
    required this.fixtures,
    required this.standings,
    required this.players,
    required this.topScorers,
    required this.topAssists,
    required this.topCards,
    required this.injuries,
    required this.predictions,
    required this.odds,
  });

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        fixtures: Fixtures.fromJson(json['fixtures']),
        standings: json['standings'],
        players: json['players'],
        topScorers: json['top_scorers'],
        topAssists: json['top_assists'],
        topCards: json['top_cards'],
        injuries: json['injuries'],
        predictions: json['predictions'],
        odds: json['odds'],
      );
}

class Fixtures {
  final bool events;
  final bool lineups;
  final bool statisticsFixtures;
  final bool statisticsPlayers;

  Fixtures({
    required this.events,
    required this.lineups,
    required this.statisticsFixtures,
    required this.statisticsPlayers,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        events: json['events'],
        lineups: json['lineups'],
        statisticsFixtures: json['statistics_fixtures'],
        statisticsPlayers: json['statistics_players'],
      );
} 
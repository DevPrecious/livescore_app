class StandingModel {
  final LeagueStanding league;

  StandingModel({required this.league});

  factory StandingModel.fromJson(Map<String, dynamic> json) => StandingModel(
        league: LeagueStanding.fromJson(json['league']),
      );
}

class LeagueStanding {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;
  final List<List<Standing>> standings;

  LeagueStanding({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.standings,
  });

  factory LeagueStanding.fromJson(Map<String, dynamic> json) => LeagueStanding(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        logo: json['logo'],
        flag: json['flag'],
        season: json['season'],
        standings: List<List<Standing>>.from(json['standings'].map(
            (x) => List<Standing>.from(x.map((y) => Standing.fromJson(y))))),
      );
}

class Standing {
  final int rank;
  final Team team;
  final int points;
  final int goalsDiff;
  final String group;
  final String form;
  final String status;
  final String? description;
  final Stats all;
  final Stats home;
  final Stats away;
  final String update;

  Standing({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    this.description,
    required this.all,
    required this.home,
    required this.away,
    required this.update,
  });

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        rank: json['rank'],
        team: Team.fromJson(json['team']),
        points: json['points'],
        goalsDiff: json['goalsDiff'],
        group: json['group'],
        form: json['form'],
        status: json['status'],
        description: json['description'],
        all: Stats.fromJson(json['all']),
        home: Stats.fromJson(json['home']),
        away: Stats.fromJson(json['away']),
        update: json['update'],
      );
}

class Team {
  final int id;
  final String name;
  final String logo;

  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
      );
}

class Stats {
  final int played;
  final int win;
  final int draw;
  final int lose;
  final Goals goals;

  Stats({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        played: json['played'],
        win: json['win'],
        draw: json['draw'],
        lose: json['lose'],
        goals: Goals.fromJson(json['goals']),
      );
}

class Goals {
  final int forGoals;
  final int against;

  Goals({
    required this.forGoals,
    required this.against,
  });

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        forGoals: json['for'],
        against: json['against'],
      );
} 
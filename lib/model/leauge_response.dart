// To parse this JSON data, do
//
//     final leagueResponse = leagueResponseFromJson(jsonString);

class LeagueResponse {
  bool status;
  Data data;

  LeagueResponse({
    required this.status,
    required this.data,
  });

  factory LeagueResponse.fromJson(Map<String, dynamic> json) => LeagueResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String name;
  String abbreviation;
  String seasonDisplay;
  int season;
  List<Standing> standings;

  Data({
    required this.name,
    required this.abbreviation,
    required this.seasonDisplay,
    required this.season,
    required this.standings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        abbreviation: json["abbreviation"],
        seasonDisplay: json["seasonDisplay"],
        season: json["season"],
        standings: List<Standing>.from(
            json["standings"].map((x) => Standing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "abbreviation": abbreviation,
        "seasonDisplay": seasonDisplay,
        "season": season,
        "standings": List<dynamic>.from(standings.map((x) => x.toJson())),
      };
}

class Standing {
  Team team;
  Note? note;
  List<Stat> stats;

  Standing({
    required this.team,
    this.note,
    required this.stats,
  });

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        team: Team.fromJson(json["team"]),
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team": team.toJson(),
        "note": note?.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
      };
}

class Note {
  String color;
  String description;
  int rank;

  Note({
    required this.color,
    required this.description,
    required this.rank,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        color: json["color"],
        description: json["description"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "description": description,
        "rank": rank,
      };
}

class Stat {
  Name name;
  Description displayName;
  ShortDisplayName shortDisplayName;
  Description description;
  Abbreviation abbreviation;
  Type type;
  int? value;
  String displayValue;
  String? id;
  String? summary;

  Stat({
    required this.name,
    required this.displayName,
    required this.shortDisplayName,
    required this.description,
    required this.abbreviation,
    required this.type,
    this.value,
    required this.displayValue,
    this.id,
    this.summary,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: nameValues.map[json["name"]]!,
        displayName: descriptionValues.map[json["displayName"]]!,
        shortDisplayName: shortDisplayNameValues.map[json["shortDisplayName"]]!,
        description: descriptionValues.map[json["description"]]!,
        abbreviation: abbreviationValues.map[json["abbreviation"]]!,
        type: typeValues.map[json["type"]]!,
        value: json["value"],
        displayValue: json["displayValue"],
        id: json["id"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "displayName": descriptionValues.reverse[displayName],
        "shortDisplayName": shortDisplayNameValues.reverse[shortDisplayName],
        "description": descriptionValues.reverse[description],
        "abbreviation": abbreviationValues.reverse[abbreviation],
        "type": typeValues.reverse[type],
        "value": value,
        "displayValue": displayValue,
        "id": id,
        "summary": summary,
      };
}

enum Abbreviation { A, D, F, GD, GP, L, P, PD, PPG, R, RC, TOTAL, W }

final abbreviationValues = EnumValues({
  "A": Abbreviation.A,
  "D": Abbreviation.D,
  "F": Abbreviation.F,
  "GD": Abbreviation.GD,
  "GP": Abbreviation.GP,
  "L": Abbreviation.L,
  "P": Abbreviation.P,
  "PD": Abbreviation.PD,
  "PPG": Abbreviation.PPG,
  "R": Abbreviation.R,
  "RC": Abbreviation.RC,
  "Total": Abbreviation.TOTAL,
  "W": Abbreviation.W
});

enum Description {
  DRAWS,
  GAMES_PLAYED,
  GOALS_AGAINST,
  GOALS_FOR,
  GOAL_DIFFERENCE,
  LOSSES,
  OVERALL,
  OVERALL_RECORD,
  POINTS,
  POINTS_PER_GAME,
  POINT_DEDUCTIONS,
  RANK,
  RANK_CHANGE,
  WINS
}

final descriptionValues = EnumValues({
  "Draws": Description.DRAWS,
  "Games Played": Description.GAMES_PLAYED,
  "Goals Against": Description.GOALS_AGAINST,
  "Goals For": Description.GOALS_FOR,
  "Goal Difference": Description.GOAL_DIFFERENCE,
  "Losses": Description.LOSSES,
  "Overall": Description.OVERALL,
  "Overall Record": Description.OVERALL_RECORD,
  "Points": Description.POINTS,
  "Points Per Game": Description.POINTS_PER_GAME,
  "Point Deductions": Description.POINT_DEDUCTIONS,
  "Rank": Description.RANK,
  "Rank Change": Description.RANK_CHANGE,
  "Wins": Description.WINS
});

enum Name {
  DEDUCTIONS,
  GAMES_PLAYED,
  LOSSES,
  OVERALL,
  POINTS,
  POINTS_AGAINST,
  POINTS_FOR,
  POINT_DIFFERENTIAL,
  PPG,
  RANK,
  RANK_CHANGE,
  TIES,
  WINS
}

final nameValues = EnumValues({
  "deductions": Name.DEDUCTIONS,
  "gamesPlayed": Name.GAMES_PLAYED,
  "losses": Name.LOSSES,
  "overall": Name.OVERALL,
  "points": Name.POINTS,
  "pointsAgainst": Name.POINTS_AGAINST,
  "pointsFor": Name.POINTS_FOR,
  "pointDifferential": Name.POINT_DIFFERENTIAL,
  "ppg": Name.PPG,
  "rank": Name.RANK,
  "rankChange": Name.RANK_CHANGE,
  "ties": Name.TIES,
  "wins": Name.WINS
});

enum ShortDisplayName {
  A,
  D,
  DEDUCTIONS,
  F,
  GD,
  GP,
  L,
  OVER,
  P,
  PPG,
  RANK,
  RANK_CHANGE,
  W
}

final shortDisplayNameValues = EnumValues({
  "A": ShortDisplayName.A,
  "D": ShortDisplayName.D,
  "Deductions": ShortDisplayName.DEDUCTIONS,
  "F": ShortDisplayName.F,
  "GD": ShortDisplayName.GD,
  "GP": ShortDisplayName.GP,
  "L": ShortDisplayName.L,
  "OVER": ShortDisplayName.OVER,
  "P": ShortDisplayName.P,
  "PPG": ShortDisplayName.PPG,
  "Rank": ShortDisplayName.RANK,
  "Rank Change": ShortDisplayName.RANK_CHANGE,
  "W": ShortDisplayName.W
});

enum Type {
  DEDUCTIONS,
  GAMESPLAYED,
  LOSSES,
  POINTDIFFERENTIAL,
  POINTS,
  POINTSAGAINST,
  POINTSFOR,
  PPG,
  RANK,
  RANKCHANGE,
  TIES,
  TOTAL,
  WINS
}

final typeValues = EnumValues({
  "deductions": Type.DEDUCTIONS,
  "gamesplayed": Type.GAMESPLAYED,
  "losses": Type.LOSSES,
  "pointdifferential": Type.POINTDIFFERENTIAL,
  "points": Type.POINTS,
  "pointsagainst": Type.POINTSAGAINST,
  "pointsfor": Type.POINTSFOR,
  "ppg": Type.PPG,
  "rank": Type.RANK,
  "rankchange": Type.RANKCHANGE,
  "ties": Type.TIES,
  "total": Type.TOTAL,
  "wins": Type.WINS
});

class Team {
  String id;
  String uid;
  String location;
  String name;
  String abbreviation;
  String displayName;
  String shortDisplayName;
  bool isActive;
  List<Logo> logos;
  bool isNational;

  Team({
    required this.id,
    required this.uid,
    required this.location,
    required this.name,
    required this.abbreviation,
    required this.displayName,
    required this.shortDisplayName,
    required this.isActive,
    required this.logos,
    required this.isNational,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        uid: json["uid"],
        location: json["location"],
        name: json["name"],
        abbreviation: json["abbreviation"],
        displayName: json["displayName"],
        shortDisplayName: json["shortDisplayName"],
        isActive: json["isActive"],
        logos: List<Logo>.from(json["logos"].map((x) => Logo.fromJson(x))),
        isNational: json["isNational"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "location": location,
        "name": name,
        "abbreviation": abbreviation,
        "displayName": displayName,
        "shortDisplayName": shortDisplayName,
        "isActive": isActive,
        "logos": List<dynamic>.from(logos.map((x) => x.toJson())),
        "isNational": isNational,
      };
}

class Logo {
  String href;
  int width;
  int height;
  String alt;
  List<Rel> rel;
  LastUpdated lastUpdated;

  Logo({
    required this.href,
    required this.width,
    required this.height,
    required this.alt,
    required this.rel,
    required this.lastUpdated,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        href: json["href"],
        width: json["width"],
        height: json["height"],
        alt: json["alt"],
        rel: List<Rel>.from(json["rel"].map((x) => relValues.map[x]!)),
        lastUpdated: lastUpdatedValues.map[json["lastUpdated"]]!,
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "width": width,
        "height": height,
        "alt": alt,
        "rel": List<dynamic>.from(rel.map((x) => relValues.reverse[x])),
        "lastUpdated": lastUpdatedValues.reverse[lastUpdated],
      };
}

enum LastUpdated {
  THE_20180605_T12_14_Z,
  THE_20190508_T16_07_Z,
  THE_20200716_T16_13_Z
}

final lastUpdatedValues = EnumValues({
  "2018-06-05T12:14Z": LastUpdated.THE_20180605_T12_14_Z,
  "2019-05-08T16:07Z": LastUpdated.THE_20190508_T16_07_Z,
  "2020-07-16T16:13Z": LastUpdated.THE_20200716_T16_13_Z
});

enum Rel { DEFAULT, FULL }

final relValues = EnumValues({"default": Rel.DEFAULT, "full": Rel.FULL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

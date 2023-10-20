import 'package:json_annotation/json_annotation.dart';

part 'coins_details.g.dart';

@JsonSerializable(explicitToJson: true)
class CoinDetail {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;
  String? logo;
  List<Tags>? tags;
  List<Team>? team;
  String? description;
  String? message;
  bool? openSource;
  String? startedAt;
  String? developmentStatus;
  bool? hardwareWallet;
  String? proofType;
  String? orgStructure;
  String? hashAlgorithm;

  Whitepaper? whitepaper;
  String? firstDataAt;
  String? lastDataAt;

  CoinDetail(
      {this.id,
      this.name,
      this.symbol,
      this.rank,
      this.isNew,
      this.isActive,
      this.type,
      this.logo,
      this.tags,
      this.team,
      this.description,
      this.message,
      this.openSource,
      this.startedAt,
      this.developmentStatus,
      this.hardwareWallet,
      this.proofType,
      this.orgStructure,
      this.hashAlgorithm,
      this.whitepaper,
      this.firstDataAt,
      this.lastDataAt});

  factory CoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tags {
  String? id;
  String? name;
  int? coinCounter;
  int? icoCounter;

  Tags({this.id, this.name, this.coinCounter, this.icoCounter});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Team {
  String? id;
  String? name;
  String? position;

  Team({this.id, this.name, this.position});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Stats {
  int? subscribers;
  int? contributors;
  int? stars;
  int? followers;

  Stats({this.subscribers, this.contributors, this.stars, this.followers});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Whitepaper {
  String? link;
  String? thumbnail;

  Whitepaper({this.link, this.thumbnail});

  factory Whitepaper.fromJson(Map<String, dynamic> json) =>
      _$WhitepaperFromJson(json);
  Map<String, dynamic> toJson() => _$WhitepaperToJson(this);
}

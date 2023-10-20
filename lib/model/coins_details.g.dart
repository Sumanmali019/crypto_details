// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetail _$CoinDetailFromJson(Map<String, dynamic> json) => CoinDetail(
      id: json['id'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      rank: json['rank'] as int?,
      isNew: json['isNew'] as bool?,
      isActive: json['isActive'] as bool?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: (json['team'] as List<dynamic>?)
          ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      message: json['message'] as String?,
      openSource: json['openSource'] as bool?,
      startedAt: json['startedAt'] as String?,
      developmentStatus: json['developmentStatus'] as String?,
      hardwareWallet: json['hardwareWallet'] as bool?,
      proofType: json['proofType'] as String?,
      orgStructure: json['orgStructure'] as String?,
      hashAlgorithm: json['hashAlgorithm'] as String?,
      whitepaper: json['whitepaper'] == null
          ? null
          : Whitepaper.fromJson(json['whitepaper'] as Map<String, dynamic>),
      firstDataAt: json['firstDataAt'] as String?,
      lastDataAt: json['lastDataAt'] as String?,
    );

Map<String, dynamic> _$CoinDetailToJson(CoinDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'rank': instance.rank,
      'isNew': instance.isNew,
      'isActive': instance.isActive,
      'type': instance.type,
      'logo': instance.logo,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'team': instance.team?.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'message': instance.message,
      'openSource': instance.openSource,
      'startedAt': instance.startedAt,
      'developmentStatus': instance.developmentStatus,
      'hardwareWallet': instance.hardwareWallet,
      'proofType': instance.proofType,
      'orgStructure': instance.orgStructure,
      'hashAlgorithm': instance.hashAlgorithm,
      'whitepaper': instance.whitepaper?.toJson(),
      'firstDataAt': instance.firstDataAt,
      'lastDataAt': instance.lastDataAt,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      id: json['id'] as String?,
      name: json['name'] as String?,
      coinCounter: json['coinCounter'] as int?,
      icoCounter: json['icoCounter'] as int?,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coinCounter': instance.coinCounter,
      'icoCounter': instance.icoCounter,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as String?,
      name: json['name'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      subscribers: json['subscribers'] as int?,
      contributors: json['contributors'] as int?,
      stars: json['stars'] as int?,
      followers: json['followers'] as int?,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'subscribers': instance.subscribers,
      'contributors': instance.contributors,
      'stars': instance.stars,
      'followers': instance.followers,
    };

Whitepaper _$WhitepaperFromJson(Map<String, dynamic> json) => Whitepaper(
      link: json['link'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$WhitepaperToJson(Whitepaper instance) =>
    <String, dynamic>{
      'link': instance.link,
      'thumbnail': instance.thumbnail,
    };

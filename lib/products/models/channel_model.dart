final class ChannelModel {
  final Channel? channel;
  final List<Feed>? feeds;

  ChannelModel({required this.channel, required this.feeds});

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      channel: Channel.fromJson(json['channel']),
      feeds: (json['feeds'] as List<dynamic>?)?.map((e) => Feed.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class Channel {
  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final String field1;
  final String field2;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int lastEntryId;

  Channel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.field1,
    required this.field2,
    required this.createdAt,
    required this.updatedAt,
    required this.lastEntryId,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      field1: json['field1'],
      field2: json['field2'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      lastEntryId: json['last_entry_id'],
    );
  }
}

class Feed {
  final DateTime createdAt;
  final int entryId;
  final String? field1;
  final String? field2;

  Feed({
    required this.createdAt,
    required this.entryId,
    required this.field1,
    required this.field2,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
        createdAt: DateTime.parse(json['created_at']),
        entryId: json['entry_id'],
        field1: json['field1'],
        field2: json['field2']);
  }
}

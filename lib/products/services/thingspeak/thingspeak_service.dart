import 'package:flutter_thingspeak/flutter_thingspeak.dart';
import 'package:kaybul_app/products/constants/project_constant.dart';
import 'package:kaybul_app/products/models/channel_model.dart';
import 'package:logger/logger.dart';

abstract class IThingSpeakService {
  Future<Feed?> fetchLocations(String apiKey);

  // Initialize the client
}

final class ThingSpeakService extends IThingSpeakService {
  @override
  Future<Feed?> fetchLocations(String apiKey) async {
    final FlutterThingspeakClient flutterThingspeak =
        FlutterThingspeakClient(channelID: ProjectConstant.baseChannelId, readApiKey: apiKey);

    flutterThingspeak.initialize();

    // Get data from the ThingSpeak channel
    try {
      final Map<String, dynamic> result = await flutterThingspeak.get();
      final response = ChannelModel.fromJson(result);
      if (response.feeds == null) {
        return null;
      }
      return response.feeds!.last;
    } catch (e) {
      Logger().e(e);
    }
    return null;
  }
}

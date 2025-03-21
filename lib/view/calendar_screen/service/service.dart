import 'package:dio/dio.dart';

import '../../../main.dart';
import '../../../utils/middleware/api_call_handler/api_call_handler.dart';
import 'model/scheduled_meeting_model.dart';

class CalenderService {
  static Future<List<ScheduledMeetingModel>> getScheduledMeetings({required int year,required int month}) async {
    try {
      Response response = await dioApiCall().get(apiRoutes.getScheduledMeetings,
          queryParameters: {"year": year, "month": month});
      Map data = response.data;
      if (response.statusCode == 200 && data.containsKey("data")) {
        return getScheduledMeetingsFromJson(response.data["data"]);
      } else {
        throw DioException(
            requestOptions: RequestOptions(
                data: data.containsKey("message")
                    ? data["message"]
                    : "Something went wrong,please check your connection and try again later."));
      }
    } catch (e) {
      rethrow;
    }
  }
}

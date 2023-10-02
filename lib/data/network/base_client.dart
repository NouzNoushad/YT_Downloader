import 'package:http/http.dart';
import 'package:yt_downloader/data/network/network_status_code.dart';

import 'response_handler.dart';

class BaseClient {
  Client baseClient = Client();
  Map<String, String> headers = {"Content-Type": "application/json"};

  Future<String?> getRequest(String url) async {
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode == NetworkStatusCode.ok ||
        response.statusCode == NetworkStatusCode.created) {
      return response.body;
    } else {
      NetworkHandler.handleResponse(response);
    }
    return null;
  }
}

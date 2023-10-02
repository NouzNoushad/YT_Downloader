import 'package:http/http.dart';
import 'package:yt_downloader/data/network/network_exceptions.dart';
import 'package:yt_downloader/data/network/network_status_code.dart';

class NetworkHandler {
  static handleResponse(response) => _handleResponse(response);
  static _handleResponse(Response response) {
    switch (response.statusCode) {
      case NetworkStatusCode.noContent:
        throw NoContentException(
            message: "No Content Found!",
            url: response.request?.url.toString());
      case NetworkStatusCode.partialContent:
        throw PartialContentException(
            message: "Partial Content Found",
            url: response.request?.url.toString());
      case NetworkStatusCode.badRequest:
        throw BadRequestException(
            message: "Bad Request!", url: response.request?.url.toString());
      case NetworkStatusCode.unauthorized:
        throw UnauthorizedException(
            message: "Unauthorized", url: response.request?.url.toString());
      case NetworkStatusCode.forbidden:
        throw ForbiddenException(
            message: "Forbidden Content",
            url: response.request?.url.toString());
      case NetworkStatusCode.notFound:
        throw NotFoundException(
            message: "Not Found", url: response.request?.url.toString());
      case NetworkStatusCode.invalidRequest:
        throw InvalidRequestException(
            message: "Invalid Request", url: response.request?.url.toString());
      case NetworkStatusCode.invalidData:
        throw NoContentException(
            message: "Invalid Data", url: response.request?.url.toString());
      case NetworkStatusCode.internalServerError:
        throw InternalServerErrorException(
            message: "Internal Server Error",
            url: response.request?.url.toString());
      case NetworkStatusCode.badGateway:
        throw BadGatewayException(
            message: "Bad Gateway", url: response.request?.url.toString());
      default:
        throw FetchDataException(
            message: "Unable to Fetch Data",
            url: response.request?.url.toString());
    }
  }
}

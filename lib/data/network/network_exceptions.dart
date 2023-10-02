class NetworkExceptions implements Exception {
  final String? message;
  final String? url;
  final String? prefix;

  NetworkExceptions({required this.message, required this.url, this.prefix});
}

class NoContentException extends NetworkExceptions {
  NoContentException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'No Content');
}

class PartialContentException extends NetworkExceptions {
  PartialContentException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Partial Content');
}

class BadRequestException extends NetworkExceptions {
  BadRequestException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Bad Request');
}

class UnauthorizedException extends NetworkExceptions {
  UnauthorizedException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Unauthorized');
}

class ForbiddenException extends NetworkExceptions {
  ForbiddenException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Forbidden');
}

class InvalidDataException extends NetworkExceptions {
  InvalidDataException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Invalid Data');
}

class NotFoundException extends NetworkExceptions {
  NotFoundException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Not Found');
}

class InvalidRequestException extends NetworkExceptions {
  InvalidRequestException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Invalid Request');
}

class InternalServerErrorException extends NetworkExceptions {
  InternalServerErrorException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Internal Server Error');
}

class BadGatewayException extends NetworkExceptions {
  BadGatewayException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Bad Gateway');
}

class FetchDataException extends NetworkExceptions {
  FetchDataException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Unable to Fetch Data');
}

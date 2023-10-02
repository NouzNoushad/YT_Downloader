class VideoResponseModel {
  String? _status;
  Response? _response;

  VideoResponseModel({String? status, Response? response}) {
    if (status != null) {
      _status = status;
    }
    if (response != null) {
      _response = response;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  Response? get response => _response;
  set response(Response? response) => _response = response;

  VideoResponseModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    if (_response != null) {
      data['response'] = _response!.toJson();
    }
    return data;
  }
}

class Response {
  String? _title;
  String? _description;
  String? _videoUrl;
  String? _videoId;
  String? _videoLength;
  String? _viewCount;
  String? _category;
  String? _publishDate;
  String? _channelName;
  int? _subscriberCount;
  List<Thumbnails>? _thumbnails;
  String? _channelUrl;
  List<Videos>? _videos;
  List<Audios>? _audios;

  Response(
      {String? title,
      String? description,
      String? videoUrl,
      String? videoId,
      String? videoLength,
      String? viewCount,
      String? category,
      String? publishDate,
      String? channelName,
      int? subscriberCount,
      List<Thumbnails>? thumbnails,
      String? channelUrl,
      List<Videos>? videos,
      List<Audios>? audios}) {
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (videoUrl != null) {
      _videoUrl = videoUrl;
    }
    if (videoId != null) {
      _videoId = videoId;
    }
    if (videoLength != null) {
      _videoLength = videoLength;
    }
    if (viewCount != null) {
      _viewCount = viewCount;
    }
    if (category != null) {
      _category = category;
    }
    if (publishDate != null) {
      _publishDate = publishDate;
    }
    if (channelName != null) {
      _channelName = channelName;
    }
    if (subscriberCount != null) {
      _subscriberCount = subscriberCount;
    }
    if (thumbnails != null) {
      _thumbnails = thumbnails;
    }
    if (channelUrl != null) {
      _channelUrl = channelUrl;
    }
    if (videos != null) {
      _videos = videos;
    }
    if (audios != null) {
      _audios = audios;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get videoUrl => _videoUrl;
  set videoUrl(String? videoUrl) => _videoUrl = videoUrl;
  String? get videoId => _videoId;
  set videoId(String? videoId) => _videoId = videoId;
  String? get videoLength => _videoLength;
  set videoLength(String? videoLength) => _videoLength = videoLength;
  String? get viewCount => _viewCount;
  set viewCount(String? viewCount) => _viewCount = viewCount;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get publishDate => _publishDate;
  set publishDate(String? publishDate) => _publishDate = publishDate;
  String? get channelName => _channelName;
  set channelName(String? channelName) => _channelName = channelName;
  int? get subscriberCount => _subscriberCount;
  set subscriberCount(int? subscriberCount) =>
      _subscriberCount = subscriberCount;
  List<Thumbnails>? get thumbnails => _thumbnails;
  set thumbnails(List<Thumbnails>? thumbnails) => _thumbnails = thumbnails;
  String? get channelUrl => _channelUrl;
  set channelUrl(String? channelUrl) => _channelUrl = channelUrl;
  List<Videos>? get videos => _videos;
  set videos(List<Videos>? videos) => _videos = videos;
  List<Audios>? get audios => _audios;
  set audios(List<Audios>? audios) => _audios = audios;

  Response.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _description = json['description'];
    _videoUrl = json['videoUrl'];
    _videoId = json['videoId'];
    _videoLength = json['videoLength'];
    _viewCount = json['viewCount'];
    _category = json['category'];
    _publishDate = json['publishDate'];
    _channelName = json['channelName'];
    _subscriberCount = json['subscriberCount'];
    if (json['thumbnails'] != null) {
      _thumbnails = <Thumbnails>[];
      json['thumbnails'].forEach((v) {
        _thumbnails!.add(Thumbnails.fromJson(v));
      });
    }
    _channelUrl = json['channelUrl'];
    if (json['videos'] != null) {
      _videos = <Videos>[];
      json['videos'].forEach((v) {
        _videos!.add(Videos.fromJson(v));
      });
    }
    if (json['audios'] != null) {
      _audios = <Audios>[];
      json['audios'].forEach((v) {
        _audios!.add(Audios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['description'] = _description;
    data['videoUrl'] = _videoUrl;
    data['videoId'] = _videoId;
    data['videoLength'] = _videoLength;
    data['viewCount'] = _viewCount;
    data['category'] = _category;
    data['publishDate'] = _publishDate;
    data['channelName'] = _channelName;
    data['subscriberCount'] = _subscriberCount;
    if (_thumbnails != null) {
      data['thumbnails'] = _thumbnails!.map((v) => v.toJson()).toList();
    }
    data['channelUrl'] = _channelUrl;
    if (_videos != null) {
      data['videos'] = _videos!.map((v) => v.toJson()).toList();
    }
    if (_audios != null) {
      data['audios'] = _audios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thumbnails {
  String? _url;
  int? _width;
  int? _height;

  Thumbnails({String? url, int? width, int? height}) {
    if (url != null) {
      _url = url;
    }
    if (width != null) {
      _width = width;
    }
    if (height != null) {
      _height = height;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  int? get width => _width;
  set width(int? width) => _width = width;
  int? get height => _height;
  set height(int? height) => _height = height;

  Thumbnails.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _width = json['width'];
    _height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = _url;
    data['width'] = _width;
    data['height'] = _height;
    return data;
  }
}

class Videos {
  String? _quality;
  int? _width;
  int? _height;
  String? _url;
  String? _contentLength;
  String? _videoFormat;
  bool? _hasAudio;
  int? _fps;

  Videos(
      {String? quality,
      int? width,
      int? height,
      String? url,
      String? contentLength,
      String? videoFormat,
      bool? hasAudio,
      int? fps}) {
    if (quality != null) {
      _quality = quality;
    }
    if (width != null) {
      _width = width;
    }
    if (height != null) {
      _height = height;
    }
    if (url != null) {
      _url = url;
    }
    if (contentLength != null) {
      _contentLength = contentLength;
    }
    if (videoFormat != null) {
      _videoFormat = videoFormat;
    }
    if (hasAudio != null) {
      _hasAudio = hasAudio;
    }
    if (fps != null) {
      _fps = fps;
    }
  }

  String? get quality => _quality;
  set quality(String? quality) => _quality = quality;
  int? get width => _width;
  set width(int? width) => _width = width;
  int? get height => _height;
  set height(int? height) => _height = height;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get contentLength => _contentLength;
  set contentLength(String? contentLength) => _contentLength = contentLength;
  String? get videoFormat => _videoFormat;
  set videoFormat(String? videoFormat) => _videoFormat = videoFormat;
  bool? get hasAudio => _hasAudio;
  set hasAudio(bool? hasAudio) => _hasAudio = hasAudio;
  int? get fps => _fps;
  set fps(int? fps) => _fps = fps;

  Videos.fromJson(Map<String, dynamic> json) {
    _quality = json['quality'];
    _width = json['width'];
    _height = json['height'];
    _url = json['url'];
    _contentLength = json['contentLength'];
    _videoFormat = json['video_format'];
    _hasAudio = json['hasAudio'];
    _fps = json['fps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quality'] = _quality;
    data['width'] = _width;
    data['height'] = _height;
    data['url'] = _url;
    data['contentLength'] = _contentLength;
    data['video_format'] = _videoFormat;
    data['hasAudio'] = _hasAudio;
    data['fps'] = _fps;
    return data;
  }
}

class Audios {
  String? _quality;
  String? _url;
  String? _contentLength;
  String? _audioFormat;

  Audios(
      {String? quality,
      String? url,
      String? contentLength,
      String? audioFormat}) {
    if (quality != null) {
      _quality = quality;
    }
    if (url != null) {
      _url = url;
    }
    if (contentLength != null) {
      _contentLength = contentLength;
    }
    if (audioFormat != null) {
      _audioFormat = audioFormat;
    }
  }

  String? get quality => _quality;
  set quality(String? quality) => _quality = quality;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get contentLength => _contentLength;
  set contentLength(String? contentLength) => _contentLength = contentLength;
  String? get audioFormat => _audioFormat;
  set audioFormat(String? audioFormat) => _audioFormat = audioFormat;

  Audios.fromJson(Map<String, dynamic> json) {
    _quality = json['quality'];
    _url = json['url'];
    _contentLength = json['contentLength'];
    _audioFormat = json['audio_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quality'] = _quality;
    data['url'] = _url;
    data['contentLength'] = _contentLength;
    data['audio_format'] = _audioFormat;
    return data;
  }
}

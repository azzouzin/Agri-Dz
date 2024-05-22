import 'detial_dises.dart';

class Dises {
  String? accessToken;
  String? modelVersion;
  dynamic customId;
  Input? input;
  Result? result;
  String? status;
  bool? slaCompliantClient;
  bool? slaCompliantSystem;
  double? created;
  double? completed;

  Dises(
      {this.accessToken,
      this.modelVersion,
      this.customId,
      this.input,
      this.result,
      this.status,
      this.slaCompliantClient,
      this.slaCompliantSystem,
      this.created,
      this.completed});

  Dises.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    modelVersion = json["model_version"];
    customId = json["custom_id"];
    input = json["input"] == null ? null : Input.fromJson(json["input"]);
    result = json["result"] == null ? null : Result.fromJson(json["result"]);
    status = json["status"];
    slaCompliantClient = json["sla_compliant_client"];
    slaCompliantSystem = json["sla_compliant_system"];
    created = json["created"];
    completed = json["completed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["model_version"] = modelVersion;
    _data["custom_id"] = customId;
    if (input != null) {
      _data["input"] = input?.toJson();
    }
    if (result != null) {
      _data["result"] = result?.toJson();
    }
    _data["status"] = status;
    _data["sla_compliant_client"] = slaCompliantClient;
    _data["sla_compliant_system"] = slaCompliantSystem;
    _data["created"] = created;
    _data["completed"] = completed;
    return _data;
  }
}

class Result {
  IsPlant? isPlant;
  IsHealthy? isHealthy;
  Disease? disease;

  Result({this.isPlant, this.isHealthy, this.disease});

  Result.fromJson(Map<String, dynamic> json) {
    isPlant =
        json["is_plant"] == null ? null : IsPlant.fromJson(json["is_plant"]);
    isHealthy = json["is_healthy"] == null
        ? null
        : IsHealthy.fromJson(json["is_healthy"]);
    disease =
        json["disease"] == null ? null : Disease.fromJson(json["disease"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (isPlant != null) {
      _data["is_plant"] = isPlant?.toJson();
    }
    if (isHealthy != null) {
      _data["is_healthy"] = isHealthy?.toJson();
    }
    if (disease != null) {
      _data["disease"] = disease?.toJson();
    }
    return _data;
  }
}

class Disease {
  List<Suggestions>? suggestions;

  Disease({this.suggestions});

  Disease.fromJson(Map<String, dynamic> json) {
    suggestions = json["suggestions"] == null
        ? null
        : (json["suggestions"] as List)
            .map((e) => Suggestions.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (suggestions != null) {
      _data["suggestions"] = suggestions?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Suggestions {
  String? id;
  String? name;
  double? probability;
  List<SimilarImages>? similarImages;
  bool? redundant;
  DisesDetails? details;

  Suggestions(
      {this.id,
      this.name,
      this.probability,
      this.similarImages,
      this.redundant,
      this.details});

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    probability = json["probability"];
    similarImages = json["similar_images"] == null
        ? null
        : (json["similar_images"] as List)
            .map((e) => SimilarImages.fromJson(e))
            .toList();
    redundant = json["redundant"];
    details =
        json["details"] == null ? null : DisesDetails.fromJson(json["details"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["probability"] = probability;
    if (similarImages != null) {
      _data["similar_images"] = similarImages?.map((e) => e.toJson()).toList();
    }
    _data["redundant"] = redundant;
    if (details != null) {
      _data["details"] = details?.toJson();
    }
    return _data;
  }
}

class SimilarImages {
  String? id;
  String? url;
  String? licenseName;
  String? licenseUrl;
  String? citation;
  double? similarity;
  String? urlSmall;

  SimilarImages(
      {this.id,
      this.url,
      this.licenseName,
      this.licenseUrl,
      this.citation,
      this.similarity,
      this.urlSmall});

  SimilarImages.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
    licenseName = json["license_name"];
    licenseUrl = json["license_url"];
    citation = json["citation"];
    similarity = json["similarity"];
    urlSmall = json["url_small"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["url"] = url;
    _data["license_name"] = licenseName;
    _data["license_url"] = licenseUrl;
    _data["citation"] = citation;
    _data["similarity"] = similarity;
    _data["url_small"] = urlSmall;
    return _data;
  }
}

class IsHealthy {
  double? probability;
  bool? binary;
  double? threshold;

  IsHealthy({this.probability, this.binary, this.threshold});

  IsHealthy.fromJson(Map<String, dynamic> json) {
    probability = json["probability"];
    binary = json["binary"];
    threshold = json["threshold"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["probability"] = probability;
    _data["binary"] = binary;
    _data["threshold"] = threshold;
    return _data;
  }
}

class IsPlant {
  double? probability;
  bool? binary;
  double? threshold;

  IsPlant({this.probability, this.binary, this.threshold});

  IsPlant.fromJson(Map<String, dynamic> json) {
    probability = json["probability"];
    binary = json["binary"];
    threshold = json["threshold"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["probability"] = probability;
    _data["binary"] = binary;
    _data["threshold"] = threshold;
    return _data;
  }
}

class Input {
  double? latitude;
  double? longitude;
  String? health;
  bool? similarImages;
  List<String>? images;
  String? datetime;

  Input(
      {this.latitude,
      this.longitude,
      this.health,
      this.similarImages,
      this.images,
      this.datetime});

  Input.fromJson(Map<String, dynamic> json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
    health = json["health"];
    similarImages = json["similar_images"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    datetime = json["datetime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["health"] = health;
    _data["similar_images"] = similarImages;
    if (images != null) {
      _data["images"] = images;
    }
    _data["datetime"] = datetime;
    return _data;
  }
}

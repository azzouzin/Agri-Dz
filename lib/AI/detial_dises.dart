class DisesDetails {
  String? localName;
  String? description;
  String? url;
  Treatment? treatment;
  List<dynamic>? classification;
  List<String>? commonNames;
  dynamic cause;
  String? language;
  String? entityId;

  DisesDetails(
      {this.localName,
      this.description,
      this.url,
      this.treatment,
      this.classification,
      this.commonNames,
      this.cause,
      this.language,
      this.entityId});

  DisesDetails.fromJson(Map<String, dynamic> json) {
    localName = json["local_name"];
    description = json["description"];
    url = json["url"];
    treatment = json["treatment"] == null
        ? null
        : Treatment.fromJson(json["treatment"]);
    classification = json["classification"] ?? [];
    commonNames = json["common_names"] == null
        ? null
        : List<String>.from(json["common_names"]);
    cause = json["cause"];
    language = json["language"];
    entityId = json["entity_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["local_name"] = localName;
    _data["description"] = description;
    _data["url"] = url;
    if (treatment != null) {
      _data["treatment"] = treatment?.toJson();
    }
    if (classification != null) {
      _data["classification"] = classification;
    }
    if (commonNames != null) {
      _data["common_names"] = commonNames;
    }
    _data["cause"] = cause;
    _data["language"] = language;
    _data["entity_id"] = entityId;
    return _data;
  }
}

class Treatment {
  List<String>? biological;
  List<String>? prevention;

  Treatment({this.biological, this.prevention});

  Treatment.fromJson(Map<String, dynamic> json) {
    biological = json["biological"] == null
        ? null
        : List<String>.from(json["biological"]);
    prevention = json["prevention"] == null
        ? null
        : List<String>.from(json["prevention"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (biological != null) {
      _data["biological"] = biological;
    }
    if (prevention != null) {
      _data["prevention"] = prevention;
    }
    return _data;
  }
}

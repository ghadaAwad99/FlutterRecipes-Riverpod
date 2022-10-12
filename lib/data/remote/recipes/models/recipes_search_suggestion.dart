import 'dart:convert';

List<SearchSuggestions> searchSuggestionFromJson(List<dynamic> str) => List<SearchSuggestions>.from((str).map((x) => SearchSuggestions.fromJson(x)));

String searchSuggestionToJson(List<SearchSuggestions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchSuggestions {
  SearchSuggestions({
    this.id,
    this.title,
    this.imageType,
  });

  int? id;
  String? title;
  String? imageType;

  factory SearchSuggestions.fromJson(Map<String, dynamic> json) => SearchSuggestions(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    imageType: json["imageType"] == null ? null : json["imageType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "imageType": imageType == null ? null : imageType,
  };
}

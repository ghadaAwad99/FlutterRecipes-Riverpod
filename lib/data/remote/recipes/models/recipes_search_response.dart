// To parse this JSON data, do
//
//     final recipesSearchResponse = recipesSearchResponseFromJson(jsonString);

import 'dart:convert';

RecipesSearchResponse recipesSearchResponseFromJson(String str) => RecipesSearchResponse.fromJson(json.decode(str));

class RecipesSearchResponse {
  RecipesSearchResponse({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  List<Result>? results;
  int? offset;
  int? number;
  int? totalResults;

  factory RecipesSearchResponse.fromJson(Map<String, dynamic> json) => RecipesSearchResponse(
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    offset: json["offset"] == null ? null : json["offset"],
    number: json["number"] == null ? null : json["number"],
    totalResults: json["totalResults"] == null ? null : json["totalResults"],
  );

}

class Result {
  Result({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.analyzedInstructions,
    this.spoonacularSourceUrl,
    this.author,
  });

  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  Gaps? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  Author? creditsText;
  String? license;
  SourceName? sourceName;
  double? pricePerServing;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  ImageType? imageType;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<dynamic>? occasions;
  List<AnalyzedInstruction>? analyzedInstructions;
  String? spoonacularSourceUrl;
  Author? author;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    vegetarian: json["vegetarian"] == null ? null : json["vegetarian"],
    vegan: json["vegan"] == null ? null : json["vegan"],
    glutenFree: json["glutenFree"] == null ? null : json["glutenFree"],
    dairyFree: json["dairyFree"] == null ? null : json["dairyFree"],
    veryHealthy: json["veryHealthy"] == null ? null : json["veryHealthy"],
    cheap: json["cheap"] == null ? null : json["cheap"],
    veryPopular: json["veryPopular"] == null ? null : json["veryPopular"],
    sustainable: json["sustainable"] == null ? null : json["sustainable"],
    lowFodmap: json["lowFodmap"] == null ? null : json["lowFodmap"],
    weightWatcherSmartPoints: json["weightWatcherSmartPoints"] == null ? null : json["weightWatcherSmartPoints"],
    gaps: json["gaps"] == null ? null : gapsValues.map?[json["gaps"]],
    preparationMinutes: json["preparationMinutes"] == null ? null : json["preparationMinutes"],
    cookingMinutes: json["cookingMinutes"] == null ? null : json["cookingMinutes"],
    aggregateLikes: json["aggregateLikes"] == null ? null : json["aggregateLikes"],
    healthScore: json["healthScore"] == null ? null : json["healthScore"],
    creditsText: json["creditsText"] == null ? null : authorValues.map?[json["creditsText"]],
    license: json["license"] == null ? null : json["license"],
    sourceName: json["sourceName"] == null ? null : sourceNameValues.map?[json["sourceName"]],
    pricePerServing: json["pricePerServing"] == null ? null : json["pricePerServing"].toDouble(),
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    readyInMinutes: json["readyInMinutes"] == null ? null : json["readyInMinutes"],
    servings: json["servings"] == null ? null : json["servings"],
    sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
    image: json["image"] == null ? null : json["image"],
    imageType: json["imageType"] == null ? null : imageTypeValues.map?[json["imageType"]],
    summary: json["summary"] == null ? null : json["summary"],
    cuisines: json["cuisines"] == null ? null : List<dynamic>.from(json["cuisines"].map((x) => x)),
    dishTypes: json["dishTypes"] == null ? null : List<String>.from(json["dishTypes"].map((x) => x)),
    diets: json["diets"] == null ? null : List<String>.from(json["diets"].map((x) => x)),
    occasions: json["occasions"] == null ? null : List<dynamic>.from(json["occasions"].map((x) => x)),
    analyzedInstructions: json["analyzedInstructions"] == null ? null : List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    spoonacularSourceUrl: json["spoonacularSourceUrl"] == null ? null : json["spoonacularSourceUrl"],
    author: json["author"] == null ? null : authorValues.map?[json["author"]],
  );
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String? name;
  List<Step>? steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"] == null ? null : json["name"],
    steps: json["steps"] == null ? null : List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );
}

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  int? number;
  String? step;
  List<Ent>? ingredients;
  List<Ent>? equipment;
  Length? length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"] == null ? null : json["number"],
    step: json["step"] == null ? null : json["step"],
    ingredients: json["ingredients"] == null ? null : List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    equipment: json["equipment"] == null ? null : List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
    length: json["length"] == null ? null : Length.fromJson(json["length"]),
  );

}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  int? id;
  String? name;
  String? localizedName;
  String? image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    localizedName: json["localizedName"] == null ? null : json["localizedName"],
    image: json["image"] == null ? null : json["image"],
  );

}

class Length {
  Length({
    this.number,
    this.unit,
  });

  int? number;
  String? unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    number: json["number"] == null ? null : json["number"],
    unit: json["unit"] == null ? null : json["unit"],
  );
}

enum Author { FOODISTA_COM_THE_COOKING_ENCYCLOPEDIA_EVERYONE_CAN_EDIT, FOODISTA_COM, BECAUSE_I_LIKE_CHOCOLATE }

final authorValues = EnumValues({
  "Because I Like Chocolate ": Author.BECAUSE_I_LIKE_CHOCOLATE,
  "foodista.com": Author.FOODISTA_COM,
  "Foodista.com – The Cooking Encyclopedia Everyone Can Edit": Author.FOODISTA_COM_THE_COOKING_ENCYCLOPEDIA_EVERYONE_CAN_EDIT
});

enum Gaps { NO }

final gapsValues = EnumValues({
  "no": Gaps.NO
});

enum ImageType { JPG }

final imageTypeValues = EnumValues({
  "jpg": ImageType.JPG
});

enum SourceName { FOODISTA, FOODISTA_COM, SPOONACULAR }

final sourceNameValues = EnumValues({
  "Foodista": SourceName.FOODISTA,
  "foodista.com": SourceName.FOODISTA_COM,
  "spoonacular": SourceName.SPOONACULAR
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

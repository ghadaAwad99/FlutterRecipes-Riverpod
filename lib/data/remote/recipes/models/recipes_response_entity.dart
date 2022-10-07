import 'dart:convert';

RecipesResponse recipesResponseFromJson(String str) => RecipesResponse.fromJson(json.decode(str));

class RecipesResponse {
  RecipesResponse({
    this.recipes,
  });

  List<Recipe>? recipes;

  factory RecipesResponse.fromJson(Map<String, dynamic> json) => RecipesResponse(
    recipes: json["recipes"] == null ? null : List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
  );


}

class Recipe {
  Recipe({
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
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
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
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularSourceUrl,
    this.license,
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
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<String>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<String>? occasions;
  String? instructions;
  List<AnalyzedInstruction>? analyzedInstructions;
  dynamic? originalId;
  String? spoonacularSourceUrl;
  String? license;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
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
    gaps: json["gaps"] == null ? null : json["gaps"],
    preparationMinutes: json["preparationMinutes"] == null ? null : json["preparationMinutes"],
    cookingMinutes: json["cookingMinutes"] == null ? null : json["cookingMinutes"],
    aggregateLikes: json["aggregateLikes"] == null ? null : json["aggregateLikes"],
    healthScore: json["healthScore"] == null ? null : json["healthScore"],
    creditsText: json["creditsText"] == null ? null : json["creditsText"],
    sourceName: json["sourceName"] == null ? null : json["sourceName"],
    pricePerServing: json["pricePerServing"] == null ? null : json["pricePerServing"].toDouble(),
    extendedIngredients: json["extendedIngredients"] == null ? null : List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    readyInMinutes: json["readyInMinutes"] == null ? null : json["readyInMinutes"],
    servings: json["servings"] == null ? null : json["servings"],
    sourceUrl: json["sourceUrl"] == null ? null : json["sourceUrl"],
    image: json["image"] == null ? null : json["image"],
    imageType: json["imageType"] == null ? null : json["imageType"],
    summary: json["summary"] == null ? null : json["summary"],
    cuisines: json["cuisines"] == null ? null : List<String>.from(json["cuisines"].map((x) => x)),
    dishTypes: json["dishTypes"] == null ? null : List<String>.from(json["dishTypes"].map((x) => x)),
    diets: json["diets"] == null ? null : List<String>.from(json["diets"].map((x) => x)),
    occasions: json["occasions"] == null ? null : List<String>.from(json["occasions"].map((x) => x)),
    instructions: json["instructions"] == null ? null : json["instructions"],
    analyzedInstructions: json["analyzedInstructions"] == null ? null : List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    originalId: json["originalId"],
    spoonacularSourceUrl: json["spoonacularSourceUrl"] == null ? null : json["spoonacularSourceUrl"],
    license: json["license"] == null ? null : json["license"],
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
    this.temperature,
  });

  int? id;
  String? name;
  String? localizedName;
  String? image;
  Length? temperature;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    localizedName: json["localizedName"] == null ? null : json["localizedName"],
    image: json["image"] == null ? null : json["image"],
    temperature: json["temperature"] == null ? null : Length.fromJson(json["temperature"]),
  );

}

class Length {
  Length({
    this.number,
    this.unit,
  });

  num? number;
  Unit? unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    number: json["number"] == null ? null : json["number"],
    unit: json["unit"] == null ? null : unitValues.map?[json["unit"]],
  );

}

enum Unit { FAHRENHEIT, MINUTES }

final unitValues = EnumValues({
  "Fahrenheit": Unit.FAHRENHEIT,
  "minutes": Unit.MINUTES
});

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  int? id;
  String? aisle;
  String? image;
  Consistency? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    id: json["id"] == null ? null : json["id"],
    aisle: json["aisle"] == null ? null : json["aisle"],
    image: json["image"] == null ? null : json["image"],
    consistency: json["consistency"] == null ? null : consistencyValues.map?[json["consistency"]],
    name: json["name"] == null ? null : json["name"],
    nameClean: json["nameClean"] == null ? null : json["nameClean"],
    original: json["original"] == null ? null : json["original"],
    originalName: json["originalName"] == null ? null : json["originalName"],
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    unit: json["unit"] == null ? null : json["unit"],
    meta: json["meta"] == null ? null : List<String>.from(json["meta"].map((x) => x)),
    measures: json["measures"] == null ? null : Measures.fromJson(json["measures"]),
  );

}

enum Consistency { SOLID, LIQUID }

final consistencyValues = EnumValues({
  "LIQUID": Consistency.LIQUID,
  "SOLID": Consistency.SOLID
});

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric? us;
  Metric? metric;

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: json["us"] == null ? null : Metric.fromJson(json["us"]),
    metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
  );

}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  double? amount;
  String? unitShort;
  String? unitLong;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    unitShort: json["unitShort"] == null ? null : json["unitShort"],
    unitLong: json["unitLong"] == null ? null : json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
    "unitShort": unitShort == null ? null : unitShort,
    "unitLong": unitLong == null ? null : unitLong,
  };
}

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

// To parse this JSON data, do
//
//     final alimentos = alimentosFromMap(jsonString);

import 'dart:convert';

class Alimentos {
  Alimentos({
    required this.fdcId,
    required this.description,
    required this.publicationDate,
    required this.foodNutrients,
    required this.foodPortions,
    required this.dataType,
    required this.foodClass,
    required this.scientificName,
    required this.foodComponents,
    required this.foodAttributes,
    required this.nutrientConversionFactors,
    required this.inputFoods,
    required this.ndbNumber,
    required this.isHistoricalReference,
    required this.foodCategory,
  });

  int fdcId;
  String description;
  String publicationDate;
  List<FoodNutrient> foodNutrients;
  List<FoodPortion> foodPortions;
  String dataType;
  String foodClass;
  String scientificName;
  List<dynamic> foodComponents;
  List<dynamic> foodAttributes;
  List<NutrientConversionFactor> nutrientConversionFactors;
  List<dynamic> inputFoods;
  int ndbNumber;
  bool isHistoricalReference;
  Food foodCategory;

  factory Alimentos.fromJson(String str) => Alimentos.fromMap(json.decode(str));

  factory Alimentos.fromMap(Map<String, dynamic> json) => Alimentos(
        fdcId: json["fdcId"],
        description: json["description"],
        publicationDate: json["publicationDate"],
        foodNutrients: List<FoodNutrient>.from(
            json["foodNutrients"].map((x) => FoodNutrient.fromMap(x))),
        foodPortions: List<FoodPortion>.from(
            json["foodPortions"].map((x) => FoodPortion.fromMap(x))),
        dataType: json["dataType"],
        foodClass: json["foodClass"],
        scientificName: json["scientificName"],
        foodComponents:
            List<dynamic>.from(json["foodComponents"].map((x) => x)),
        foodAttributes:
            List<dynamic>.from(json["foodAttributes"].map((x) => x)),
        nutrientConversionFactors: List<NutrientConversionFactor>.from(
            json["nutrientConversionFactors"]
                .map((x) => NutrientConversionFactor.fromMap(x))),
        inputFoods: List<dynamic>.from(json["inputFoods"].map((x) => x)),
        ndbNumber: json["ndbNumber"],
        isHistoricalReference: json["isHistoricalReference"],
        foodCategory: Food.fromMap(json["foodCategory"]),
      );
}

class Food {
  Food({
    required this.id,
    required this.code,
    required this.description,
    required this.foodNutrientSource,
  });

  int id;
  String code;
  String description;
  Food? foodNutrientSource;

  factory Food.fromJson(String str) => Food.fromMap(json.decode(str));

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        foodNutrientSource: json["foodNutrientSource"] == null
            ? null
            : Food.fromMap(json["foodNutrientSource"]),
      );
}

class FoodNutrient {
  FoodNutrient({
    required this.nutrient,
    required this.type,
    required this.foodNutrientDerivation,
    required this.id,
    required this.amount,
    required this.dataPoints,
    required this.max,
    required this.min,
  });

  Nutrient nutrient;
  String type;
  Food? foodNutrientDerivation;
  int id;
  double amount;
  int dataPoints;
  double max;
  double min;

  factory FoodNutrient.fromJson(String str) =>
      FoodNutrient.fromMap(json.decode(str));

  factory FoodNutrient.fromMap(Map<String, dynamic> json) => FoodNutrient(
        nutrient: Nutrient.fromMap(json["nutrient"]),
        type: json["type"],
        foodNutrientDerivation: json["foodNutrientDerivation"] == null
            ? null
            : Food.fromMap(json["foodNutrientDerivation"]),
        id: json["id"] == null ? null : json["id"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        dataPoints: json["dataPoints"] == null ? null : json["dataPoints"],
        max: json["max"] == null ? null : json["max"].toDouble(),
        min: json["min"] == null ? null : json["min"].toDouble(),
      );
}

class Nutrient {
  Nutrient({
    required this.id,
    required this.number,
    required this.name,
    required this.rank,
    required this.unitName,
  });

  int id;
  String number;
  String name;
  int rank;
  String unitName;

  factory Nutrient.fromJson(String str) => Nutrient.fromMap(json.decode(str));

  factory Nutrient.fromMap(Map<String, dynamic> json) => Nutrient(
        id: json["id"],
        number: json["number"],
        name: json["name"],
        rank: json["rank"],
        unitName: json["unitName"],
      );
}

class FoodPortion {
  FoodPortion({
    required this.id,
    required this.gramWeight,
    required this.sequenceNumber,
    required this.amount,
    required this.modifier,
    required this.measureUnit,
  });

  int id;
  int gramWeight;
  int sequenceNumber;
  int amount;
  String modifier;
  MeasureUnit measureUnit;

  factory FoodPortion.fromJson(String str) =>
      FoodPortion.fromMap(json.decode(str));

  factory FoodPortion.fromMap(Map<String, dynamic> json) => FoodPortion(
        id: json["id"],
        gramWeight: json["gramWeight"].toInt(),
        sequenceNumber: json["sequenceNumber"],
        amount: json["amount"].toInt(),
        modifier: json["modifier"],
        measureUnit: MeasureUnit.fromMap(json["measureUnit"]),
      );
}

class MeasureUnit {
  MeasureUnit({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  int id;
  String name;
  String abbreviation;

  factory MeasureUnit.fromJson(String str) =>
      MeasureUnit.fromMap(json.decode(str));

  factory MeasureUnit.fromMap(Map<String, dynamic> json) => MeasureUnit(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
      );
}

class NutrientConversionFactor {
  NutrientConversionFactor({
    required this.id,
    required this.proteinValue,
    required this.fatValue,
    required this.carbohydrateValue,
    required this.type,
    required this.name,
    required this.value,
  });

  int id;
  double proteinValue;
  double fatValue;
  double carbohydrateValue;
  String type;
  String name;
  double value;

  factory NutrientConversionFactor.fromJson(String str) =>
      NutrientConversionFactor.fromMap(json.decode(str));

  factory NutrientConversionFactor.fromMap(Map<String, dynamic> json) =>
      NutrientConversionFactor(
        id: json["id"],
        proteinValue: json["proteinValue"] == null
            ? null
            : json["proteinValue"].toDouble(),
        fatValue: json["fatValue"] == null ? null : json["fatValue"].toDouble(),
        carbohydrateValue: json["carbohydrateValue"] == null
            ? null
            : json["carbohydrateValue"].toDouble(),
        type: json["type"],
        name: json["name"],
        value: json["value"] == null ? null : json["value"].toDouble(),
      );
}

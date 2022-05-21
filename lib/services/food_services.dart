import 'dart:convert';

import 'package:final_pt2/models/data_food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FoodServices extends ChangeNotifier {
  final String _urlBase = 'api.nal.usda.gov';
  final String _apiKey = 'RPyHBmbTK94sStbTfcF39QIvoqkGo3X25I5g1Gnj';

  //late String propiedadesAlimentos;
  Alimentos? alimentos;

  FoodServices() {
    getService();
  }

  getService() async {
    final url = Uri.https(_urlBase, '/fdc/v1/food/173944');
    //final url = Uri.https(_urlBase, '/fdc/v1/foods/search', {'query': 'mango'});
    final respuesta = await http.get(url, headers: {'X-Api-Key': _apiKey});
    final alimento = jsonDecode(respuesta.body);
    //final nutrientes = FoodNutrient.fromJson(respuesta.body);
    //propiedadesAlimentos = alimento.description;
    alimentos = Alimentos.fromMap(alimento);

    notifyListeners();
    //print(propiedadesAlimentos);
  }
}

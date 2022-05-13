import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FoodServices extends ChangeNotifier {
  final String _urlBase = 'api.nal.usda.gov';
  final String _apiKey = 'RPyHBmbTK94sStbTfcF39QIvoqkGo3X25I5g1Gnj';

  FoodServices() {
    getService();
  }
  getService() async {
    final url = Uri.https(_urlBase, '/fdc/v1/food/1102671');
    //final url = Uri.https(_urlBase, '/fdc/v1/foods/search', {'query': 'mango'});
    final respuesta = await http.get(url, headers: {'X-Api-Key': _apiKey});
    print(respuesta.body);
  }
}

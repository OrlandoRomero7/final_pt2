import 'package:final_pt2/services/food_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodDataServices = Provider.of<FoodServices>(context);
    //print(foodDataServices.alimentos?.description);
    if (foodDataServices.alimentos == null) {
      return Container(
        color: Colors.blue.shade200,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.black),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Food Data Central",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow),
      body: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/platano.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Text(
              "Platano - Porción de 100 gramos",
              style: TextStyle(fontSize: 26),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: foodDataServices.alimentos!.foodNutrients.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "${foodDataServices.alimentos!.foodNutrients[index].nutrient.name}:\t\t"
                          "${foodDataServices.alimentos!.foodNutrients[index].amount}\t\t"
                          "${foodDataServices.alimentos!.foodNutrients[index].nutrient.unitName}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0))),
                    );
                  }),
            )
          ],
        ),
      ),
    );

    //Text(foodDataServices.alimentos!.foodNutrients.length),
  }
}

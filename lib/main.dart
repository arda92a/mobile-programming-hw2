import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pet_models.dart';

final List<Pet> myPets = [
  Dog(name: 'Buddy'),
  Cat(name: 'Mia'),
  Bird(name: 'Tweety'),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Pet Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        cardTheme: const CardThemeData(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  IconData _getPetIcon(Pet pet) {
    if (pet is Dog) {
      return FontAwesomeIcons.dog;
    } else if (pet is Cat) {
      return FontAwesomeIcons.cat;
    } else if (pet is Bird) {
      return FontAwesomeIcons.dove;
    }
    return Icons.question_mark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Smart Pet Manager',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myPets.length,
              itemBuilder: (context, index) {
                final pet = myPets[index];

                return Card(
                  child: ListTile(
                    leading: Icon(
                      _getPetIcon(pet),
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    title: Text(
                      '${pet.runtimeType}: ${pet.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      pet.makeSound(),
                      style: const TextStyle(fontStyle: FontStyle.normal),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Total Pets: ${Pet.totalPets}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

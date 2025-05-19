import 'package:flutter/material.dart';
import 'models/card.dart';

void main() {
  runApp(JeuCartesApp());
}

class JeuCartesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu de Cartes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JeuCartesPage(),
    );
  }
}

class JeuCartesPage extends StatefulWidget {
  @override
  _JeuCartesPageState createState() => _JeuCartesPageState();
}

class _JeuCartesPageState extends State<JeuCartesPage> {
  List<List<Carte>> cartes = List.generate(3, (i) => List.generate(3, (j) {
    int valeur = (i * 3 + j + 1) % 9;
    return Carte(
      valeur: valeur == 0 ? 1 : valeur, // 0 devient 1
      famille: Famille.carreau,
    );
  }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de Cartes'),
      ),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: List.generate(3, (i) {
            return TableRow(
              children: List.generate(3, (j) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (i == 1 && j == 1) {
                        // Clic sur la carte du centre : changer toutes les valeurs
                        for (var row in cartes) {
                          for (var carte in row) {
                            if (carte.valeur == 1) {
                              carte.valeur = 7;
                            } else {
                              carte.valeur = (carte.valeur % 8) + 1;
                            }
                          }
                        }
                      } else {
                        // Clic ailleurs : changer la famille
                        cartes[i][j].changerFamille();
                      }
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        cartes[i][j].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}

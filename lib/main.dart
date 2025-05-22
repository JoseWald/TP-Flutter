import 'package:flutter/material.dart';

void main() {
  runApp(const CardGameApp());
}

class CardGameApp extends StatelessWidget {
  const CardGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CardGameScreen(),
    );
  }
}

class CardGameScreen extends StatefulWidget {
  const CardGameScreen({super.key});

  @override
  State<CardGameScreen> createState() => _CardGameScreenState();
}

class _CardGameScreenState extends State<CardGameScreen> {
  final List<Map<String, dynamic>> initialCards = [
    {'id': 'CO', 'value': 1, 'suit': 'carreau'},
    {'id': 'C1', 'value': 2, 'suit': 'carreau'},
    {'id': 'C2', 'value': 3, 'suit': 'carreau'},
    {'id': 'C3', 'value': 4, 'suit': 'carreau'},
    {'id': 'C4', 'value': 5, 'suit': 'carreau'},
    {'id': 'C5', 'value': 6, 'suit': 'carreau'},
    {'id': 'C7', 'value': 7, 'suit': 'carreau'},
    {'id': 'C8', 'value': 8, 'suit': 'carreau'},
  ];

  List<Map<String, dynamic>> cards = [];

  @override
  void initState() {
    super.initState();
    cards = List.from(initialCards);
  }

  void handleCenterCellClick() {
    setState(() {
      for (var card in cards) {
        if (card['value'] == 1) {
          card['value'] = 7;
        } else {
          card['value'] = card['value'] + 1;
        }
      }
    });
  }

  void handleCardClick(int index) {
    setState(() {
      switch (cards[index]['suit']) {
        case 'carreau':
          cards[index]['suit'] = 'coeur';
          break;
        case 'coeur':
          cards[index]['suit'] = 'pique';
          break;
        case 'pique':
          cards[index]['suit'] = 'trèfle';
          break;
        case 'trèfle':
          cards[index]['suit'] = 'carreau';
          break;
      }
    });
  }

  String getSuitSymbol(String suit) {
    switch (suit) {
      case 'carreau':
        return '♦';
      case 'coeur':
        return '♥';
      case 'pique':
        return '♠';
      case 'trèfle':
        return '♣';
      default:
        return '?';
    }
  }

  Color getSuitColor(String suit) {
    return (suit == 'carreau' || suit == 'coeur') ? Colors.red : Colors.black;
  }

  Widget _buildCardCell(int cardIndex) {
    final card = cards[cardIndex];
    final value = card['value'];
    final suit = card['suit'];
    final suitSymbol = getSuitSymbol(suit);
    final suitColor = getSuitColor(suit);

    return GestureDetector(
      onTap: () => handleCardClick(cardIndex),
      child: Container(
        height: 120,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '$value\n$suitSymbol',
                  style: TextStyle(
                    color: suitColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    '$value\n$suitSymbol',
                    style: TextStyle(
                      color: suitColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterCell() {
    return GestureDetector(
      onTap: handleCenterCellClick,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 120,
        color: Colors.grey[200],
        child: const Center(
          child: Text('Click to increase values'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Game'),
      ),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                _buildCardCell(0),
                _buildCardCell(1),
                _buildCardCell(2),
              ],
            ),
            TableRow(
              children: [
                _buildCardCell(6),
                _buildCenterCell(),
                _buildCardCell(3),
              ],
            ),
            TableRow(
              children: [
                _buildCardCell(7),
                _buildCardCell(5),
                _buildCardCell(4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum Famille { carreau, coeur, pique, trefle }

class Carte {
  int valeur;
  Famille famille;

  Carte({required this.valeur, required this.famille});

  void changerFamille() {
    switch (famille) {
      case Famille.carreau:
        famille = Famille.coeur;
        break;
      case Famille.coeur:
        famille = Famille.pique;
        break;
      case Famille.pique:
        famille = Famille.trefle;
        break;
      case Famille.trefle:
        famille = Famille.carreau;
        break;
    }
  }

  @override
  String toString() {
    String symbole;
    switch (famille) {
      case Famille.carreau:
        symbole = '♦';
        break;
      case Famille.coeur:
        symbole = '♥';
        break;
      case Famille.pique:
        symbole = '♠';
        break;
      case Famille.trefle:
        symbole = '♣';
        break;
    }

    String valeurCarte;
    switch (valeur) {
      case 1:
        valeurCarte = 'A';
        break;
      case 11:
        valeurCarte = 'V';
        break;
      case 12:
        valeurCarte = 'D';
        break;
      case 13:
        valeurCarte = 'R';
        break;
      default:
        valeurCarte = valeur.toString();
    }

    return '$valeurCarte$symbole';
  }
}
class Student {
  final String name;
  final String cin;
  final String nomPole;
  final int finTotale;
  final int score;

  factory Student.emptyStudent() {
    return Student(
      name: "Not Available !",
      cin: "Not Available !",
      nomPole: "Not Available !",
      finTotale: 0,
      score: 0,
    );
  }

  Student({
    required this.name,
    required this.cin,
    required this.nomPole,
    required this.finTotale,
    required this.score,
  });

  factory Student.fromFireStore(Map<String, dynamic> data) {
    return Student(
      name: data['Nom'] ?? "Not Available !",
      cin: data['Cin'] ?? "Not Available",
      nomPole: data['Nompole'] ?? "Not Available",
      finTotale: data['Fintot'] ?? "Not Available",
      score: data['Score'] ?? "Not Available",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nom': name,
      'cin': cin,
      'nom_pole': nomPole,
      'fin_tot': finTotale,
      'score': score,
    };
  }
}

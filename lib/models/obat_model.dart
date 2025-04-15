class ObatModel {
  int? id; 
  String nama;
  String dosis;
  DateTime jadwal;

  ObatModel({
    this.id,
    required this.nama,
    required this.dosis,
    required this.jadwal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'dosis': dosis,
      'jadwal': jadwal.toIso8601String(), 
    };
  }

  factory ObatModel.fromMap(Map<String, dynamic> map) {
    return ObatModel(
      id: map['id'],
      nama: map['nama'],
      dosis: map['dosis'],
      jadwal: DateTime.parse(map['jadwal']),
    );
  }
}
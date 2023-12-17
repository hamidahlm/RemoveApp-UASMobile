class Casts {
  final String foto;

  Casts({required this.foto});

  factory Casts.fromJson(Map<String, dynamic> json) =>
      Casts(foto: json["foto"]);

  Map<String, dynamic> toJson() => {"foto": foto};
}

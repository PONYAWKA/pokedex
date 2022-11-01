class Pokemon {
  const Pokemon({
    this.name,
    this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json['name'] as String?,
        url: json['url'] as String?,
      );

  final String? name;
  final String? url;
}


class Movie {
/*
{
  "name": "Interestelar (2014)",
  "image": "https://lojasaraiva.vteximg.com.br/arquivos/ids/12105538/1002443202.jpg?v=637142234580400000%27%7D"
} 
*/

  String? name;
  String? image;

  Movie({
    this.name,
    this.image,
  });
  Movie.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
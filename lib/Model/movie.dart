class MoviePOJO {
  String title;
  String image;
  double rating;
  int releaseYear;
  List<String> genre;

  MoviePOJO({this.title, this.image, this.rating, this.releaseYear, this.genre});

  MoviePOJO.fromJson(Map<String, dynamic> json) {
  title = json['title'];
  image = json['image'];
  rating = json['rating'] * 1.0;
  releaseYear = json['releaseYear'];
  genre = json['genre'].cast<String>();
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['title'] = this.title;
  data['image'] = this.image;
  data['rating'] = this.rating;
  data['releaseYear'] = this.releaseYear;
  data['genre'] = this.genre;
  return data;
  }
}
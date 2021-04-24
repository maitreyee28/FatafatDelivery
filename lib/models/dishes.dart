class dishes {
  String id;
  String name;
  String restaurant;
  String price;
  String rating;
  String img;

  dishes(
      {this.id, this.name, this.restaurant, this.price, this.rating, this.img});

  dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    restaurant = json['Restaurant'];
    price = json['Price'];
    rating = json['Rating'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Restaurant'] = this.restaurant;
    data['Price'] = this.price;
    data['Rating'] = this.rating;
    data['img'] = this.img;
    return data;
  }
}

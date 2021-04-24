class nearby_restaurants {
  Location location;
  Popularity popularity;
  List<NearbyRestaurants> nearbyRestaurants;

  nearby_restaurants({this.location, this.popularity, this.nearbyRestaurants});

  nearby_restaurants.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    popularity = json['popularity'] != null
        ? new Popularity.fromJson(json['popularity'])
        : null;
    if (json['nearby_restaurants'] != null) {
      nearbyRestaurants = new List<NearbyRestaurants>();
      json['nearby_restaurants'].forEach((v) {
        nearbyRestaurants.add(new NearbyRestaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.popularity != null) {
      data['popularity'] = this.popularity.toJson();
    }
    if (this.nearbyRestaurants != null) {
      data['nearby_restaurants'] =
          this.nearbyRestaurants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String title;
  String cityName;

  Location({this.title, this.cityName});

  Location.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['city_name'] = this.cityName;
    return data;
  }
}

class Popularity {
  String popularity;
  String nightlifeIndex;
  List<String> nearbyRes;
  List<String> topCuisines;
  String popularityRes;
  String nightlifeRes;
  String subzone;
  int subzoneId;
  String city;

  Popularity(
      {this.popularity,
      this.nightlifeIndex,
      this.nearbyRes,
      this.topCuisines,
      this.popularityRes,
      this.nightlifeRes,
      this.subzone,
      this.subzoneId,
      this.city});

  Popularity.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'];
    nightlifeIndex = json['nightlife_index'];
    nearbyRes = json['nearby_res'].cast<String>();
    topCuisines = json['top_cuisines'].cast<String>();
    popularityRes = json['popularity_res'];
    nightlifeRes = json['nightlife_res'];
    subzone = json['subzone'];
    subzoneId = json['subzone_id'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['nightlife_index'] = this.nightlifeIndex;
    data['nearby_res'] = this.nearbyRes;
    data['top_cuisines'] = this.topCuisines;
    data['popularity_res'] = this.popularityRes;
    data['nightlife_res'] = this.nightlifeRes;
    data['subzone'] = this.subzone;
    data['subzone_id'] = this.subzoneId;
    data['city'] = this.city;
    return data;
  }
}

class NearbyRestaurants {
  Restaurant restaurant;

  NearbyRestaurants({this.restaurant});

  NearbyRestaurants.fromJson(Map<String, dynamic> json) {
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    return data;
  }
}

class Restaurant {
  String id;
  String name;
  String cuisines;
  int averageCostForTwo;
  int priceRange;
  UserRating userRating;
  String photosUrl;
  String menuUrl;
  String featuredImage;
  int hasOnlineDelivery;
  int isDeliveringNow;
  String storeType;

  Restaurant(
      {this.id,
      this.name,
      this.cuisines,
      this.averageCostForTwo,
      this.priceRange,
      this.userRating,
      this.photosUrl,
      this.menuUrl,
      this.featuredImage,
      this.hasOnlineDelivery,
      this.isDeliveringNow,
      this.storeType});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cuisines = json['cuisines'];
    averageCostForTwo = json['average_cost_for_two'];
    priceRange = json['price_range'];
    userRating = json['user_rating'] != null
        ? new UserRating.fromJson(json['user_rating'])
        : null;
    photosUrl = json['photos_url'];
    menuUrl = json['menu_url'];
    featuredImage = json['featured_image'];
    hasOnlineDelivery = json['has_online_delivery'];
    isDeliveringNow = json['is_delivering_now'];
    storeType = json['store_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cuisines'] = this.cuisines;
    data['average_cost_for_two'] = this.averageCostForTwo;
    data['price_range'] = this.priceRange;
    if (this.userRating != null) {
      data['user_rating'] = this.userRating.toJson();
    }
    data['photos_url'] = this.photosUrl;
    data['menu_url'] = this.menuUrl;
    data['featured_image'] = this.featuredImage;
    data['has_online_delivery'] = this.hasOnlineDelivery;
    data['is_delivering_now'] = this.isDeliveringNow;
    data['store_type'] = this.storeType;
    return data;
  }
}

class UserRating {
  String aggregateRating;
  String ratingText;
  String ratingColor;
  RatingObj ratingObj;
  int votes;

  UserRating(
      {this.aggregateRating,
      this.ratingText,
      this.ratingColor,
      this.ratingObj,
      this.votes});

  UserRating.fromJson(Map<String, dynamic> json) {
    aggregateRating = json['aggregate_rating'];
    ratingText = json['rating_text'];
    ratingColor = json['rating_color'];
    ratingObj = json['rating_obj'] != null
        ? new RatingObj.fromJson(json['rating_obj'])
        : null;
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aggregate_rating'] = this.aggregateRating;
    data['rating_text'] = this.ratingText;
    data['rating_color'] = this.ratingColor;
    if (this.ratingObj != null) {
      data['rating_obj'] = this.ratingObj.toJson();
    }
    data['votes'] = this.votes;
    return data;
  }
}

class RatingObj {
  Title title;
  BgColor bgColor;

  RatingObj({this.title, this.bgColor});

  RatingObj.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    bgColor = json['bg_color'] != null
        ? new BgColor.fromJson(json['bg_color'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.bgColor != null) {
      data['bg_color'] = this.bgColor.toJson();
    }
    return data;
  }
}

class Title {
  String text;

  Title({this.text});

  Title.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class BgColor {
  String type;
  String tint;

  BgColor({this.type, this.tint});

  BgColor.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    tint = json['tint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['tint'] = this.tint;
    return data;
  }
}

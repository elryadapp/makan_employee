
class GamesModel {
    bool? success;
    int? status;
    List<String>? message;
    List<Game>? data;

    GamesModel({this.success, this.status, this.message, this.data});

    GamesModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Game.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        _data["status"] = status;
        if(message != null) {
            _data["message"] = message;
        }
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Game {
    int? productId;
    String? name;
    String? description;
    int? price;
    String? image;

    Game({this.productId, this.name, this.description, this.price, this.image});

    Game.fromJson(Map<String, dynamic> json) {
        productId = json["product_id"];
        name = json["name"];
        description = json["description"];
        price = json["price"];
        image = json["image"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["product_id"] = productId;
        _data["name"] = name;
        _data["description"] = description;
        _data["price"] = price;
        _data["image"] = image;
        return _data;
    }
}
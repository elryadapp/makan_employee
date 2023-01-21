
class GameScanResponseModel {
    bool? success;
    int? status;
    List<String>? message;
  GamesDetails? data;

    GameScanResponseModel({this.success, this.status, this.message, this.data});

    GameScanResponseModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        data = json["data"] == null ? null : GamesDetails.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        _data["status"] = status;
        if(message != null) {
            _data["message"] = message;
        }
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class GamesDetails {
    String? name;
    int? quantity;
    int? leftQuantity;

    GamesDetails({this.name, this.quantity, this.leftQuantity});

    GamesDetails.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        quantity = json["quantity"];
        leftQuantity = json["left_quantity"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["quantity"] = quantity;
        _data["left_quantity"] = leftQuantity;
        return _data;
    }
}
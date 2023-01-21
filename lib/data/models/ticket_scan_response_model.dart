
class TicketScanResponseModel {
    bool? success;
    int? status;
    List<String>? message;
   List< TicketData>? data;

    TicketScanResponseModel({this.success, this.status, this.message, this.data});

    TicketScanResponseModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        data = json["data"] == null ? null : (json["data"] as List).map((e) => TicketData.fromJson(e)).toList();
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

class TicketData {
    String? name;
    int? quantity;

    TicketData({this.name, this.quantity});

    TicketData.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        quantity = json["quantity"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["quantity"] = quantity;
        return _data;
    }
}
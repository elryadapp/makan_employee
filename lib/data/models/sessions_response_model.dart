
class SessionScanResponseModel {
    bool? success;
    int? status;
    List<String>? message;
    SessionsDetails? data;

    SessionScanResponseModel({this.success, this.status, this.message, this.data});

    SessionScanResponseModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        data = json["data"] == null ? null : SessionsDetails.fromJson(json["data"]);
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

class SessionsDetails {
    String? name;
    int? type;
    int? hours;

    SessionsDetails({this.name, this.type, this.hours});

    SessionsDetails.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        type = json["type"];
        hours = json["hours"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["type"] = type;
        _data["hours"] = hours;
        return _data;
    }
}
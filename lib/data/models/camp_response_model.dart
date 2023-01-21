
class CampScanResponseModel {
    bool? success;
    int? status;
    List<String>? message;
  MyCampDetails? data;

    CampScanResponseModel({this.success, this.status, this.message, this.data});

    CampScanResponseModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        data = json["data"] == null ? null :  MyCampDetails.fromJson(json["data"]);
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

class MyCampDetails {
    String? name;
    String? date;

    MyCampDetails({this.name, this.date});

    MyCampDetails.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        date = json["date"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["date"] = date;
        return _data;
    }
}
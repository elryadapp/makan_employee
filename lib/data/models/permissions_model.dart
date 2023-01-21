
class PermessionsModel {
    bool? success;
    int? status;
    List<String>? message;
    PermissionData? permissionData;

    PermessionsModel({this.success, this.status, this.message, this.permissionData});

    PermessionsModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        permissionData = json["data"] == null ? null : PermissionData.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["success"] = success;
        data["status"] = status;
        if(message != null) {
            data["message"] = message;
        }
        if(permissionData != null) {
            data["data"] = permissionData?.toJson();
        }
        return data;
    }
}

class PermissionData {
    bool? tickets;
    bool? games;
    bool? sessions;
    bool? camps;

    PermissionData({this.tickets, this.games, this.sessions, this.camps});

    PermissionData.fromJson(Map<String, dynamic> json) {
        tickets = json["tickets"];
        games = json["games"];
        sessions = json["sessions"];
        camps = json["camps"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["tickets"] = tickets;
        _data["games"] = games;
        _data["sessions"] = sessions;
        _data["camps"] = camps;
        return _data;
    }
}
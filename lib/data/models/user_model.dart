
class UserModel {
    bool? success;
    int? status;
    List<String>? message;
    UserData? userData;

    UserModel({this.success, this.status, this.message, this.userData});

    UserModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        status = json["status"];
        message = json["message"] == null ? null : List<String>.from(json["message"]);
        userData = json["data"] == null ? null : UserData.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["success"] = success;
        data["status"] = status;
        if(message != null) {
            data["message"] = message;
        }
        if(userData != null) {
            data["data"] = userData?.toJson();
        }
        return data;
    }
}

class UserData {
    Employee? employee;
    String? token;

    UserData({this.employee, this.token});

    UserData.fromJson(Map<String, dynamic> json) {
        employee = json["employee"] == null ? null : Employee.fromJson(json["employee"]);
        token = json["token"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(employee != null) {
            _data["employee"] = employee?.toJson();
        }
        _data["token"] = token;
        return _data;
    }
}

class Employee {
    String? name;
    String? phoneNumber;
    dynamic image;

    Employee({this.name, this.phoneNumber, this.image});

    Employee.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        phoneNumber = json["phone_number"];
        image = json["image"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["phone_number"] = phoneNumber;
        _data["image"] = image;
        return _data;
    }
}
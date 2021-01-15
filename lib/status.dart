class Status {
  final bool status;

  Status({this.status});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      status: json['status'],
    );
  }
}

class UserStatus {
  final bool status;
  final int id;

  UserStatus({this.status,this.id});

  factory UserStatus.fromJson(Map<String, dynamic> json) {
    return UserStatus(
      status: json['status'],
      id: json['id']
    );
  }
}

class Arrangement {
  final String status;
  final String date;

  Arrangement({this.status,this.date});

  factory Arrangement.fromJson(Map<String, dynamic> json) {
    return Arrangement(
      status: json['status'],
      date: json['date']
    );
  }
}

class Service {
  final String type;
  final String status;

  Service({this.status,this.type});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      status: json['status'],
      type: json['type_service']
    );
  }
}

class getTockens {
  String? channelName;
  List<Tokens>? tokens;

  getTockens({this.channelName, this.tokens});

  getTockens.fromJson(Map<String, dynamic> json) {
    channelName = json['channelName'];
    if (json['tokens'] != null) {
      tokens = <Tokens>[];
      json['tokens'].forEach((v) {
        tokens!.add(new Tokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelName'] = this.channelName;
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tokens {
  String? userId;
  String? token;

  Tokens({this.userId, this.token});

  Tokens.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}

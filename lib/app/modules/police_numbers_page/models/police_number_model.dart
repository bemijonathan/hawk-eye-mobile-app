class PoliceNumbers {
  List<StatePolice> states;

  PoliceNumbers({this.states});

  PoliceNumbers.fromJson(Map<String, dynamic> json) {
    if (json['states'] != null) {
      states = [];
      json['states'].forEach((v) {
        states.add(new StatePolice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.states != null) {
      data['states'] = this.states.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatePolice {
  String state;
  List<String> phones;

  StatePolice({this.state, this.phones});

  StatePolice.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    phones = json['phones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['phones'] = this.phones;
    return data;
  }
}

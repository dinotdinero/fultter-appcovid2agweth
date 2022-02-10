class MonitoringModel {
  String day;
  String bloodpressure;
  String temperature;
  String oxygenlevel;
  String heartbeat;


  MonitoringModel(
      {this.day,
        this.bloodpressure,
        this.temperature,
        this.oxygenlevel,
        this.heartbeat,
       });

  MonitoringModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    bloodpressure = json['bloodpressure'];
    temperature = json['temperature'];
    oxygenlevel = json['oxygenlevel'];
    heartbeat = json['heartbeat'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['bloodpressure'] = this.bloodpressure;
    data['temperature'] = this.temperature;
    data['oxygenlevel'] = this.oxygenlevel;
    data['heartbeat'] = this.heartbeat;

    return data;
  }
}

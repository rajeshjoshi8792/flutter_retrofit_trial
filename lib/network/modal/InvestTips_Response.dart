class InvestTips_Response {
  bool success;
  List<Data> data;
  String message;

  InvestTips_Response({this.success, this.data, this.message});

  InvestTips_Response.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  int advisor;
  String stock;
  String entryPoint;
  String stopLoss;
  String target;
  String quantity;
  String investment;
  int segment;
  int tipsType;
  String tipsValidity;
  String riskType;
  int maxProfit;
  int maxLoss;
  int advisorFee;
  String action;
  String peRatio;
  String rrRatio;
  String pbRatio;
  String psRatio;
  String deRatio;
  String roe;
  String eps;
  String currentRatio;
  String dividendYeild;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String tipstypename;
  String isPurchased;

  Data(
      {this.id,
      this.advisor,
      this.stock,
      this.entryPoint,
      this.stopLoss,
      this.target,
      this.quantity,
      this.investment,
      this.segment,
      this.tipsType,
      this.tipsValidity,
      this.riskType,
      this.maxProfit,
      this.maxLoss,
      this.advisorFee,
      this.action,
      this.peRatio,
      this.rrRatio,
      this.pbRatio,
      this.psRatio,
      this.deRatio,
      this.roe,
      this.eps,
      this.currentRatio,
      this.dividendYeild,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.tipstypename,
      this.isPurchased});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advisor = json['advisor'];
    stock = json['stock'];
    entryPoint = json['entry_point'];
    stopLoss = json['stop_loss'];
    target = json['target'];
    quantity = json['quantity'];
    investment = json['investment'];
    segment = json['segment'];
    tipsType = json['tips_type'];
    tipsValidity = json['tips_validity'];
    riskType = json['risk_type'];
    maxProfit = json['max_profit'];
    maxLoss = json['max_loss'];
    advisorFee = json['advisor_fee'];
    action = json['action'];
    peRatio = json['pe_ratio'];
    rrRatio = json['rr_ratio'];
    pbRatio = json['pb_ratio'];
    psRatio = json['ps_ratio'];
    deRatio = json['de_ratio'];
    roe = json['roe'];
    eps = json['eps'];
    currentRatio = json['current_ratio'];
    dividendYeild = json['dividend_yeild'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    tipstypename = json['tipstypename'];
    isPurchased = json['isPurchased'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advisor'] = this.advisor;
    data['stock'] = this.stock;
    data['entry_point'] = this.entryPoint;
    data['stop_loss'] = this.stopLoss;
    data['target'] = this.target;
    data['quantity'] = this.quantity;
    data['investment'] = this.investment;
    data['segment'] = this.segment;
    data['tips_type'] = this.tipsType;
    data['tips_validity'] = this.tipsValidity;
    data['risk_type'] = this.riskType;
    data['max_profit'] = this.maxProfit;
    data['max_loss'] = this.maxLoss;
    data['advisor_fee'] = this.advisorFee;
    data['action'] = this.action;
    data['pe_ratio'] = this.peRatio;
    data['rr_ratio'] = this.rrRatio;
    data['pb_ratio'] = this.pbRatio;
    data['ps_ratio'] = this.psRatio;
    data['de_ratio'] = this.deRatio;
    data['roe'] = this.roe;
    data['eps'] = this.eps;
    data['current_ratio'] = this.currentRatio;
    data['dividend_yeild'] = this.dividendYeild;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['tipstypename'] = this.tipstypename;
    data['isPurchased'] = this.isPurchased;
    return data;
  }
}

class UserModel{
  String? uid;
  String? name;
  String? nic;
  String? email;
  String? address;
  String?  tp;
  int? Jasmine;
  int? ParamithaR;
  int? ParamithaG;
  int? Araliya;
  int? SixO;
  int? SixO50;
  int? SixOMega;
  int? Gurudeva;
  double? Salary;
  double? salesVal;



  UserModel({this.uid,this.name,this.nic,this.email,this.address,this.tp,this.Jasmine,this.Araliya,this.Gurudeva,this.ParamithaG,this.ParamithaR,this.SixO,this.SixO50,this.SixOMega,this.salesVal,this.Salary});
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      nic: map['nic'],
      address: map['address'],
      tp: map['tp'],
      Jasmine: map['Jasmine'],
      Araliya: map['Araliya'],
      Gurudeva: map['Gurudeva'],
      ParamithaG:map['ParamithaG'],
      ParamithaR:map['ParamithaR'] ,
      SixO50:map['SixO50'] ,
      SixO:map['SixO'] ,
      SixOMega:map['SixOMega'] ,
      Salary: map['Salary'],
      salesVal: map['salesVal']

    );

  }
  Map<String,dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'nic': nic,
      'address': address,
      'tp': tp,
      'Jasmine':Jasmine,
      'ParamithaR':ParamithaR,
      'ParamithaG':ParamithaG,
      'SixOMega':SixOMega,
      'SixO':SixO,
      'SixO50':SixO50,
      'Araliya':Araliya,
      'Gurudeva':Gurudeva,
      'Salary' : Salary,
      'salesVal' : salesVal,

    };
  }
}
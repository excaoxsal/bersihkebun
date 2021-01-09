class Order {
  String _ordername;
  String _user, _luaslahan, _jenislayanan, _alamat;
  String _flaglogged;
  int _price;



  Order( this._ordername, this._user, this._price, this._alamat, this._luaslahan, this._jenislayanan, this._flaglogged);

  Order.map(dynamic obj) {
    this._ordername = obj['ordername'];
    this._user = obj['user'];
    this._alamat = obj['alamat'];
    this._price = obj['price'];
    this._luaslahan = obj['luaslahan'];
    this._jenislayanan = obj['jenislayanan'];
    this._flaglogged = obj['password'];
  }

  String get ordername => _ordername;
  String get user => _user;
  String get alamat => _alamat;
  int get price => _price;
  String get luaslahan => _luaslahan;
  String get jenislayanan => _jenislayanan;
  String get flaglogged => _flaglogged;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["ordername"] = _ordername;
    map["user"] = _user;
    map["alamat"] = _alamat;
    map["price"] = _price;
    map["luaslahan"] = _luaslahan;
    map["jenislayanan"] = _jenislayanan;
    map["flaglogged"] = _flaglogged;
    return map;
  }
}

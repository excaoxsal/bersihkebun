class Order {
  String _ordername;
  String _user, _luaslahan, _jenislayanan, _alamat;

  int _price;



  Order( this._ordername, this._user, this._price, this._alamat, this._luaslahan, this._jenislayanan);

  Order.map(dynamic obj) {
    this._ordername = obj['ordername'];
    this._user = obj['user'];
    this._alamat = obj['alamat'];
    this._price = obj['price'];
    this._luaslahan = obj['luaslahan'];
    this._jenislayanan = obj['jenislayanan'];

  }

  String get ordername => _ordername;

  set ordername(String value) {
    _ordername = value;
  }
  String get user => _user;

  set user(String value) {
    _user = value;
  }

  get luaslahan => _luaslahan;

  set luaslahan(value) {
    _luaslahan = value;
  }

  get jenislayanan => _jenislayanan;

  set jenislayanan(value) {
    _jenislayanan = value;
  }

  get alamat => _alamat;

  set alamat(value) {
    _alamat = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["ordername"] = _ordername;
    map["user"] = _user;
    map["alamat"] = _alamat;
    map["price"] = _price;
    map["luaslahan"] = _luaslahan;
    map["jenislayanan"] = _jenislayanan;
    return map;
  }


}

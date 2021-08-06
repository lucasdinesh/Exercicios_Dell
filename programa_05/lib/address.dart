import 'dart:convert';

class Address {
  String? _logradouro, _cep, _complemento, _localidade, _uf, _ibge, _gia,
      _ddd, _siafi, _bairro;
  Address(this._logradouro, this._cep, this._complemento, this._localidade, this._uf, this._ibge,this._gia, this._ddd, this._siafi, this._bairro);
  Address.fromJson(source){
    var json_aux = json.decode(source);
    this._cep=json_aux["cep"].toString();
    this._logradouro=json_aux["logradouro"];
    this._complemento=json_aux["complemento"];
    this._bairro=json_aux["bairro"];
    this._localidade=json_aux["localidade"];
    this._uf=json_aux["uf"];
    this._ibge=json_aux["ibge"];
    this._gia=json_aux["gia"];
    this._ddd=json_aux["ddd"];
    this._siafi=json_aux["siafi"];
  }

  String? get_value(field){
    switch(field){
      case "cep": return this._cep; break;
      case "logradouro": return this._logradouro; break;
      case "complemento":return this._complemento; break;
      case "bairro":return this._bairro; break;
      case "localidade":return this._localidade; break;
      case "uf":return this._uf; break;
      case "ibge":return this._ibge; break;
      case "gia":return this._gia; break;
      case "ddd":return this._ddd; break;
      case "siafi":return this._siafi; break;
      default: return null;break;
    }
  }
  print_address(){
    print('cep: ${this._cep}, logradouro: ${this._logradouro}');
  }
}


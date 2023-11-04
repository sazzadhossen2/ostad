/// status : "success"
/// data : [{"_id":"6549b1a0b249026d4006652e","ProductName":"yy","ProductCode":"5574","Img":"https://images.pexels.com/photos/2533266/pexels-photo-2533266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","UnitPrice":"65558","Qty":"ugdhtf","TotalPrice":"8886","CreatedDate":"2023-11-02T13:10:34.754Z"},{"_id":"654a6314b249026d40066646","ProductName":"Headphone","ProductCode":"H45","Img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRppmczC4h4KiaSntzEseQxcEQ4Kv_LobtIAQ&usqp=CAU","UnitPrice":"900","Qty":"70","TotalPrice":"8001703","CreatedDate":"2023-11-02T13:10:34.754Z"},{"_id":"654a6b31b249026d4006667f","ProductName":"Smart Watch","ProductCode":"W100","Img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGx-qqOdg9tVxRg0p2JlnvU0PLaRm261rS2Ob1kVgWkGbPARsSSWDn1FQ&s=10","UnitPrice":"500","Qty":"10","TotalPrice":"50000","CreatedDate":"2023-11-02T13:10:34.754Z"},{"_id":"654ab4afb249026d4006678b","ProductName":"Bottle","ProductCode":"0045","Img":"https://www.junglescout.com/wp-content/uploads/2021/01/product-photo-water-bottle-hero.png","UnitPrice":"100","Qty":"1","TotalPrice":"100","CreatedDate":"2023-11-02T13:10:34.754Z"},{"_id":"654b27fbb249026d400667a7","ProductName":"Body Loshon","ProductCode":"212121","Img":"https://images.unsplash.com/photo-1611078489935-0cb964de46d6?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","UnitPrice":"123","Qty":"1","TotalPrice":"321","CreatedDate":"2023-11-02T13:10:34.754Z"}]

class Apihit {
  Apihit({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  Apihit.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  List<Data>? _data;
Apihit copyWith({  String? status,
  List<Data>? data,
}) => Apihit(  status: status ?? _status,
  data: data ?? _data,
);
  String? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "6549b1a0b249026d4006652e"
/// ProductName : "yy"
/// ProductCode : "5574"
/// Img : "https://images.pexels.com/photos/2533266/pexels-photo-2533266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
/// UnitPrice : "65558"
/// Qty : "ugdhtf"
/// TotalPrice : "8886"
/// CreatedDate : "2023-11-02T13:10:34.754Z"

class Data {
  Data({
      String? id, 
      String? productName, 
      String? productCode, 
      String? img, 
      String? unitPrice, 
      String? qty, 
      String? totalPrice, 
      String? createdDate,}){
    _id = id;
    _productName = productName;
    _productCode = productCode;
    _img = img;
    _unitPrice = unitPrice;
    _qty = qty;
    _totalPrice = totalPrice;
    _createdDate = createdDate;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _productName = json['ProductName'];
    _productCode = json['ProductCode'];
    _img = json['Img'];
    _unitPrice = json['UnitPrice'];
    _qty = json['Qty'];
    _totalPrice = json['TotalPrice'];
    _createdDate = json['CreatedDate'];
  }
  String? _id;
  String? _productName;
  String? _productCode;
  String? _img;
  String? _unitPrice;
  String? _qty;
  String? _totalPrice;
  String? _createdDate;
Data copyWith({  String? id,
  String? productName,
  String? productCode,
  String? img,
  String? unitPrice,
  String? qty,
  String? totalPrice,
  String? createdDate,
}) => Data(  id: id ?? _id,
  productName: productName ?? _productName,
  productCode: productCode ?? _productCode,
  img: img ?? _img,
  unitPrice: unitPrice ?? _unitPrice,
  qty: qty ?? _qty,
  totalPrice: totalPrice ?? _totalPrice,
  createdDate: createdDate ?? _createdDate,
);
  String? get id => _id;
  String? get productName => _productName;
  String? get productCode => _productCode;
  String? get img => _img;
  String? get unitPrice => _unitPrice;
  String? get qty => _qty;
  String? get totalPrice => _totalPrice;
  String? get createdDate => _createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['ProductName'] = _productName;
    map['ProductCode'] = _productCode;
    map['Img'] = _img;
    map['UnitPrice'] = _unitPrice;
    map['Qty'] = _qty;
    map['TotalPrice'] = _totalPrice;
    map['CreatedDate'] = _createdDate;
    return map;
  }

}
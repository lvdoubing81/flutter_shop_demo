import 'package:flutter/material.dart';

class GoodsListProvider with ChangeNotifier {
  List _goodsList = [
    {"detail_no":"1","selected":false},
    {"detail_no":"2","selected":false},
    {"detail_no":"3","selected":false},
    {"detail_no":"4","selected":false},
    {"detail_no":"5","selected":false},
  ];

  get goodsList => _goodsList;
  get total => _goodsList.length;

  // initList(List data){
  //   data.forEach((item){
  //     Goods goods = Goods.fromJson(item);
  //     _goodsList.add(goods);
  //     print(_goodsList.toString());
  //   });
  // }

  selected(int index) {
    // Goods goods = _goodsList[index];
    // _goodsList[index] = Goods(goods.detail_id, goods.material_name, goods.color_no, goods.color_name, goods.quantity, 
    // goods.weight, goods.batch_no, !goods.selected, goods.quantityCount, goods.weightCount, goods.available_fabric_list);

    _goodsList[index]['selected'] = !_goodsList[index]['selected'];
    notifyListeners();
  }
}

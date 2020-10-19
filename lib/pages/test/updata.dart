import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UpDataPage extends StatefulWidget {
  UpDataPage({Key key}) : super(key: key);

  @override
  _UpDataPageState createState() => _UpDataPageState();
}

class _UpDataPageState extends State<UpDataPage> {

  List titleTxt = ["仓库", "区域", "地址", "层数"];
  List numValue = ["", "", "", ""];
  List broadTxt = ["1","2","3","清除","4","5","6"," ","7","8","9","","0","确认",];
  int selectNumIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自动更新页面'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 12, bottom: 12),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: _buildTitle(),
              ),
              Expanded(
                flex: 2,
                child: _buildNum(),
              ),
              Expanded(
                flex: 7,
                child: _buildBoard(),
              )
            ],
          ),
        ));
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: titleTxt.length,
        crossAxisCount: 4,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(width: 1, color: Colors.yellow),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(titleTxt[index]),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  Widget _buildNum() {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        crossAxisCount: 4,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              selectNumIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: selectNumIndex==index ? Colors.white :  Colors.grey[200],
                border: Border.all(width: 2, color: selectNumIndex==index ? Colors.orange[200] : Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: Text(numValue[index].toString()),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  Widget _buildBoard() {
    return Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) => new InkWell(
            onTap: () {
              print(index);
              String s = numValue[selectNumIndex];
              if(index==3){
                if(s.length>0){
                  s = s.substring(0,s.length-1);
                  print(s.length);
                }
                
              }else if(index==13){
                String local_no = "";
                print(local_no);
                for(var i = 0;i<numValue.length;i++){
                  if(i==0){
                    local_no = local_no + numValue[i];
                  }else{
                    local_no = local_no + "-" + numValue[i];
                  }
                  
                }
                print(local_no);
              }else{
                s += broadTxt[index];
              }
                setState(() {
                  numValue[selectNumIndex] = s;
                });
            },
            child: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: new Center(
                  child: new Text(broadTxt[index].toString(),style: TextStyle(fontSize: 18),),
                )),
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(index > 11 ? 2 : 1, 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }
}

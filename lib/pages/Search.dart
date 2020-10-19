import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var now = DateTime.now();
   _showDatePicker() async{
    var result = await showDatePicker(context: context, initialDate: now, firstDate: DateTime(1980), lastDate: DateTime(2100));
    setState(() {
      this.now = result;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${this.now.millisecondsSinceEpoch}');
    print(DateTime.fromMillisecondsSinceEpoch(1598668041413));
    print(formatDate(now, [yyyy, '年', mm, '月', dd]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期查询'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(formatDate(now, [yyyy, '年', mm, '月', dd])), Icon(Icons.arrow_drop_down)],
            ),
            onTap: (){
              print('打开日期组件');
              _showDatePicker();
            },
            
          )
        ],
      ),
    );
  }
}

// class Search extends StatelessWidget {
//   const Search({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('日期查询'),
//       ),
//       body: Column(
//         children: [
//           Text('我是日期')
//         ],
//       ),
//     );
//   }
// }

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
/// 创建EventBus
EventBus eventBus = EventBus();

/// Event 修改主题色
class ThemeColorEvent {
  Color colorStr;

  ThemeColorEvent(this.colorStr);
}

class ScanReceive {
  String scanReceive;
  ScanReceive(this.scanReceive);
}
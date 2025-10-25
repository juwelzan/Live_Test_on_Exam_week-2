import 'package:get/get.dart';
import 'package:live_test_exam_week_2/model.dart';

class Controller extends GetxController {
  RxList contacts = <Model>[].obs;

  void contactsAdd(String name, String number) {
    contacts.add(Model(name: name, number: number));
  }
}

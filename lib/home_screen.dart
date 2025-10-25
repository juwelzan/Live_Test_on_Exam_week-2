// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:live_test_exam_week_2/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final controller = Get.put<Controller>(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Contact List"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Gap(20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
              ),
              Gap(20),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  hintText: "Enter Number",
                  border: OutlineInputBorder(),
                ),
              ),
              Gap(20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        numberController.text.isNotEmpty) {
                      controller.contactsAdd(
                        nameController.text,
                        numberController.text,
                      );
                    }
                  },
                  child: Text("Add"),
                ),
              ),
              Gap(20),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.contacts.length,
                    itemBuilder: (context, index) {
                      final contac = controller.contacts[index];
                      return Card(
                        color: Colors.purple,
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                          title: Text(
                            contac.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            contac.number,
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          trailing: Icon(Icons.phone, color: Colors.blue),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

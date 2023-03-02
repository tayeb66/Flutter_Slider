import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}

class SliderController extends GetxController{
  var sliderValue = 20.obs;

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  SliderController controller = Get.put(SliderController());
  TextEditingController sliderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Obx(() {
              return Slider(
                activeColor: Colors.orange,
                thumbColor: Colors.blue,
                inactiveColor: Colors.black,
                value: controller.sliderValue.value.toDouble(),
                max: 100,
                divisions: 5,
                label: controller.sliderValue.round().toString(),
                onChanged: (double value){
                  controller.sliderValue.value = value.toInt();
                  sliderController.text = controller.sliderValue.toString();
                },
              );
            } ),),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "10",
                  enabledBorder: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                controller: sliderController,
                onChanged: (value){
                  controller.sliderValue.value = int.parse(value);
                },
              ),
            ),)
          ],
        )
      )
    );
  }
}


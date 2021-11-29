import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    
    //Simulação de um tempo de carregamento do App com intuito de mostrar a tela de "Splash"
    //await Future.delayed(Duration(seconds: 3));
    
    Get.offAllNamed('/home');
  }
}

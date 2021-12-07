import 'package:agenda/application/theme/theme_config.dart';
import 'package:agenda/modules/home/home_controller.dart';
import 'package:agenda/modules/home/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: ThemeConfig.blue2,
          onPressed: controller.floatButtonOnClick,
        ),
        appBar: AppBar(
          title: Text(ThemeConfig.title),
        ),
        body: FutureBuilder(
          future: controller.loadContatos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Obx(
              () {
                if (controller.contatos.length == 0) {
                  return Center(
                    child: Text("Adicione algum contato para começar!"),
                  );
                }

                return ListView.builder(
                  itemCount: controller.contatos.length,
                  itemBuilder: (context, item) {
                    return ContactCard(
                      contato: controller.contatos[item],
                      color: (item % 2 == 0) ? Colors.grey[400] : Colors.white,
                    );
                  },
                );
              },
            );
          },
        ));
  }
}

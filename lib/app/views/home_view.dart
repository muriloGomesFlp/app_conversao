import 'package:app_conversao/app/components/inputMoeda_comp.dart';
import 'package:app_conversao/app/controllers/home_controllers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
//funcionar o controller com a view, instanciar a classe do controller resposável por esta regra e instanciar também as inputs

  //abaixo foi criado o construtor do Homeview pois os valores que são passados são dinamicos e não pode ser passado de outro modo.

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController deTexto = TextEditingController();
  late HomeController homeController;

  final TextEditingController paraTexto = TextEditingController();

  @override //ciclo de vida do flutter - usar como construtor.
  void initState() {
    // ignore: todo
    //TODO: implement initState
    super.initState();
    homeController = HomeController(deTexto: deTexto, paraTexto: paraTexto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
          child: ListView(children: [
            Column(
              children: [
                Image.asset(
                  'assets/img/logo.png',
                  width: 150,
                  height: 150,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: InputMoedas(
                      itemSelecionado: homeController.deMoedas,
                      controller: deTexto,
                      listyaMoedas: homeController.moedas,
                      onChanged: (modelo) {
                        setState(() {
                          homeController.deMoedas =
                              modelo!; //dessa forma ao slecionar muda o nome da moeda no dropbox (nestes casos que a tela precisa ser reconstruida com novo valor, sempre usad o statefull)
                        });
                      },
                    )),
                InputMoedas(
                  itemSelecionado: homeController.paraMoedas,
                  controller: paraTexto,
                  listyaMoedas: homeController.moedas,
                  onChanged: (modelo) {
                    setState(() {
                      homeController.paraMoedas =
                          modelo!; //dessa forma ao slecionar muda o nome da moeda no dropbox (nestes casos que a tela precisa ser reconstruida com novo valor, sempre usad o statefull)
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      homeController
                          .conversao(); //ação do botão, para realizar a conversão.
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    child: Text(
                      'CONVERTER',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:app_conversao/app/controllers/home_controllers.dart';
import 'package:app_conversao/app/models/moedas_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//Testa somente o backend sem precisar da view pronta!

main() {
  final TextEditingController deTexto = TextEditingController();
  final TextEditingController paraTexto = TextEditingController();
  final homeController =
      HomeController(deTexto: deTexto, paraTexto: paraTexto); // instanciando

  test('deve converter as moedas para dolar com uso de virgula', () {
    deTexto.text = '2,0';
    homeController.conversao();
    expect(paraTexto.text, '0.36');
  });

  test('deve converter as moedas para dolar', () {
    deTexto.text = '2.0';
    homeController.conversao();
    expect(paraTexto.text, '0.36');
  });

  test('deve converter as moedas para real', () {
    deTexto.text = '2.0';
    homeController.deMoedas = MoedasModelo(
        name: 'Dolar', real: 5.65, euro: 0.85, dolar: 1, bitcoin: 0.000088);
    homeController.paraMoedas = MoedasModelo(
        name: 'Real', real: 1.0, euro: 0.15, dolar: 0.18, bitcoin: 0.000016);
    homeController.conversao();
    expect(paraTexto.text, '11.30');
  });
}

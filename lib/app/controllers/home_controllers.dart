import 'package:app_conversao/app/models/moedas_model.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  late List<MoedasModelo> moedas;
  late MoedasModelo deMoedas;
  late MoedasModelo paraMoedas;

  final TextEditingController deTexto;
  final TextEditingController paraTexto;

  HomeController({required this.deTexto, required this.paraTexto}) {
    moedas = MoedasModelo.getMoedas();
    deMoedas = moedas[0];
    paraMoedas = moedas[1];
  }

  void conversao() {
    //nao retorna nada
    // recebe valor do campo texto instanciado
    String text = deTexto.text;
    //converte o text em double para posterior calculo
    double valor = double.tryParse(text.replaceAll(',', '.')) ??
        1.0; //converte e caso der um erro retorna este erro -- O replace all, troca o "," p ".". Assim evita erros, por conta do double aceitar apenas pontos.
    //variavel pra retornar valor
    double returnValue = 0;

    //realizad o calculo
    if (paraMoedas.name == 'Real') {
      returnValue = valor * deMoedas.real;
    } else if (paraMoedas.name == 'Dolar') {
      returnValue = valor * deMoedas.dolar;
    } else if (paraMoedas.name == 'Euro') {
      returnValue = valor * deMoedas.euro;
    } else if (paraMoedas.name == 'Bitcoin') {
      returnValue = valor * deMoedas.bitcoin;
    }

    if (paraMoedas.name == 'Bitcoin') {
      paraTexto.text = returnValue.toStringAsFixed(
          6); //retona em texto só que com dois zeros apos a virgula
    } else {
      paraTexto.text = returnValue.toStringAsFixed(
          2); //retona em texto só que com dois zeros apos a virgula
    }
  }
}

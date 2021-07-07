import 'package:app_conversao/app/models/moedas_model.dart';
import 'package:flutter/material.dart';

class InputMoedas extends StatelessWidget {
  //passar a lista de "moedas" oriunda do model, para isso deve-se criar um construtor.
  final List<MoedasModelo>? listyaMoedas; //as variaveis criadas
  final MoedasModelo? itemSelecionado;
  final TextEditingController? controller;
  final void Function(MoedasModelo? modelo)? onChanged;
  //construtor criado;
  const InputMoedas(
      {Key? key,
      this.listyaMoedas,
      this.controller,
      this.onChanged,
      this.itemSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<MoedasModelo>(
                //uso de <MoedasModelo>, explicita a tipagem do Dropbuttom, neste caso a Lista criada la no model;
                iconEnabledColor: Colors.amber,
                iconSize: 30,
                isExpanded: true,
                value: itemSelecionado, //para mostrar o que foi selecionado.
                hint: Text('Moeda'),
                //style: TextStyle(color: Colors.white),
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items:
                    listyaMoedas! //o "!" é com conta da "variável ​​anulável" criado antes com "?" no inicio da classe.
                        .map((elementos) => DropdownMenuItem(
                            value: elementos, child: Text(elementos.name)))
                        .toList(), //"=>" significa que vai retornar algo. O map ele pega os valores da listyaMoedas e criar a os itens no DropdownMenuItem com base do "elemento"
                onChanged: onChanged, //definido a função no incio da classew
              ),
            )),
        SizedBox(width: 25),
        Expanded(
            flex: 2,
            child: TextField(
              controller:
                  controller, //quando tiver um text aqui ele envia para o controler
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
            )),
      ],
    );
  }
}

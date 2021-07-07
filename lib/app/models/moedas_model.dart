class MoedasModelo {
  final String name;
  final double real;
  final double euro;
  final double dolar;
  final double bitcoin;

  MoedasModelo(
      {required this.name,
      required this.real,
      required this.euro,
      required this.dolar,
      required this.bitcoin});

  static List<MoedasModelo> getMoedas() {
    return <MoedasModelo>[
      MoedasModelo(
          name: 'Real', real: 1.0, euro: 0.15, dolar: 0.18, bitcoin: 0.000016),
      MoedasModelo(
          name: 'Dolar', real: 5.65, euro: 0.85, dolar: 1, bitcoin: 0.000088),
      MoedasModelo(
          name: 'Euro', real: 6.62, euro: 1, dolar: 1.17, bitcoin: 0.000010),
      MoedasModelo(
          name: 'Bitcoin',
          real: 64116.51,
          euro: 9689.54,
          dolar: 11351.30,
          bitcoin: 1),
    ];
  }
}

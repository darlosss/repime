enum EnumTiposResidencia {
  replublica,
  kitnet;

  bool get isRepublica => this == replublica;

  @override
  String toString() {
    switch (this) {
      case EnumTiposResidencia.kitnet:
        return 'KitNet';
      case EnumTiposResidencia.replublica:
        return 'República';
    }
  }

  static EnumTiposResidencia fromJson(j) => j['tipo'] == 'republica' ? replublica : kitnet;

  toJson() {
    switch (this) {
      case EnumTiposResidencia.kitnet:
        return 'kitnet';
      case EnumTiposResidencia.replublica:
        return 'republica';
    }
  }

  String toNameDB() {
    switch (this) {
      case EnumTiposResidencia.kitnet:
        return 'kitnet';
      case EnumTiposResidencia.replublica:
        return 'republica';
    }
  }
}

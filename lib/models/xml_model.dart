import 'package:xml/xml.dart';

void main() {
  final xmlString = '''<DADOSPARAINSPECAO>
  <!-- Seu XML aqui -->
</DADOSPARAINSPECAO>''';

  final XmlDocument xmlDoc = XmlDocument.parse(xmlString);
  final dadosParaInspecao =
      Dadosparainspecao.fromXmlElement(xmlDoc.rootElement);

  // Use o objeto 'dadosParaInspecao' conforme necessário
  print(dadosParaInspecao);
}

class Dadosparainspecao {
  String tipoPressaoAr;
  String tipoSulco;
  String cicloVidaMax;
  String nroUnicoFoto;
  String nomeFilial;
  String codFrota;
  String codFilial;
  String atualizaPresArRec;
  Veiculo veiculo;
  List<Pneu> pneus;

  Dadosparainspecao({
    required this.tipoPressaoAr,
    required this.tipoSulco,
    required this.cicloVidaMax,
    required this.nroUnicoFoto,
    required this.nomeFilial,
    required this.codFrota,
    required this.codFilial,
    required this.atualizaPresArRec,
    required this.veiculo,
    required this.pneus,
  });

  factory Dadosparainspecao.fromXmlElement(XmlElement xmlElement) {
    return Dadosparainspecao(
      tipoPressaoAr: xmlElement.findElements('TipoPressaoAr').single.text,
      tipoSulco: xmlElement.findElements('TipoSulco').single.text,
      cicloVidaMax: xmlElement.findElements('CicloVidaMax').single.text,
      nroUnicoFoto: xmlElement.findElements('NroUnicoFoto').single.text,
      nomeFilial: xmlElement.findElements('NomeFilial').single.text,
      codFrota: xmlElement.findElements('CodFrota').single.text,
      codFilial: xmlElement.findElements('CodFilial').single.text,
      atualizaPresArRec:
          xmlElement.findElements('AtualizaPresArRec').single.text,
      veiculo:
          Veiculo.fromXmlElement(xmlElement.findElements('VEICULO').single),
      pneus: xmlElement
          .findElements('PNEU')
          .map((pneuElement) => Pneu.fromXmlElement(pneuElement))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Dadosparainspecao(tipoPressaoAr: $tipoPressaoAr, tipoSulco: $tipoSulco, cicloVidaMax: $cicloVidaMax, '
        'nroUnicoFoto: $nroUnicoFoto, nomeFilial: $nomeFilial, codFrota: $codFrota, '
        'codFilial: $codFilial, atualizaPresArRec: $atualizaPresArRec, veiculo: $veiculo, '
        'pneus: $pneus)';
  }
}

class Veiculo {
  String codVeiculo;
  String qtPosicoes;
  // Outros campos...

  Veiculo({
    required this.codVeiculo,
    required this.qtPosicoes,
    // Outros campos...
  });

  factory Veiculo.fromXmlElement(XmlElement xmlElement) {
    return Veiculo(
      codVeiculo: xmlElement.findElements('CodVeiculo').single.text,
      qtPosicoes: xmlElement.findElements('QtPosicoes').single.text,
      // Parse outros campos...
    );
  }

  @override
  String toString() {
    return 'Veiculo(codVeiculo: $codVeiculo, qtPosicoes: $qtPosicoes)';
  }
}

class Pneu {
  String seqPosInsp;
  String codPos;
  // Outros campos...

  Pneu({
    required this.seqPosInsp,
    required this.codPos,
    // Outros campos...
  });

  factory Pneu.fromXmlElement(XmlElement xmlElement) {
    return Pneu(
      seqPosInsp: xmlElement.findElements('SeqPosInsp').single.text,
      codPos: xmlElement.findElements('CodPos').single.text,
      // Parse outros campos...
    );
  }

  @override
  String toString() {
    return 'Pneu(seqPosInsp: $seqPosInsp, codPos: $codPos)';
  }
}

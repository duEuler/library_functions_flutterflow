import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'n78fvxc1': {
      'pt': 'Usu??rios da Biblioteca Global',
      'en': '',
    },
    '6ejh87ap': {
      'pt': 'Regras',
      'en': 'Rules',
    },
    'gqd5a2sj': {
      'pt':
          'Bem vindo ao Projeto Global de Usu??rios flutterflow, um local para troca de c??digo entre programadores.\n\nSiga as orienta????es para publicar p??ginas e fun????es.\n\nCrie um pasta para publicar suas p??ginas com seu apelido, n??o publique na pasta de outro usu??rio sem o concentimento do mesmo. Fa??a o mesmo para os componentes.\n\nCada p??gina ou componente deve come??ar com seu apelido, exemplo \"dueuler_pedido\".\n\nAo adicionar fun????es, lembre-se de iniciar com seu apelido, exemplo \"dueulerTableInsert\".\n\nUse o mesmo apelido em suas publica????es para sabermos a autoria.\n\nN??o deixe este projeto com mensagem de erro.\n\nAproveite o conte??do colaborativo a vontade.\n\nCadastre seu perfil na p??gina de membros, adicione um a????o que abra a pagina \"seuapelido_start\" esta p??gina devera estar dentro da sua pasta \"seuapelido\", coloque sua foto e seus dados para contato nesta p??gina.',
      'en':
          'Welcome to the flutterflow Global User Project, a place for code exchange between programmers.\n\nFollow the guidelines for publishing pages and roles.\n\nCreate a folder to publish your pages with your nickname, do not publish in another user\'s folder without his consent. Do the same for the components.\n\nEach page or component must begin with its nickname, for example \"dueuler_pedido\".\n\nWhen adding functions, remember to start with their nickname, for example \"dueulerTableInsert\".\n\nUse the same nickname in your publications so that we know the authorship.\n\nDo not leave this project with an error message.\n\nEnjoy collaborative content at will.\n\nRegister your profile on the members page, add an action that opens the page \"yourname_start\" this page should be inside your \"yourname\" folder, put your photo and your contact information on this page.',
    },
    'r3lky1b3': {
      'pt': 'by duEuler.com',
      'en': '',
    },
    'q8vghs1p': {
      'pt': 'Membros',
      'en': 'Members',
    },
    '0mv3bhiu': {
      'pt': 'Euler Magalh??es Junior',
      'en': '',
    },
    'iki0o5lk': {
      'pt': 'Bambu??, Minas Gerais, Brasil',
      'en': '',
    },
    '0nkqopvc': {
      'pt': 'WhatsApp:',
      'en': '',
    },
    '3fyq6kyk': {
      'pt': '(37)9 9100-7768',
      'en': '',
    },
    'kbl9rzlg': {
      'pt': 'WebSite:',
      'en': '',
    },
    'kghpv65t': {
      'pt': ' www.dueuler.com',
      'en': '',
    },
    'krley4vo': {
      'pt': 'Abrir',
      'en': 'Open',
    },
    'zagtt7iz': {
      'pt':
          'Duplique o painel acima e coloque seus dados, fa??o seu cadastro, participe.',
      'en': '',
    },
    'guaqveqx': {
      'pt': 'Aulas',
      'en': 'Exemples',
    },
    'k3ivigrq': {
      'pt': 'professor',
      'en': 'teacher',
    },
    '5m0yhsyu': {
      'pt': 'Euler Magalh??es Junior',
      'en': '',
    },
    '1qr5g0ys': {
      'pt': 'Introdu????o FlutterFlow',
      'en': 'Firebase - Manipulate Firestore',
    },
    'm8v2twk5': {
      'pt': 'Firebase (Configura????o)',
      'en': 'Firebase - Manipulate Firestore',
    },
    'an9j7625': {
      'pt': 'Vers??es e Rastaura????es',
      'en': 'Firebase - Manipulate Firestore',
    },
    'lenqpoov': {
      'pt': 'Firestore',
      'en': 'Firebase - Manipulate Firestore',
    },
    'm7pwb9t5': {
      'pt': 'Tabela local',
      'en': 'Local Table',
    },
    'w1f86g3b': {
      'pt': 'Geo Fire',
      'en': '',
    },
    '45g7slgn': {
      'pt':
          'Sempre que adicionar exemplos a sua p??gina, n??o esque??a de adicionar aqui tamb??m para que todos possam visualziar.',
      'en': '',
    },
    'vzt932ce': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_start
  {
    'qtt1i7tc': {
      'pt': 'Euler Magalh??es Junior',
      'en': '',
    },
    'ylw6cagc': {
      'pt': 'Bambu??, Minas Gerais, Brasil',
      'en': '',
    },
    '06t56ahj': {
      'pt': 'WhatsApp:',
      'en': '',
    },
    'pdn9s7yx': {
      'pt': '(37)9 9100-7768',
      'en': '',
    },
    'zmgkrkap': {
      'pt': 'WebSite:',
      'en': '',
    },
    '22mmrdn0': {
      'pt': ' www.dueuler.com',
      'en': '',
    },
    'brcsyr77': {
      'pt': 'Valor da hora de treinamento: ',
      'en': '',
    },
    '1o895m6g': {
      'pt': 'R\$ 150,00',
      'en': '',
    },
    'quzfy9ho': {
      'pt': 'Valor da hora de servi??o: ',
      'en': '',
    },
    'au3g4qxl': {
      'pt': 'R\$ 100,00',
      'en': '',
    },
    '1qedq45p': {
      'pt':
          '* Analista de Ssistema/Programador/Arquiteto e Enegenhrio de Software\n\n* TAGS:Android, Java, Delphi, AdiantBuilder, PHP, SupaBase, Firebase, MySql, SQL, GO, JavaScript',
      'en': '',
    },
    '8um1gj42': {
      'pt': 'URL: ',
      'en': '',
    },
    'xj3flj0t': {
      'pt': ' www.dueuler.com',
      'en': '',
    },
    'ssb5ydzu': {
      'pt': 'Treinamento Flutterflow',
      'en': '',
    },
    '1c3y7k4w': {
      'pt': 'Introdu????o FlutterFlow',
      'en': 'Firebase - Manipulate Firestore',
    },
    '9x2gn64e': {
      'pt': 'Firebase (Configura????o)',
      'en': 'Firebase - Manipulate Firestore',
    },
    'gfpqymn4': {
      'pt': 'Vers??es e Rastaura????es',
      'en': 'Firebase - Manipulate Firestore',
    },
    '105jwuc2': {
      'pt': 'Firestore',
      'en': 'Firebase - Manipulate Firestore',
    },
    'lyk2aonk': {
      'pt': 'Tabela Local',
      'en': '',
    },
    'beetsa03': {
      'pt': 'Geo Fire',
      'en': '',
    },
    'srymxno9': {
      'pt': 'Upload File Server',
      'en': '',
    },
    '2ifmiv9m': {
      'pt': 'Auth Documents',
      'en': '',
    },
    'lzuf596p': {
      'pt': 'API - PHP',
      'en': '',
    },
    '5w2jhd9k': {
      'pt': 'API - Via Cep',
      'en': '',
    },
    'eo1bso5d': {
      'pt': 'duEuler.com',
      'en': '',
    },
    'tinsk6ii': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_tabelalocal
  {
    'f43df9sl': {
      'pt': 'Digite nome do usu??rio',
      'en': '',
    },
    'pjiw9qnl': {
      'pt': 'ADD',
      'en': '',
    },
    'svq7vecf': {
      'pt': ' Tabela local',
      'en': '',
    },
    'xlbqgy75': {
      'pt': '',
      'en': '',
    },
    'hnws3md7': {
      'pt': 'FIREBASE',
      'en': '',
    },
    'r9xk1vrs': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_firestore
  {
    'q4lg28b2': {
      'pt': 'FireStore',
      'en': '',
    },
    '9fivx37j': {
      'pt': '',
      'en': '',
    },
    'zu24iux6': {
      'pt': 'LOCAL',
      'en': '',
    },
    'r6pnp6zd': {
      'pt': 'Digite nome do usu??rio',
      'en': '',
    },
    '3v3sml1y': {
      'pt': 'ADD',
      'en': '',
    },
    't5twbab6': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'po50ryac': {
      'pt': 'Entra com Google',
      'en': 'Sign in with Google',
    },
    'tc2g9ua2': {
      'pt': 'Home Page',
      'en': '',
    },
    '87nlg9qo': {
      'pt': 'by duEuler.com',
      'en': '',
    },
    '6t33hzot': {
      'pt': ' Authentication',
      'en': '',
    },
    '7d76eq9n': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_geofire
  {
    'y1q9x68r': {
      'pt': 'GeoFirePoints',
      'en': '',
    },
    '9tynkmrn': {
      'pt': 'Tabela',
      'en': '',
    },
    'y21i2c4v': {
      'pt': 'Adicionar',
      'en': '',
    },
    'iqkiy2f9': {
      'pt':
          'Usamos a tabela \"usuarios\" como modelo de uso para o GeoFire. Voc?? precisa cadastrar endere??os pr??ximos para ativar o filtro. \n\nUse o bot??o preto para definir o centro do mapa, este endere??o ser?? usado para realizar a busca do raio.\n\nVoc?? pode definir um endere??o especifico na p??gina GeoFirePoints usando o Place, em seguida clique no disquete para salvar a posi????o.',
      'en': '',
    },
    '7t1h26mg': {
      'pt': 'Geo Fire',
      'en': '',
    },
    'el079tb1': {
      'pt': '',
      'en': '',
    },
    '37a3dgob': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_uploadfile
  {
    '937jrxup': {
      'pt': 'Upload file server',
      'en': '',
    },
    'n3hln93b': {
      'pt': 'Sua assinatura',
      'en': '',
    },
    'l8sl34vg': {
      'pt': 'Upload image',
      'en': '',
    },
    'dcjnz6cn': {
      'pt': 'Picker file',
      'en': '',
    },
    'osjm50xm': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_authdoc
  {
    '44y01kaa': {
      'pt': 'Auth Documents',
      'en': '',
    },
    'czirk2n6': {
      'pt': 'Lista de Usu??rios',
      'en': '',
    },
    '938g86kb': {
      'pt': 'Aprovado',
      'en': '',
    },
    'e6ko4uq9': {
      'pt': 'Aprovar',
      'en': '',
    },
    '4432j9me': {
      'pt': 'Auth',
      'en': '',
    },
    'qeijzlut': {
      'pt': 'Nenhum documento aprovado!',
      'en': '',
    },
    'vchqwx85': {
      'pt': 'Enviar documentos',
      'en': '',
    },
    'w7ukikrx': {
      'pt': 'Aguardando aprova????o!',
      'en': '',
    },
    'vlzppcyu': {
      'pt': 'Documentos aprovados:',
      'en': '',
    },
    '773182ue': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_api
  {
    '70nlgn25': {
      'pt': 'Efetue o login no arquivo PHP',
      'en': '',
    },
    '9c8p3ed6': {
      'pt': 'E-mail',
      'en': '',
    },
    'rqgvpqbu': {
      'pt': 'teste@teste.com',
      'en': '',
    },
    '3uc68asq': {
      'pt': 'Senha',
      'en': '',
    },
    'ekaydk5r': {
      'pt': '123456',
      'en': '',
    },
    '1tjwbk7v': {
      'pt': 'Conectar',
      'en': '',
    },
    '1cvjflpi': {
      'pt': 'Tarefa',
      'en': '',
    },
    'e5sazwm9': {
      'pt': 'Data',
      'en': '',
    },
    'qdkntz38': {
      'pt': '...',
      'en': '',
    },
    'ecvh2j0c': {
      'pt': 'Adicionar',
      'en': '',
    },
    '2moinzxu': {
      'pt': 'API - PHP',
      'en': '',
    },
    'du4wx2t6': {
      'pt': '',
      'en': '',
    },
    '2xm21c53': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueuler_api_viacep
  {
    'r2o4qzwj': {
      'pt': 'API - VIA CEP',
      'en': '',
    },
    'g2cua31a': {
      'pt': '',
      'en': '',
    },
    'f29b907n': {
      'pt': 'Buscar Endere??o',
      'en': '',
    },
    '2j3am5j3': {
      'pt': 'Consulte o endere??o pelo seu CEP',
      'en': '',
    },
    'jgjtrd6g': {
      'pt': 'CEP',
      'en': '',
    },
    '2lnhsk98': {
      'pt': 'CEP',
      'en': '',
    },
    '4495x056': {
      'pt': '30130167',
      'en': '',
    },
    'tlof8l84': {
      'pt': 'CONSULTAR',
      'en': '',
    },
    'd3lyrxae': {
      'pt': 'CEP:',
      'en': '',
    },
    'a3ztpd9b': {
      'pt': 'Logradouro:',
      'en': '',
    },
    'dponnool': {
      'pt': 'Complemento:',
      'en': '',
    },
    'pfhhhsx2': {
      'pt': 'Bairro:',
      'en': '',
    },
    'qgerom9p': {
      'pt': 'Localidade',
      'en': '',
    },
    '4rdgotpa': {
      'pt': 'UF:',
      'en': '',
    },
    'hd7iv4v1': {
      'pt': 'IBGE:',
      'en': '',
    },
    'h850ol6b': {
      'pt': 'GIA:',
      'en': '',
    },
    'r2nlnvi5': {
      'pt': 'DDD:',
      'en': '',
    },
    'lm3omtu9': {
      'pt': 'SIAFI:',
      'en': '',
    },
    'oktcusyz': {
      'pt': 'Buscar Lista de Cep',
      'en': '',
    },
    'djns2mg4': {
      'pt': 'Localize o seu CEP, pelo seu endere??o.',
      'en': '',
    },
    'h2n1rswi': {
      'pt': 'MG',
      'en': '',
    },
    '1aophjiv': {
      'pt': 'AC',
      'en': '',
    },
    'jku3drtk': {
      'pt': 'AL',
      'en': '',
    },
    'j7trsqt8': {
      'pt': 'AP',
      'en': '',
    },
    '99vft1q7': {
      'pt': 'AM',
      'en': '',
    },
    'mfof86vf': {
      'pt': 'BA',
      'en': '',
    },
    'c8vto24w': {
      'pt': 'CE',
      'en': '',
    },
    'up8kxgao': {
      'pt': 'DF',
      'en': '',
    },
    '1pfy1c07': {
      'pt': 'ES',
      'en': '',
    },
    'crfzawfv': {
      'pt': 'GO',
      'en': '',
    },
    'sqo4lszb': {
      'pt': 'MA',
      'en': '',
    },
    'xjbswusw': {
      'pt': 'MT',
      'en': '',
    },
    'k82z5nph': {
      'pt': 'MS',
      'en': '',
    },
    'fsnio79s': {
      'pt': 'MG',
      'en': '',
    },
    'aeqfzhsq': {
      'pt': 'PA',
      'en': '',
    },
    '18t9h0nr': {
      'pt': 'PB',
      'en': '',
    },
    'mdzetwu1': {
      'pt': 'PR',
      'en': '',
    },
    'q93q470l': {
      'pt': 'PE',
      'en': '',
    },
    'ofafi8kl': {
      'pt': 'PI',
      'en': '',
    },
    '747739lx': {
      'pt': 'RJ',
      'en': '',
    },
    'fib44i34': {
      'pt': 'RN',
      'en': '',
    },
    'bumgu6yp': {
      'pt': 'RS',
      'en': '',
    },
    'yt1jsuti': {
      'pt': 'RO',
      'en': '',
    },
    'x4u58v6p': {
      'pt': 'RR',
      'en': '',
    },
    '5ukxbupd': {
      'pt': 'SC',
      'en': '',
    },
    'cseiko1q': {
      'pt': 'SP',
      'en': '',
    },
    'rk3raq3l': {
      'pt': 'SE',
      'en': '',
    },
    'zkiaoec6': {
      'pt': 'TO',
      'en': '',
    },
    '85yc3vza': {
      'pt': 'Estado',
      'en': '',
    },
    'nfpqcciy': {
      'pt': 'Cidade',
      'en': '',
    },
    'k28mouhc': {
      'pt': 'Cidade',
      'en': '',
    },
    'ocyqyczx': {
      'pt': 'Belo Horizonte',
      'en': '',
    },
    'xyt1r40c': {
      'pt': 'Rua',
      'en': '',
    },
    'du59x5ip': {
      'pt': 'Rua',
      'en': '',
    },
    'zzjwyzvx': {
      'pt': 'Rua Alagoas',
      'en': '',
    },
    'uc6mryxj': {
      'pt': 'Consultar',
      'en': '',
    },
    '0jt8fj13': {
      'pt': 'CEP:',
      'en': '',
    },
    'woakevsg': {
      'pt': 'Logradouro:',
      'en': '',
    },
    'i2aljzwz': {
      'pt': 'Complemento:',
      'en': '',
    },
    '2dcznel1': {
      'pt': 'Bairro:',
      'en': '',
    },
    'i53du6a3': {
      'pt': 'Localidade',
      'en': '',
    },
    'm1qppcyh': {
      'pt': 'UF:',
      'en': '',
    },
    'lx0af90t': {
      'pt': 'IBGE:',
      'en': '',
    },
    'rnbuuclv': {
      'pt': 'GIA:',
      'en': '',
    },
    'kz29j6a3': {
      'pt': 'DDD:',
      'en': '',
    },
    '14pmzry7': {
      'pt': 'SIAFI:',
      'en': '',
    },
    '7a55lhrj': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueulerEditUsuarioLocal
  {
    'in3jm5j1': {
      'pt': 'Digite nome do usu??rio',
      'en': '',
    },
    'd08gv15n': {
      'pt': 'SAVE',
      'en': '',
    },
  },
  // dueulerEditUsuario
  {
    'k2nf4mak': {
      'pt': 'Digite nome do usu??rio',
      'en': '',
    },
    'q1hij3z5': {
      'pt': 'SAVE',
      'en': '',
    },
    'hbxyduw0': {
      'pt': 'Localizar endere??o...',
      'en': '',
    },
  },
  // dueulerSendAuthDoc
  {
    '4lreadie': {
      'pt': 'Tipo de documento',
      'en': '',
    },
    'ct8ifeem': {
      'pt': 'CPF',
      'en': '',
    },
    'qkzckwlk': {
      'pt': 'CPF',
      'en': '',
    },
    '1wb0d328': {
      'pt': 'CNPJ',
      'en': '',
    },
    'cci7lrzj': {
      'pt': 'CNH',
      'en': '',
    },
    '95otut6t': {
      'pt': 'RG',
      'en': '',
    },
    '0mj5iqbz': {
      'pt': 'Documento...',
      'en': '',
    },
    'gv8xd2hw': {
      'pt': 'N?? DOCUMENTO',
      'en': '',
    },
    '9ojig0r4': {
      'pt': '000.000.000-00',
      'en': '',
    },
    '1u1ipj3t': {
      'pt': 'N?? DOCUMENTO',
      'en': '',
    },
    'tmmgab4g': {
      'pt': '00.000.000/0000-00',
      'en': '',
    },
    '24lcaxrk': {
      'pt': 'N?? DO REGISTRO',
      'en': '',
    },
    'khz90v3e': {
      'pt': 'N?? DOCUMENTO',
      'en': '',
    },
    'g101c0k2': {
      'pt':
          'Digite o documento corretamente, pois o mesmo ser?? conferido com a foto enviada.',
      'en': '',
    },
    'tww7t2dp': {
      'pt': 'Continuar',
      'en': '',
    },
    'vw63bds6': {
      'pt': 'Imagem da frente',
      'en': '',
    },
    'x6tzixnu': {
      'pt':
          'Confira se a imagem esta visivel para leitura, voc?? pode tirar outra foto antes de continuar.',
      'en': '',
    },
    'sw6bakn3': {
      'pt': 'Tirar foto',
      'en': '',
    },
    'mnuxr6o6': {
      'pt': 'Continuar',
      'en': '',
    },
    's96tko6l': {
      'pt': 'Imagem do verso',
      'en': '',
    },
    'fjwn93w5': {
      'pt':
          'Confira se a imagem esta visivel para leitura, voc?? pode tirar outra foto antes de continuar.',
      'en': '',
    },
    'kb3zy1sc': {
      'pt': 'Tirar foto',
      'en': '',
    },
    '3xhf4b0y': {
      'pt': 'Continuar',
      'en': '',
    },
    'qgwjdp4j': {
      'pt': 'Assinatura digital',
      'en': '',
    },
    'bbt1bads': {
      'pt': 'Escreva sua assinatura digital no quadroa cima.',
      'en': '',
    },
    'qyvw3xxi': {
      'pt': 'Enviar documentos',
      'en': '',
    },
  },
  // apiPHPEditarTarefa
  {
    'frnqgnqa': {
      'pt': 'Editar Tarefa',
      'en': '',
    },
    'kkdqlxip': {
      'pt': 'Tarefa',
      'en': '',
    },
    'r7q5su4h': {
      'pt': 'Tarefa',
      'en': '',
    },
    'wn737pba': {
      'pt': 'Anexar foto',
      'en': '',
    },
    'd67m7j79': {
      'pt': 'Salvar',
      'en': '',
    },
  },
  // apiVIACEPConfirmEndereco
  {
    'l8dd6ml0': {
      'pt': 'Endere??o encontrado:',
      'en': '',
    },
    '0hdzvv9w': {
      'pt': 'CEP:',
      'en': '',
    },
    'boixrvbl': {
      'pt': 'Logradouro:',
      'en': '',
    },
    'mj6z3wmc': {
      'pt': 'Complemento:',
      'en': '',
    },
    'pjuhywb8': {
      'pt': 'Bairro:',
      'en': '',
    },
    'r80i80cc': {
      'pt': 'Localidade',
      'en': '',
    },
    'mux52n5r': {
      'pt': 'UF:',
      'en': '',
    },
    'd6vh83qg': {
      'pt': 'IBGE:',
      'en': '',
    },
    'ljxbjdzb': {
      'pt': 'GIA:',
      'en': '',
    },
    '9fgaeek3': {
      'pt': 'DDD:',
      'en': '',
    },
    'xk2il46n': {
      'pt': 'SIAFI:',
      'en': '',
    },
    'o9u515vo': {
      'pt': 'Endere??o esta correto ?',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'k1ytj4lr': {
      'pt': '',
      'en': '',
    },
    'x2qerml6': {
      'pt': '',
      'en': '',
    },
    'v3t5kbt0': {
      'pt': 'Voc?? autorizar acessar seu arquivos?',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

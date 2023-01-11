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
      'pt': 'Usuários da Biblioteca Global',
      'en': '',
    },
    '6ejh87ap': {
      'pt': 'Regras',
      'en': 'Rules',
    },
    'gqd5a2sj': {
      'pt':
          'Bem vindo ao Projeto Global de Usuários flutterflow, um local para troca de código entre programadores.\n\nSiga as orientações para publicar páginas e funções.\n\nCrie um pasta para publicar suas páginas com seu apelido, não publique na pasta de outro usuário sem o concentimento do mesmo. Faça o mesmo para os componentes.\n\nCada página ou componente deve começar com seu apelido, exemplo \"dueuler_pedido\".\n\nAo adicionar funções, lembre-se de iniciar com seu apelido, exemplo \"dueulerTableInsert\".\n\nUse o mesmo apelido em suas publicações para sabermos a autoria.\n\nNão deixe este projeto com mensagem de erro.\n\nAproveite o conteúdo colaborativo a vontade.\n\nCadastre seu perfil na página de membros, adicione um ação que abra a pagina \"seuapelido_start\" esta página devera estar dentro da sua pasta \"seuapelido\", coloque sua foto e seus dados para contato nesta página.',
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
      'pt': 'Euler Magalhães Junior',
      'en': '',
    },
    'iki0o5lk': {
      'pt': 'Bambuí, Minas Gerais, Brasil',
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
          'Duplique o painel acima e coloque seus dados, faço seu cadastro, participe.',
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
      'pt': 'Euler Magalhães Junior',
      'en': '',
    },
    '1qr5g0ys': {
      'pt': 'Introdução FlutterFlow',
      'en': 'Firebase - Manipulate Firestore',
    },
    'm8v2twk5': {
      'pt': 'Firebase (Configuração)',
      'en': 'Firebase - Manipulate Firestore',
    },
    'an9j7625': {
      'pt': 'Versões e Rastaurações',
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
    '45g7slgn': {
      'pt':
          'Sempre que adicionar exemplos a sua página, não esqueça de adicionar aqui também para que todos possam visualziar.',
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
      'pt': 'Euler Magalhães Junior',
      'en': '',
    },
    'ylw6cagc': {
      'pt': 'Bambuí, Minas Gerais, Brasil',
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
      'pt': 'Valor da hora de serviço: ',
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
      'pt': 'Introdução FlutterFlow',
      'en': 'Firebase - Manipulate Firestore',
    },
    '9x2gn64e': {
      'pt': 'Firebase (Configuração)',
      'en': 'Firebase - Manipulate Firestore',
    },
    'gfpqymn4': {
      'pt': 'Versões e Rastaurações',
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
      'pt': 'Digite nome do usuário',
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
      'pt': 'Digite nome do usuário',
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
      'pt': 'Localizar',
      'en': '',
    },
    '97jmqt2c': {
      'pt': 'Localização',
      'en': '',
    },
    'y7dus40h': {
      'pt': '0.1',
      'en': '',
    },
    'vw69pqpz': {
      'pt': '0.3',
      'en': '',
    },
    'bjjgg7yn': {
      'pt': '0.5',
      'en': '',
    },
    '3vzbday6': {
      'pt': '1',
      'en': '',
    },
    'soxc97f9': {
      'pt': '5',
      'en': '',
    },
    'bttgovq8': {
      'pt': '10',
      'en': '',
    },
    'qt9iyitb': {
      'pt': '50',
      'en': '',
    },
    'n3rabzuy': {
      'pt': 'Distancia',
      'en': '',
    },
    '3fcb5aa4': {
      'pt': 'Exibir na consulta',
      'en': '',
    },
    'gtzndw8a': {
      'pt': 'Ver mapa',
      'en': '',
    },
    '7t1h26mg': {
      'pt': 'Geo Fire',
      'en': '',
    },
    '37a3dgob': {
      'pt': 'Home',
      'en': '',
    },
  },
  // dueulerEditUsuarioLocal
  {
    'in3jm5j1': {
      'pt': 'Digite nome do usuário',
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
      'pt': 'Digite nome do usuário',
      'en': '',
    },
    'q1hij3z5': {
      'pt': 'SAVE',
      'en': '',
    },
    'hbxyduw0': {
      'pt': 'Localizar endereço...',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

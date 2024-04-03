import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _listaHistrico =
          prefs.getStringList('ff_listaHistrico') ?? _listaHistrico;
    });
    _safeInit(() {
      _carregando = prefs.getBool('ff_carregando') ?? _carregando;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _listaHistrico = [];
  List<String> get listaHistrico => _listaHistrico;
  set listaHistrico(List<String> value) {
    _listaHistrico = value;
    prefs.setStringList('ff_listaHistrico', value);
  }

  void addToListaHistrico(String value) {
    _listaHistrico.add(value);
    prefs.setStringList('ff_listaHistrico', _listaHistrico);
  }

  void removeFromListaHistrico(String value) {
    _listaHistrico.remove(value);
    prefs.setStringList('ff_listaHistrico', _listaHistrico);
  }

  void removeAtIndexFromListaHistrico(int index) {
    _listaHistrico.removeAt(index);
    prefs.setStringList('ff_listaHistrico', _listaHistrico);
  }

  void updateListaHistricoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _listaHistrico[index] = updateFn(_listaHistrico[index]);
    prefs.setStringList('ff_listaHistrico', _listaHistrico);
  }

  void insertAtIndexInListaHistrico(int index, String value) {
    _listaHistrico.insert(index, value);
    prefs.setStringList('ff_listaHistrico', _listaHistrico);
  }

  bool _carregando = false;
  bool get carregando => _carregando;
  set carregando(bool value) {
    _carregando = value;
    prefs.setBool('ff_carregando', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

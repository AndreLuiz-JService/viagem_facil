import 'package:get/get.dart';
import 'package:viagem_facil/database/db.dart';
import 'package:viagem_facil/shared/models/itens_model.dart';
import 'package:viagem_facil/shared/models/malas_model.dart';

class MalasProntasController extends GetxController {
  var _malasList = [];
  get malasList => _malasList.obs;

  carregarMala() async {
    _malasList.clear();
    var db = await DB.get();
    List<Map> malas = await db.rawQuery("SELECT * FROM Mala ORDER BY ID DESC");

    for (var mala in malas) {
      List<ItensModel> _itensList = [];
      List<Map> itens = await db.rawQuery(
          "SELECT * FROM Item where Mala_ID = ${mala['ID']} ORDER BY ID");
      for (var item in itens) {
        _itensList.insert(
          0,
          ItensModel(
            categoria: item['Categoria'],
            id: item['ID'],
            idItemDaMala: item['Mala_ID'],
            nome: item['Nome'],
          ),
        );
      }
      _malasList.insert(
        0,
        MalasModel(id: mala['ID'], nome: mala['Nome'], itens: _itensList),
      );
    }
    update();
  }

  excluirMala(int id) async {
    var db = await DB.get();
    await db.delete(
      'Mala',
      where: "ID = ?",
      whereArgs: [id],
    );
    await db.delete(
      'Item',
      where: "Mala_ID = ?",
      whereArgs: [id],
    );
    _malasList.removeWhere((element) => element.id == id);
    Get.back();
    update();
  }
}

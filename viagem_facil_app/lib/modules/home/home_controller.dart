import 'package:get/get.dart';
import 'package:viagem_facil/database/db.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/models/publicacao_model.dart';

class HomeController extends GetxController {
  final user = Get.put(AuhtController());

  var publicacaoList = [].obs;

  carregarpublicacao() async {
    print(user.user.value.id);
    print('113371770494293951388');
    publicacaoList.clear();
    int quantidadeLike = 0;
    int quantidadeDeslikes = 0;
    int tipoCurtida = 0;
    var db = await DB.get();
    List<Map> publicacoes =
        await db.rawQuery("SELECT * FROM Publicacao  order by likes ");

    for (int i = 0; i < publicacoes.length; i++) {
      List<Map> likes = await db.rawQuery(
          "SELECT count (*) as count FROM Curtidas where tipo = 1 and ID_publicacao = ${publicacoes[i]['ID']}");
      for (var like in likes) {
        quantidadeLike = like['count'];
      }
      List<Map> deslikes = await db.rawQuery(
          "SELECT count (*) as count FROM Curtidas where tipo = -1 and ID_publicacao = ${publicacoes[i]['ID']}");
      for (var deslike in deslikes) {
        quantidadeDeslikes = deslike['count'];
      }
      List<Map> tipos = await db.rawQuery(
          "SELECT tipo FROM Curtidas where ID = ${user.user.value.id} and ID_publicacao = ${publicacoes[i]['ID']}");
      for (var tipo in tipos) {
        tipoCurtida = tipo['tipo'];
      }
      publicacaoList.insert(
        0,
        PublicacaoModel(
          title: publicacoes[i]['Nome'],
          tipo: tipoCurtida,
          likes: quantidadeLike,
          deslikes: quantidadeDeslikes,
          idPublicacao: publicacoes[i]['ID'],
          categoria: publicacoes[i]['Categoria'],
          nameUser: publicacoes[i]['Nome_user'],
          photoURL: publicacoes[i]['photo_URL'],
        ),
      );
      quantidadeLike = 0;
      quantidadeDeslikes = 0;
      tipoCurtida = 0;
    }

    update();
  }

  evaluatePost(int tipo, int tipo2, int iD_publicacao, int index) async {
    var db = await DB.get();
    if (tipo == 1) {
      if (tipo2 == 1) {
        await db.rawQuery(
            "Delete from curtidas  where Id = ${user.user.value.id} and ID_publicacao = $iD_publicacao");
        publicacaoList[index].tipo = 0;
        publicacaoList[index].likes += -1;
        await db.rawQuery(
            "UPDATE Publicacao set likes = ${publicacaoList[index].likes} where Id =  $iD_publicacao");
        update();
      } else if (tipo2 == -1) {
        await db.rawQuery(
            "UPDATE curtidas set tipo = 1 where Id = ${user.user.value.id} and ID_publicacao = $iD_publicacao");
        publicacaoList[index].tipo = 1;
        publicacaoList[index].likes +=  1;
        publicacaoList[index].deslikes +=  - 1;
        await db.rawQuery(
            "UPDATE Publicacao set likes = ${publicacaoList[index].likes} where Id =  $iD_publicacao");
        update();
      } else {
        db.insert('curtidas', {
          'ID': user.user.value.id,
          'ID_publicacao': iD_publicacao,
          'tipo': 1,
        });
        publicacaoList[index].likes += 1;
        publicacaoList[index].tipo = 1;
        await db.rawQuery(
            "UPDATE Publicacao set likes = ${publicacaoList[index].likes} where Id =  $iD_publicacao");
        update();
      }
    }
    if (tipo == -1) {
      if (tipo2 == -1) {
        await db.rawQuery(
            "Delete from curtidas  where Id = ${user.user.value.id} and ID_publicacao = $iD_publicacao");
        publicacaoList[index].tipo = 0;
        publicacaoList[index].deslikes +=- 1;
        
        update();
      } else if (tipo2 == 1) {
        await db.rawQuery(
            "UPDATE curtidas set tipo = -1 where Id = ${user.user.value.id} and ID_publicacao = $iD_publicacao");
        publicacaoList[index].tipo = -1;
        publicacaoList[index].likes += -1;
        publicacaoList[index].deslikes +=  1;
        await db.rawQuery(
            "UPDATE Publicacao set likes = ${publicacaoList[index].likes} where Id =  $iD_publicacao");
        update();
      } else {
        db.insert('curtidas', {
          'ID': user.user.value.id,
          'ID_publicacao': iD_publicacao,
          'tipo': -1,
        });
        publicacaoList[index].tipo = -1;
        publicacaoList[index].deslikes +=  1;
        update();
      }
    }
    
  }
}

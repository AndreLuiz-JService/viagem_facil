import 'package:get/get.dart';
import 'package:viagem_facil/shared/models/grid_view_model.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';

class ItensEDocumentacaoController extends GetxController {
  List<GridViewModel> gridViewListItensEssencias = [
    GridViewModel(
        cor: AppColors.primary,
        icon: AppImages.icone_guardaChuva,
        text: 'Praia',
        imagem: AppImages.imagen_praia),
    GridViewModel(
        cor: AppColors.fundoIconVermelho,
        icon: AppImages.icone_termometro,
        text: 'Verão',
        imagem: AppImages.imagen_verao),
    GridViewModel(
        cor: AppColors.fundoIconVerde,
        icon: AppImages.icone_fogueira,
        text: 'Acampamento',
        imagem: AppImages.imagen_acampamento),
    GridViewModel(
        cor: AppColors.fundoIconAzul,
        icon: AppImages.icone_flocoDeNeve,
        text: 'Inverno',
        imagem: AppImages.imagen_inverno),
    GridViewModel(
        cor: AppColors.fundoIconLaranja,
        icon: AppImages.icone_cachoeira,
        text: 'Cachoeira',
        imagem: AppImages.imagen_cachoeira),
    GridViewModel(
        cor: AppColors.fundoIconRoxo,
        icon: AppImages.icone_parque,
        text: 'Parques',
        imagem: AppImages.imagen_parque)
  ];

  List<GridViewModel> gridViewDocumentos = [
    GridViewModel(
      cor: AppColors.fundoIconRoxo,
      imagem: AppImages.imagem_onibus,
      cor2: AppColors.fundoRoxo,
      icon: AppImages.icone_onibus,
      text: 'Ônibus',
      text2: 'Nacionais',
      title: 'Ônibus : Viagens Nacioanais',
      textObrigatorio: '• Carteira de Identidade \n• CPF \n• Bilhete do ônibus \n• Máscara de proteção',
      textSugestao: '• Travesseiro de pescoço \n• Cobertor \n• Dinheiro extra \n• Lanches pequenos \n• Fone de ouvido'
    ),
    GridViewModel(
      cor: AppColors.fundoIconVermelho,
      imagem: AppImages.imagem_onibus_internacional,
      cor2: AppColors.fundoVermelho,
      icon: AppImages.icone_onibus,
      text: 'Ônibus',
      text2: 'Internacionais',
      title: 'Ônibus : Viagens Internacionais',
      textObrigatorio: '• Carteira de Identidade \n• CPF \n• Bilhete do ônibus \n• Passa Porte \n• Visto \n• Máscara de proteção',
      textSugestao: '• Travesseiro de pescoço \n• Cobertor \n• Dinheiro extra \n• Lanches pequenos \n• Fone de ouvido'
    ),
    GridViewModel(
      cor: AppColors.fundoIconVerde,
      imagem: AppImages.imagem_aviao,
      cor2: AppColors.fundoVerde,
      icon: AppImages.icone_aviao,
      text: 'Avião',
      text2: 'Nacionais',
      title: 'Avião : Viagens Nacionais',
      textObrigatorio: '• Carteira de Identidade \n• CPF \n• Passagem aérea \n• Máscara de proteção',
      textSugestao: '• Travesseiro de pescoço \n• Cobertor \n• Dinheiro extra \n• Lanches pequenos \n• Fone de ouvido'
    ),
    GridViewModel(
      cor: AppColors.fundoIconAzul,
      imagem: AppImages.imagem_avioes_internacionais,
      cor2: AppColors.fundoAzul,
      icon: AppImages.icone_aviao,
      text: 'Avião',
      text2: 'Internacionais',
      title: 'Avião : Viagens Internacionais',
      textObrigatorio: '• Carteira de Identidade \n• CPF \n• Paagem aérea  \n• Passa Porte \n• Visto \n• Máscara de proteção',
      textSugestao: '• Travesseiro de pescoço \n• Cobertor \n• Dinheiro extra \n• Lanches pequenos \n• Fone de ouvido'

    )
  ];

  Rx<bool> _varToggleButton = true.obs;
  get varToggleButton => _varToggleButton;

  toggleButtons() {
    _varToggleButton.value = !_varToggleButton.value;
    update();
  }
}

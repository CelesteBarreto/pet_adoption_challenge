import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskCLass {
  var telefone = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
  var cpf = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
  var rg =
      MaskTextInputFormatter(mask: '##.###.###-#', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
}

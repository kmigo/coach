import 'package:coach/components/custom_show_modal_bottom_sheet.dart';
import 'package:coach/modules/home/pages/create_thought/create_thought.dart';

Future<T?> bottomSheetCreateThought<T>() async {
  return await customShowModalBottomSheet(const CreateThought());
}

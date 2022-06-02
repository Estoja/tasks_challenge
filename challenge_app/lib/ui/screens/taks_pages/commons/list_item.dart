import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:challenge_app/ui/screens/taks_pages/enums/tasks_enumerables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final String name;
  final int price;
  final TaskState taskState;

  const ListItem({
      Key? key,
      required this.image,
      required this.name,
      required this.price,
      this.taskState = TaskState.standby
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                BcAvatar(
                  image: image,
                  size: BcSizeType.Default,
                ),
                Column(
                  children: [
                    BcText.h5(label: name),
                    BcText.h5(label: 'Precio: \u0024$price')
                  ],
                ),
                const Spacer(),
                BcIconBtn(
                  onPressed: () {},
                  icon: _getStatusValue(),
                  sizeType: BcSizeType.Puffy,
                ),
                const SizedBox(width: 10),
              ],
            );
  }

  IconData _getStatusValue() {
    IconData icon = BcFunctionalIcons.FACE_SAD;
    switch(taskState) {
      case (TaskState.standby):
      icon = BcFunctionalIcons.ARROW2_RIGHT;
      break;

      case (TaskState.success):
      icon = BcFunctionalIcons.OK;
      break;

      case (TaskState.canceled):
      icon = BcFunctionalIcons.ERROR;
      break;

      default:
      break;
    }
    return icon;
  }

}
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class DownloadItem extends StatelessWidget {
  const DownloadItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.17,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: ColorPicker.colorScheme1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: ClipOval(
                child: Material(
                  color: ColorPicker.colorScheme4,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.file_download)),
                ),
              ),
            )),
            const Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Youtube video free download',
                      style: TextStyle(
                          fontSize: 15.5, overflow: TextOverflow.ellipsis),
                    ),
                    Column(
                      children: [
                        LinearProgressIndicator(
                          value: 0.5,
                          minHeight: 8,
                          color: ColorPicker.colorScheme4,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('300kb'),
                            Text('10Mb'),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              width: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

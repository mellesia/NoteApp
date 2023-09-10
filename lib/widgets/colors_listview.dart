import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import 'constant.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color})
      : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 32,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 34,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
          itemCount: Kcolors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = Kcolors[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: Kcolors[index],
                  isActive: currentIndex == index,
                ),
              ),

              //  ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //         context: context,
              //         builder: (BuildContext context) {
              //           return AlertDialog(
              //             title: Text('Pick a color!'),
              //             content: SingleChildScrollView(
              //               child: MultipleChoiceBlockPicker(
              //                 pickerColors: [
              //                   Colors.red,
              //                   Colors.orange
              //                 ], //default color
              //                 onColorsChanged: (List<Color> colors) {
              //                   //on colors picked
              //                   print(colors);
              //                 },
              //               ),
              //             ),
              //             actions: <Widget>[
              //               ElevatedButton(
              //                 child: const Text('DONE'),
              //                 onPressed: () {
              //                   Navigator.of(context)
              //                       .pop(); //dismiss the color picker
              //                 },
              //               ),
              //             ],
              //           );
              //         });
              //   },
              //   child: Text("Multiple Choice Color Picker"),
              // ),
            );
          }),
    );
  }
}

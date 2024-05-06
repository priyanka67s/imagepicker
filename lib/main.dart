import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme :ThemeData(
        primarySwatch: Colors.yellow,),
      debugShowCheckedModeBanner: false,
      home : ImagePickerWidget(),
      //FetchData(),

    );
  }
}
// class FetchData extends StatefulWidget {
//   const FetchData({super.key});
//
//   @override
//   State<FetchData> createState() => _FetchDataState();
// }
//
// class _FetchDataState extends State<FetchData> {
//   File? picture;
//   Future pickImageG() async{
//     try{
//       final imaged = await ImagePicker().pickImage(source:ImageSource.gallery);
//       final imageTemp =File(imaged!.path);
//       setState(() {
//         picture = imageTemp;
//       });
//     }catch(e){}
//   }
//
//   Future pickImageC() async {
//     try {
//       final imaged = await ImagePicker().pickImage(source: ImageSource.camera);
//       final imageTemp = File(imaged!.path);
//       setState(() {
//         picture = imageTemp;
//       });
//     }
//     catch (e) {}
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker', style: TextStyle(color: Colors.purpleAccent[200]),),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 20,),
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: picture!= null?FileImage(picture!):null,
//               child:picture==null? Text('No Image'):null,
//             ),
//             SizedBox(height: 20,),
//             ElevatedButton(onPressed: (){
//               pickImageG();
//             }, child: Text('From Gallery'),),
//             ElevatedButton(onPressed: (){
//               pickImageC();
//             }, child: Text('From Camera')),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  final picker = ImagePicker();

  Future getImageG() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageC() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}



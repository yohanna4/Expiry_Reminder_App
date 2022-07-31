import 'dart:ui';

import 'package:expiry_reminder/provider/constants.dart';
import 'package:expiry_reminder/widgets/customButton.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  late String _selectedValue;

  String? _email;
  String? _password;
  String? _confrimPassword;
  bool obsecurePassword = true;
  bool obsecurePasswordConfrim = true;
  String quantity = "1";
  var catagories = [
    'Document',
    'Food/Drinks',
    'Task',
    'Event',
    'Medicine',
  ];
  static String? catagory = 'Document';
  TextEditingController dateinput = TextEditingController();
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      final imageTemporary = await saveImagePermanently(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  // final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          "Item Detail",
          // style: TextStyle(fontFamily: fontf),
        ),
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          IconButton(
            onPressed: () {
              pickImage(ImageSource.gallery);
            },
            icon: const Icon(
              Icons.attachment,
              size: 25,
            ),
          )
          // AddPhotoWidget(),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText("TIMEZONE"),

          // ignore: prefer_const_constructors

          const SizedBox(height: 10),
          itemForm(),
          const SizedBox(height: 20),
          Container(
              child: image != null
                  ? Image.file(
                      image!,
                      width: 270,
                      height: 270,
                    )
                  : Text("data")),
          Center(
            child: CustomButton(
              width: MediaQuery.of(context).size.width - 42,
              inputText: "SUBMIT",
              onPressed: () {},
              height: 45,
            ),
          ),
        ],
      )),
    );
  }

  Widget itemForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Item Name",
                border: OutlineInputBorder(),
              ),
              onChanged: (newValue) => _email = newValue,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              icon:
                  Visibility(visible: false, child: Icon(Icons.arrow_downward)),
              value: catagory,
              hint: Text(
                'Maker',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  catagory = value.toString();
                });
              },
              onSaved: (value) {
                setState(() {
                  catagory = value.toString();
                });
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "can't empty";
                } else {
                  return null;
                }
              },
              items: catagories.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: "Catagory",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(),
              ),
              initialValue: quantity,
              onChanged: (newValue) => quantity = newValue,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: dateinput, //editing controller of this TextField
              decoration: InputDecoration(
                //icon of text field
                labelText: "Expiry Date",
                border: OutlineInputBorder(), //label text of field
              ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: this.context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime
                        .now(), //DateTime(                      2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            )
          ])),
    );
  }
}

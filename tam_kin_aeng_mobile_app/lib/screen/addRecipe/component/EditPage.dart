import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tam_kin_aeng_mobile_app/component/my_bottom_nav_bar.dart';
import 'package:tam_kin_aeng_mobile_app/screen/home/component/body.dart';
import 'package:tam_kin_aeng_mobile_app/size_config.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:tam_kin_aeng_mobile_app/screen/addRecipe/addRecipe.dart';

class EditPage extends StatefulWidget {

  DocumentSnapshot docToEdit;
  EditPage({this.docToEdit});


  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  String _ingredient;
  String _category;
  String _level;
  String _cookingStep;
  String _Time;

  TextEditingController _foodname = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  void initState() {
    _foodname = TextEditingController(text: widget.docToEdit.data()['name']);
    _description = TextEditingController(text: widget.docToEdit.data()['description']);
    IngredientList = List.from(widget.docToEdit.data()['ingredient']);
    CookingStepList = List.from(widget.docToEdit.data()['cookingStep']);

    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildFoodNameField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _foodname,
            decoration: InputDecoration(
              labelText: 'Food Name',
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill your food name';
              } else
                return null;
            },
            onSaved: (String value) {
              _foodname = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _description,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please fill your description';
              } else
                return null;
            },
            onSaved: (String value) {
              _description = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }


  List IngredientList = [];
  TextEditingController IngredientController = TextEditingController();

  void addIngredientToList() {
    setState(() {
      IngredientList.insert(0, IngredientController.text);
    });
  }

  Widget _buildIngredientField() {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: IngredientController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingredient',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please tell me the ingredients';
                  } else
                    return null;
                },
                onSaved: (String value) {
                  _ingredient = value;
                },
              ),
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                addIngredientToList();
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              title:
              Text(IngredientList.toString().replaceAll('{', '').replaceAll('}', '').replaceAll('[', '').replaceAll(']', ''), style: TextStyle(fontSize: 20)),
            ),
          ],
        ));
  }

  List listCategoryItem = ["Thai", "Indian", "Italian", "Global"];
  Widget _buildCategoryField() {
    return Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton(
                hint: Text("Category"),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 22),
                value: _category,
                onChanged: (newValue) {
                  setState(() {
                    _category = newValue;
                  });
                },
                items: listCategoryItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  List listLevelItem = ["Easy", "Medium", "Hard"];
  Widget _buildLevelField() {
    return Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton(
                hint: Text("Level"),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 22),
                value: _level,
                onChanged: (newValue) {
                  setState(() {
                    _level = newValue;
                  });
                },
                items: listLevelItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  List CookingStepList = [];
  TextEditingController CookingStepController = TextEditingController();
  TextEditingController TimeController = TextEditingController();
  void addCookingStepToList() {
    setState(() {
      CookingStepList.add({
        'value':CookingStepController.text,
        'time':TimeController.text,});
    });
  }

  Widget _buildCookingStep() {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
            children: [
            TextFormField(
            controller: CookingStepController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cooking Step',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please tell me the cooking step';
                  } else
                    return null;
                },
                onSaved: (String value) {
                  _cookingStep = value;
                }),
            TextFormField(
                controller: TimeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Time',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please tell me the Time';
                  } else
                    return null;
                },
                onSaved: (String value) {
                  _Time = value;
                }),
          ],
        ),


            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                addCookingStepToList();
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              title:
              Text(CookingStepList.toString().replaceAll('{', '').replaceAll('}', '').replaceAll('[', '').replaceAll(']', ''), style: TextStyle(fontSize: 20)),
            ),
          ],
        ));
  }

  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  File _image;
  String _uploadedFileURL;
  final picker = ImagePicker();
  Future _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    print(_image);
  }
  chooseImage() {
    setState(() {
      file = ImagePicker.platform.pickImage(source: ImageSource.gallery)
      as Future<File>;
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = file.toString();
    String url;
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(await file);
    await uploadTask.whenComplete(() async => {
    url = await uploadTask.snapshot.ref.getDownloadURL()});


    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    uid = auth.currentUser.uid.toString();
    users.doc(uid).collection('AddRecipe').add({'imgURL': url});
    return url;
  }
  Widget _buildChooseImageField() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OutlineButton(
            onPressed: _pickImage,
            child: Text('Choose Image'),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  static String uid;
  Future<String> getUID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    uid = auth.currentUser.uid.toString();
    users.doc(uid).get();

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFoodNameField(),
            _buildDescriptionField(),
            _buildIngredientField(),
            _buildCategoryField(),
            _buildLevelField(),
            _buildCookingStep(),
            _buildChooseImageField(),
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    uid = await getUID();
                    String url;
                    if(_image != null) {
                      String fileName = uid + DateTime
                          .now()
                          .microsecond
                          .toString();
                      Reference firebaseStorageRef =
                      FirebaseStorage.instance.ref().child('uploads/$fileName');
                      UploadTask uploadTask = firebaseStorageRef.putFile(_image);
                      await uploadTask.whenComplete(() async =>
                      {
                        print(uploadTask.snapshot.ref),
                        url = await uploadTask.snapshot.ref.getDownloadURL(),
                      });
                    };
                    widget.docToEdit.reference.update({
                      'name': _foodname.text, //field
                      'description': _description.text, //field
                      'ingredient': IngredientList,
                      'cuisine': _category.toString(), //dropdown
                      'difficulty': _level.toString(), //dropdown
                      'cookingStep': CookingStepList,
                      'imgUrl': url,
                    }).whenComplete(() => Navigator.pop(context));
                  },
                ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  RaisedButton(
                  color: Colors.red,
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                    widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));
                  },
                ),]),

          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          //back icon go back to add recipe body
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddRecipe()));
          },
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset("assets/images/logoRevised.png",
          height: 37,),
        actions: <Widget>[
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}

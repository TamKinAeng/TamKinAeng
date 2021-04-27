import 'dart:ffi';
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

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
        children: [
          sLineTextField(),
          mLineTextField(),
          iInteractList(),
          cDropDownButton(),
          lDropDownButton(),
          cInteractList(),
          UploadImage(),
          SaveRecipe(),
        ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }



// Refactor -> Extract method from AppBar
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // This is icons and logo on our app bar
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          //back icon go back to add recipe body
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddRecipe()));},
        ),
        // On Android by default its false
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        actions: <Widget>[
          SizedBox(
            // It means 5 because by out defaultSize = 10
            width: SizeConfig.defaultSize * 0.5,
          )
        ]);
  }
}

// Multi-line text field widget for description
// StatefulWidget is a widget that has mutable state.
class mLineTextField extends StatefulWidget {
  mLineTextField({Key key}) : super(key: key);

  @override
  createState() => _MultiTextFieldState();

}
class sLineTextField extends StatefulWidget {
  sLineTextField({Key key}) : super(key: key);

  @override
  createState() => _SingleTextFieldState();

}
// It is the logic for 'StatefulWidget'
class _MultiTextFieldState extends State<mLineTextField> {

  final TextEditingController _multilineTextFieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
          )
        ],
      ),
    );
  }
}
class _SingleTextFieldState extends State<sLineTextField> {

  final TextEditingController _singleTextFieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Food Name',
            ),
          )
        ],
      ),
    );
  }
}

class cDropDownButton extends StatefulWidget {
  cDropDownButton({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _cDropDownState createState() => _cDropDownState();
}

class _cDropDownState extends State<cDropDownButton>{
  String valueChoose;
  List listItem = ["Thai","Indian","Italian","Global"];
 @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15)
            ),
            child: DropdownButton(
              hint: Text("Catagory"),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              underline: SizedBox(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22
              ),
              value: valueChoose,
              onChanged: (newValue){
                setState(() {
                  valueChoose = newValue;
                });
              },
              items: listItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ),
      )
    );
  }
}

class lDropDownButton extends StatefulWidget {
  lDropDownButton({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _lDropDownState createState() => _lDropDownState();
}

class _lDropDownState extends State<lDropDownButton>{
  String valueChoose;
  List listItem = ["Easy","Medium","Hard"];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: DropdownButton(
                hint: Text("Level"),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22
                ),
                value: valueChoose,
                onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
          ),
        )
    );
  }
}

class iInteractList extends StatefulWidget {
  iInteractList({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _iInteractListState createState() => _iInteractListState();
}

class _iInteractListState extends State<iInteractList> {
  final List names = ['Apple','Chicken','Pork'];



  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingredient',
              ),
            ),
          ),
          RaisedButton(

            child: Text('Add'),
            onPressed: () {
              addItemToList();
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
            title: Text(names.toString(), style: TextStyle(fontSize: 20)),
          ),
        ],
      )
    );
  }
}

class cInteractList extends StatefulWidget {
  cInteractList({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _cInteractListState createState() => _cInteractListState();
}

class _cInteractListState extends State<cInteractList> {
  final List names = ['“In a small pot, stir oats, milk, berries, cinnamon, vanilla extract, maple syrup, and salt over medium high heat.”'];


  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cooking Step',
                ),
              ),
            ),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {
                addItemToList();
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              title: Text(names.toString(), style: TextStyle(fontSize: 20)),
            ),
          ],
        )
    );
  }
}

class UploadImage extends StatefulWidget {
  UploadImage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _UploadImageState createState() => _UploadImageState();
}
class _UploadImageState extends State<UploadImage> {
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      file = ImagePicker.platform.pickImage(source: ImageSource.gallery) as Future<File>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OutlineButton(
            onPressed: chooseImage,
            child: Text('Choose Image'),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
class SaveRecipe extends StatefulWidget {
  SaveRecipe({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SaveRecipeState createState() => _SaveRecipeState();
}

class _SaveRecipeState extends State<SaveRecipe> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.green,
          child: Text('Save',style: TextStyle(
            color: Colors.white
          ),),
          onPressed: () {

          },
        ),
      ],
    ),
    );
  }
}
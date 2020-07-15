import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnSaveCallBack = Function(File image, String description);

class PhotoUpload extends StatefulWidget {
  final OnSaveCallBack onSaveCallBack;

  const PhotoUpload({Key key, @required this.onSaveCallBack}) : super(key: key);

  @override
  _PhotoUploadState createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  File sampleImage;
  String descriptin;
  _PhotoUploadState createState() => _PhotoUploadState();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload"),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null ? Text("Select an Image") : enableUpdate(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Add Image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }

  Widget enableUpdate() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Image.file(
                    sampleImage,
                    height: 300,
                    width: 600.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Descrption"),
                    validator: (value) {
                      return value.isEmpty ? "Description is required" : null;
                    },
                    onSaved: (value) {
                      return descriptin = value;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    onPressed: uploadPost,
                    elevation: 10.0,
                    child: Text("Add a new Post"),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void uploadPost() {
    if (validateAndSave()) {
      widget.onSaveCallBack(sampleImage, descriptin);
      Navigator.pop(context);
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

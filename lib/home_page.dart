//Main Home Page for classification

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable_app/drawer.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? _outputs;
  File? _image;
  bool _loading = false;
  String? ip;
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loading = true;
    //ip = widget.imagepath;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/Model/float16_optimised_model_Inceptionv3_new.tflite",
      labels: "assets/Model/ImageLabels.txt",
      numThreads: 4,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 224.0,
      numResults: 5,
      threshold: 0.1,
      asynch: true,
    );
    print(output);
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    // ignore: deprecated_member_use
    final image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(File(image.path));
  }

  galleryImage() async {
    // ignore: deprecated_member_use
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Freshness Detection',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _loading
                  ? const SizedBox(
                      height: 300,
                      width: 300,
                    )
                  : Container(
                      margin: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _image == null ? Container() : Image.file(_image!),
                          const SizedBox(
                            height: 20,
                          ),
                          _image == null
                              ? Container()
                              : _outputs != null
                                  ? Text(
                                      _outputs?[0]["label"],
                                      style: const TextStyle(
                                          color: Color(0xff196F3D),
                                          fontSize: 20),
                                    )
                                  : Container(child: Text(""))
                        ],
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ElevatedButton(
                  //   child: const Icon(
                  //     Icons.add_a_photo,
                  //     color: Colors.white,
                  //     size: 30,
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.blue,
                  //     minimumSize: const Size(60, 60.0),
                  //     side: const BorderSide(width: 1.0, color: Colors.white),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30.0),
                  //     ),
                  //     textStyle: const TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   onPressed: pickImage,
                  // ),
                  // const SizedBox(
                  //   width: 80.0,
                  // ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.folder,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: const Text(
                      "Choose image",
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: const Size(250, 60.0),
                      side: const BorderSide(width: 2.0, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 17.0,
                        fontFamily: "Comfortaa",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: galleryImage,
                  ),
                ],
              )
            ],
          ),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}

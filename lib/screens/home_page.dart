import 'dart:io';
import 'dart:math';

import 'package:festval_post/screens/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/globals.dart';
import '../utils/quotes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Random random = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.QuotsData = quotelist.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int RandomIndex = random.nextInt(Global.QuotsData.length);
    Quotes quotes = Global.QuotsData[RandomIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    elevation: 5,
                    title: Text("${quotes.quote}"),
                    content: Text("- ${quotes.festival}"),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                  "Pick an Image",
                                  style: TextStyle(fontSize: 16),
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          // Capture a photo.
                                          image = await picker.pickImage(
                                              source: ImageSource.camera);
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.camera_alt)),
                                    IconButton(
                                        onPressed: () async {
                                          image = await picker.pickImage(
                                              source: ImageSource.gallery);
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.photo))
                                  ],
                                ),
                              ),
                            );
                          },
                          child: (image == null)
                              ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://play-lh.googleusercontent.com/OYJDdcUuFsdGXXaQXcMmcKrGLuPy7jRUrpIxZ6FePJz8P5i4pOGN2saddTbo-ykD7Fg"),
                                  fit: BoxFit.cover),
                            ),
                          )
                              : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(
                                    File(
                                      "${image?.path}",
                                    ),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            Global.name = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Name First";
                            }
                          },
                          controller: Global.nameController,
                          decoration: InputDecoration(
                            hintText: "name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            Global.email = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Email First";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          controller: Global.emailController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data is Saved...."),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pushReplacementNamed(
                                  context, 'Quote screen');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Data is Missing",
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: const Text("Submit"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Global.nameController.clear();
                              Global.emailController.clear();
                              image = null;
                              setState(() {});
                            },
                            child: const Text("Clear.."))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
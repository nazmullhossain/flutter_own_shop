import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/const/utils.dart';

import '../../const/global_varriable.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field.dart';
import '../services/admin_services.dart';

class AddProductAdminPage extends StatefulWidget {
  const AddProductAdminPage({Key? key}) : super(key: key);
  static const String routeName = "/add-product";
  @override
  State<AddProductAdminPage> createState() => _AddProductAdminPageState();
}

class _AddProductAdminPageState extends State<AddProductAdminPage> {
  final TextEditingController _productNameContorller = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
final AdminServices adminServices=AdminServices();
  @override
  void dispose() {
    // TODO: implement dispose
    _productNameContorller.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }
  final _addProductFormKey=GlobalKey<FormState>();
List<File>images=[];
  String catgories = "Mobiles";
  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "AppLiances0",
    "Books",
    "Fashion"
  ];
  void sellProduct(){
if(_addProductFormKey.currentState!.validate() && images.isNotEmpty){
  adminServices.sellProduct(context: context,
      name: _productNameContorller.text,
      description: _descriptionController.text,
      price: double.parse(_priceController.text),
      quantity:double.parse(_quantityController.text),
      category: catgories,
      images: images);
}
  }
  void selectImages()async{
    var res=await pickImage();
    setState(() {
images=res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
              centerTitle: true,
              flexibleSpace: Container(
                decoration:
                    const BoxDecoration(gradient: GlobalVariables.appBarGradiant),
              ),
              title: const Text(
                "Add Product",
                style: TextStyle(color: Colors.black),
              )),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
               images.isNotEmpty?
               CarouselSlider(
                   items: images.map((e) {
                     return Builder(builder: (BuildContext conext)=>Image.file(e,fit: BoxFit.cover,height: 200,));
                   }).toList(), options: CarouselOptions(
                   height: 180)
               )

                   :GestureDetector(
                    onTap: selectImages,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: [10, 4],
                      strokeCap: StrokeCap.round,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.folder_open_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Select Product Images",
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomField(
                    controller: _productNameContorller,
                    hintText: 'Product Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomField(
                    controller: _descriptionController,
                    maxLines: 7,
                    hintText: 'Descripiton',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomField(
                    controller: _priceController,
                    hintText: 'Price',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomField(
                    controller: _quantityController,
                    hintText: 'Quantity',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: catgories,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: productCategories.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          catgories = newVal!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomButtonWidget(
                    text: 'Send',
                    onTap: () { sellProduct() ;},),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),
        ));
  }
}

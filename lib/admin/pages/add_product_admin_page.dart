import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../const/global_varriable.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_text_field.dart';

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

  @override
  void dispose() {
    // TODO: implement dispose
    _productNameContorller.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String catgories = "Mobiles";
  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "AppLiances0",
    "Books",
    "Fashion"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
              centerTitle: true,
              flexibleSpace: Container(
                decoration:
                    BoxDecoration(gradient: GlobalVariables.appBarGradiant),
              ),
              title: Text(
                "Add Product",
                style: TextStyle(color: Colors.black),
              )),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
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
                        children: [
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
                  SizedBox(
                    height: 30,
                  ),
                  CustomField(
                    controller: _productNameContorller,
                    hintText: 'Product Name',
                  ),
                  SizedBox(
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
                    onTap: () {  },),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),
        ));
  }
}

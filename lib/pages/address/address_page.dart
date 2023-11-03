import 'package:example1/controller/auth_controller.dart';
import 'package:example1/controller/location_controller.dart';
import 'package:example1/controller/user_controller.dart';
import 'package:example1/models/address_model.dart';
import 'package:example1/routes/route_helper.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:example1/widgets/app_text_field.dart';
import 'package:example1/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initialPosition = LatLng(45.51563, -122.677433);

  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    //this error come becoz getaddress cann't fint the addres
    //LateInitializationError: Field '_position@50473486' has not been initialized.
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      //Get.find<LocationController>().getUserAddress();
      _cameraPosition = CameraPosition(
          target: LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        (double.parse(Get.find<LocationController>().getAddress["longitude"])),
      ));
      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        (double.parse(Get.find<LocationController>().getAddress["longitude"])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          if (userController.userModel != null &&
              _contactPersonName.text.isEmpty) {
            _contactPersonName.text = '${userController.userModel?.name}';
            _contactPersonNumber.text = '${userController.userModel?.phone}';

            if (Get.find<LocationController>().addressList.isNotEmpty) {
              _addressController.text =
                  Get.find<LocationController>().getUserAddress().address;
            }
          }

          return GetBuilder<LocationController>(builder: (locationController) {
            _addressController.text =
                '${locationController.placemark.name ?? ''}'
                '${locationController.placemark.locality ?? ''}'
                '${locationController.placemark.postalCode ?? ''}'
                '${locationController.placemark.country ?? ''}';
            print("address in my view is " + _addressController.text);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 2,
                        color: AppColors.mainColor,
                      ),
                    ),
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: _initialPosition, zoom: 17),
                          zoomControlsEnabled: false,
                          compassEnabled: false,
                          indoorViewEnabled: true,
                          mapToolbarEnabled: false,
                          myLocationEnabled: true,
                          onCameraIdle: () {
                            locationController.updatePosition(
                                _cameraPosition, true);
                          },
                          onCameraMove: ((position) =>
                              _cameraPosition = position),
                          onMapCreated: (GoogleMapController controller) {
                            locationController.setMapController(controller);
                          },
                        ),
                      ],
                    ),
                  ),

                  //addressTypeList .length
                  Padding(
                    padding: EdgeInsets.only(
                        left: Dimension.width20, top: Dimension.height20),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: locationController.addressTypeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              locationController.setAddressTypeIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimension.width20,
                                  vertical: Dimension.height10),
                              margin: EdgeInsets.only(right: Dimension.width10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimension.radius20 / 4),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200]!,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Icon(
                                index == 0
                                    ? Icons.home
                                    : index == 1
                                        ? Icons.work
                                        : Icons.location_on,
                                color:
                                    locationController.addressTypeList == index
                                        ? AppColors.mainColor
                                        : Theme.of(context).disabledColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Dimension.height20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.height20),
                    child: BigText(text: "Delivery Address"),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AppTextField(
                      textController: _addressController,
                      hintText: "your address ",
                      icon: Icons.map),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.height20),
                    child: BigText(text: "Contact Name"),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AppTextField(
                      textController: _contactPersonName,
                      hintText: "your Name ",
                      icon: Icons.person),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.height20),
                    child: BigText(text: "Contact Number"),
                  ),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  AppTextField(
                      textController: _contactPersonNumber,
                      hintText: "your Number ",
                      icon: Icons.phone),
                ],
              ),
            );
          });
        },
      ),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (locationController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Dimension.height20 * 8,
                padding: EdgeInsets.only(
                  top: Dimension.height30,
                  bottom: Dimension.width30,
                  left: Dimension.width20,
                  right: Dimension.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonbackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.radius20 * 2),
                      topRight: Radius.circular(Dimension.radius20 * 2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height20,
                          bottom: Dimension.height10,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          AddressModel _addressModel = AddressModel(
                            addressType: locationController.addressTypeList[
                                locationController.addressTypeIndex],
                            contactPersonName: _contactPersonName,
                            contactPersonNumber: _contactPersonNumber,
                            address: _addressController.text,
                            latitude: locationController.position.toString(),
                            longitude: locationController.position.toString(),
                          );
                          //this line i have added to maintain the routing performaince
                          //i.e why it go to desired page
                          Get.offNamed(
                              RouteHelper.getRecommendedFood(4, 'home'));

                          locationController
                              .addAddress(_addressModel)
                              .then((response) {
                            print(response.isSuccess);
                            if (response.isSuccess) {
                              Get.back();
                              Get.snackbar("Address", "Added Successfully");
                            } else {
                              Get.snackbar('Address', "Couldn't save address");
                            }
                          });
                        },
                        child: BigText(
                          text: "Save address",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

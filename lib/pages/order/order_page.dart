import 'package:example1/controller/auth_controller.dart';
import 'package:example1/controller/order_controller.dart';
import 'package:example1/pages/order/view_order.dart';
import 'package:example1/utilites/colors.dart';
import 'package:example1/utilites/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}):super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
    //   Get.find<OrderController>().currentOrderList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order"),
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          Container(
            // height: 300,
            width: Dimension.screenWidth,
            child: TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                indicatorWeight: 1,
                labelColor: AppColors.mainColor,
                unselectedLabelColor: AppColors.yellowColor,
                controller: _tabController,
                tabs: [
                  Tab(text: 'Current'),
                  Tab(text: 'History'),
                ]),
          ),
          Container(
            child: TabBarView(controller: _tabController, children: const [
           //   ViewOrder(isCurrent: true),
           //   ViewOrder(isCurrent: false),
            ]),
          )
        ],
      ),
    );
  }
}

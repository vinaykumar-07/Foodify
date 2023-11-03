
import 'package:example1/models/address_model.dart';

class OrderModel {
  late int id;
  late int userId;
  double? orderAmount;
  String? orderStatus;

  String? paymentStatus;
  double? totalTaxAmount;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  double? deliveryCharge;
  String? scheduledAt;
  String? otp;
  String? pending;
  String? accepted;
  String? confirmed;
  String? processing;
  String? handover;
  String? pickedUp;
  String? delivered;
  String? canceled;
  String? refundRequested;
  String? refunded;
  int? scheduled;
  String? failed;
  int? detailsCount;
  AddressModel? deliveryAddress;

  OrderModel(
      {required this.id,
      required this.userId,
      this.orderAmount,
      this.paymentStatus,
      this.orderNote,
      this.createdAt,
      this.updatedAt,
      this.accepted,
      this.canceled,
      this.confirmed,
      this.delivered,
      this.deliveryAddress,
      this.deliveryCharge,
      this.detailsCount,
      this.failed,
      this.handover,
      this.orderStatus,
      this.otp,
      this.pending,
      this.pickedUp,
      this.processing,
      this.refundRequested,
      this.refunded,
      this.scheduled,
      this.scheduledAt,
      this.totalTaxAmount});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'].toDouble();
    paymentStatus = json['payment_status'] ?? "pending";
    totalTaxAmount = 10.0;
    orderNote = json['order_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderStatus = json['order_status'];
    deliveryCharge = 10.0;
    scheduledAt = json['scheduled_at'] ?? "";
    otp = json['otp'];
    pending = json['pending'] ?? "";
    accepted = json['accepted'] ?? "";
    confirmed = json['confirmed'] ?? "";
    processing = json['processing'] ?? "";
    handover = json['handover'] ?? "";
    pickedUp = json['picked_up'] ?? "";
    delivered = json['dilevered'] ?? "";
    canceled = json['canceled'] ?? "";
    scheduled = json['scheduled'] ?? "";
    failed = json['failed'] ?? "";
    detailsCount = json['details_count'];
    deliveryAddress = (json['delivery_address'] != null
        ? new AddressModel.fromJson(json['delivery_address'])
        : null)!;


        Map<String,dynamic> toJson(){
          final Map<String,dynamic> data=new Map<String,dynamic>();
          return data;
        }
  }
}

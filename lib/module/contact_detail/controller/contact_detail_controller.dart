import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import 'package:json_app/shared/util/validator/date/date.dart';
import '../view/contact_detail_view.dart';

class ContactDetailController extends State<ContactDetailView> {
  static late ContactDetailController instance;
  late ContactDetailView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());

    id = widget.item.id;
    firstName = widget.item.firstName;
    lastName = widget.item.lastName;
    email = widget.item.email;
    dob = widget.item.dob!.toDate();
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  DateTime? dob;

  update() {
    AuthService().update(
      id: id!,
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      dob: dob!.dMy,
    );
    Get.back();
  }

  remove() {
    AuthService().delete(id!);
    Get.back();
  }
}

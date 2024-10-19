import 'package:flutter/material.dart';
import 'package:json_app/core.dart';

class ContactDetailController extends State<ContactDetailView> {
  static late ContactDetailController instance;
  late ContactDetailView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());

    id = widget.item?.id;
    firstName = widget.item?.firstName;
    lastName = widget.item?.lastName;
    email = widget.item?.email;
    dob = widget.item?.dob?.toDate();
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

  bool get editMode => widget.item != null;
  bool get createMode => !editMode;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  update() {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    UserService().update(
      id: id!,
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      dob: dob!.dMy,
    );
    Get.back();
  }

  remove() {
    UserService().delete(id!);
    Get.back();
  }

  save() {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    UserService().create(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      dob: dob!.dMy,
    );

    Get.back();
  }

  String get get2DigitChar {
    var name2DigitChar = (firstName == null || firstName!.isEmpty
            ? ""
            : firstName![0].toUpperCase()) +
        (lastName == null || lastName!.isEmpty
            ? ""
            : lastName![0].toUpperCase());
    return name2DigitChar;
  }

  bool get is2DigitCharAvailable {
    if (firstName == null && lastName == null) {
      return false;
    }

    return firstName!.isNotEmpty || lastName!.isNotEmpty;
  }

  reload() {
    setState(() {});
  }

  bool get isMe => id == AuthService().userId;
}


import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import '../view/contact_detail_view.dart';

class ContactDetailController extends State<ContactDetailView> {
  static late ContactDetailController instance;
  late ContactDetailView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    